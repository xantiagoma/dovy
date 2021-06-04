import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

enum LoginResult {
  NoValid,
  InvalidCredentials,
  Success,
}

class LoginForm extends HookWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obscurePassword = useState(true);
    final id = useTextEditingController.fromValue(TextEditingValue.empty);
    final password = useTextEditingController.fromValue(TextEditingValue.empty);
    final authService = useProvider(authServiceProvider);

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
              final r =
                  await authService!.login(id.text, password.text).tryOrNull;

              showFlash(
                context: context,
                duration: Duration(seconds: 3),
                builder: (context, controller) {
                  return getMessage(
                      (r == null)
                          ? LoginResult.InvalidCredentials
                          : LoginResult.Success,
                      controller);
                },
              );

              if (r != null) {
                context.navigateTo("/home", clearStack: true);
              }
            },
          ),
        ],
      ),
    );
  }

  Flash getMessage(LoginResult result, FlashController controller) {
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

    return Flash(
      controller: controller,
      backgroundColor:
          controller.context.theme.scaffoldBackgroundColor.lighten(),
      margin: EdgeInsets.all(18),
      borderRadius: BorderRadius.circular(10),
      child: FlashBar(
        icon: icon,
        message: Text(message),
      ),
    );
  }
}
