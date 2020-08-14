import 'package:dovy/general.dart';

enum LoginResult {
  NoValid,
  InvalidCredentials,
  Success,
}

class LoginForm extends HookWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormBuilderState>());
    final loading = useState(false);
    final obscurePassword = useState(true);

    final dec = InputDecoration(
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );

    return FormBuilder(
      key: formKey.value,
      initialValue: {
        "id": "",
        "password": "",
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FormBuilderTextField(
              decoration: dec.copyWith(
                hintText: "Identifier",
                prefixIcon: Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
              attribute: "id",
              validators: [
                FormBuilderValidators.required(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              decoration: dec.copyWith(
                hintText: "Password",
                prefixIcon: IconButton(
                  icon: Icon(
                    obscurePassword.value ? Icons.lock : Icons.lock_open,
                  ),
                  onPressed: () {
                    obscurePassword.value = !obscurePassword.value;
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
              attribute: "password",
              obscureText: obscurePassword.value,
              maxLines: 1,
              validators: [
                FormBuilderValidators.required(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (loading.value)
              CircularProgressIndicator()
            else
              Button(
                text: "Submit",
                onTap: () => onSubmit(context, formKey, loading),
              )
          ],
        ),
      ),
    );
  }

  onSubmit(
    BuildContext context,
    ValueNotifier<GlobalKey<FormBuilderState>> formKey,
    ValueNotifier<bool> loading,
  ) async {
    final form = formKey.form;
    loading.value = true;
    Flushbar msg;
    if (form.saveAndValidate()) {
      final data = form.value;
      final r = await GetIt.I<AuthService>()
          .login(
            data["id"],
            data["password"],
          )
          .tryOrNull;
      if (r == null) {
        msg = getMessage(LoginResult.InvalidCredentials);
      } else {
        msg = getMessage(LoginResult.Success);
        context.navigateTo("/home", clearStack: true);
      }
    } else {
      msg = getMessage(LoginResult.NoValid);
    }
    loading.value = false;
    msg.show(context);
  }

  Flushbar getMessage(LoginResult result) {
    Icon icon;
    String message;

    switch (result) {
      case LoginResult.Success:
        icon = Icon(
          Icons.check_circle_outline,
          color: Colors.greenAccent,
        );
        message = "Logged";
        break;
      case LoginResult.NoValid:
        message = "Wrong data - validations no pass";
        icon = Icon(
          Icons.info_outline,
          color: Colors.redAccent,
        );
        break;
      case LoginResult.InvalidCredentials:
        icon = Icon(
          Icons.info_outline,
          color: Colors.redAccent,
        );
        message = 'Invalid credentials';
        break;
      default:
        icon = Icon(
          Icons.info_outline,
          color: Colors.redAccent,
        );
        message = "Error";
        break;
    }

    return Flushbar(
      icon: icon,
      margin: EdgeInsets.all(8),
      duration: 2.seconds,
      borderRadius: 8,
      message: message,
    );
  }
}
