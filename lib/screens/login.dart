import 'package:dovy/general.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginForm(),
    );
  }
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
            Button(
              text: "Submit",
              onTap: loading.value
                  ? null
                  : () async {
                      final form = formKey.form;
                      // print(FormBuilder.of(context).fields);
                      loading.value = true;
                      Flushbar msg;
                      if (form.saveAndValidate()) {
                        final data = form.value;
                        final r = await GetIt.I<AuthService>().login(
                          data["id"],
                          data["password"],
                        );
                        if (r == null) {
                          msg = Flushbar(
                            icon: Icon(
                              Icons.info_outline,
                              color: Colors.redAccent,
                            ),
                            margin: EdgeInsets.all(8),
                            duration: 2.seconds,
                            borderRadius: 8,
                            message: 'Invalid credentials',
                          );
                        } else {
                          msg = Flushbar(
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: Colors.greenAccent,
                            ),
                            margin: EdgeInsets.all(8),
                            duration: 2.seconds,
                            borderRadius: 8,
                            message: 'Logged',
                          );
                          context.navigateTo("/home", clearStack: true);
                        }
                      } else {
                        msg = Flushbar(
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.redAccent,
                          ),
                          margin: EdgeInsets.all(8),
                          duration: 2.seconds,
                          borderRadius: 8,
                          message: 'Wrong data - validations no pass',
                        );
                      }
                      loading.value = false;
                      msg.show(context);
                    },
            )
          ],
        ),
      ),
    );
  }
}
