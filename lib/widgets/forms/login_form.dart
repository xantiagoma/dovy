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
    // final formKey = useState(GlobalKey<FormBuilderState>());
    final loading = useState(false);
    final obscurePassword = useState(true);
    final id = useTextEditingController.fromValue(TextEditingValue.empty);
    final password = useTextEditingController.fromValue(TextEditingValue.empty);

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

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: id,
            decoration: dec.copyWith(
              hintText: "Identifier",
              prefixIcon: Icon(Icons.person),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  id.text = '';
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: password,
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
                onPressed: () {
                  password.text = '';
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Button(
            text: "Submit",
            onTap: () async {
              Flushbar msg;

              final r = await GetIt.I<AuthService>()
                  .login(id.text, password.text)
                  .tryOrNull;

              if (r == null) {
                msg = getMessage(LoginResult.InvalidCredentials);
              } else {
                msg = getMessage(LoginResult.Success);
                context.navigateTo("/home", clearStack: true);
              }

              msg.show(context);
            },
          ),
        ],
      ),
    );
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
