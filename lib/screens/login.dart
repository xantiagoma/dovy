import 'package:dovy/general.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormBuilderState>());
    final loading = useState(false);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text(context.s.appDescription),
          FormBuilder(
            key: formKey.value,
            initialValue: {
              "id": "",
              "password": "",
            },
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  attribute: "id",
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                FormBuilderTextField(
                  attribute: "password",
                  obscureText: true,
                  maxLines: 1,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                OutlineButton(
                  onPressed: loading.value
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
                  child: Text('Submit'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
