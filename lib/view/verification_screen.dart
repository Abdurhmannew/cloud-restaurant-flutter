import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloudy_resturant/view/home_view.dart';

class VerificationScreen extends StatelessWidget {
  final String verificationId; // Received from the previous screen
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes =
      List.generate(6, (index) => FocusNode()); // FocusNodes for each TextField

  VerificationScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  _buildLogo(),
                  const SizedBox(height: 15),
                  _buildTitle(),
                  const SizedBox(height: 25),
                  _buildCodeInput(context),
                  const SizedBox(height: 70),
                  _buildVerifyButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        'assets/images/logo.png',
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          "التحقق",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: "Rubik",
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "ادخل الرقم الكود مكون من 6 أرقام تم ارساله رقمك",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontFamily: "Rubik",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCodeInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          return _buildCodeInputField(context, index);
        }),
      ),
    );
  }

  Widget _buildCodeInputField(BuildContext context, int index) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace &&
            controllers[index].text.isEmpty &&
            index > 0) {
          FocusScope.of(context).requestFocus(focusNodes[index - 1]);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 50,
        child: TextField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Rubik",
          ),
          decoration: InputDecoration(
            counterText: '', // Hides the character count
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index < 5) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else {
                FocusScope.of(context).unfocus(); // Remove focus if last field
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    var elevatedButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.yellow,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      ),
   onPressed: (){ Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                          );},  
   /* () async {
  String code = controllers.map((c) => c.text.trim()).join();

  if (code.length == 6) {
    try {
      print("Entered Code: $code");
      print("Verification ID: $verificationId");

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      // Sign in the user with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم تسجيل الدخول بنجاح!")),
      );

      // Navigate to the HomeView
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      print("FirebaseAuthException: $e");

      String errorMessage;
      if (e.code == 'invalid-verification-code') {
        errorMessage = "رمز التحقق غير صحيح. حاول مرة أخرى.";
      } else if (e.code == 'session-expired') {
        errorMessage = "انتهت صلاحية رمز التحقق. يرجى إعادة المحاولة.";
      } else {
        errorMessage = "حدث خطأ أثناء التحقق: ${e.message}";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      // Handle any other errors
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("حدث خطأ غير متوقع. حاول مرة أخرى.")),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("يجب إدخال رمز صحيح مكون من 6 أرقام")),
    );
  }
}
*/



      child: const Text(
        "تحقق",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontFamily: "Rubik",
        ),
      ),
    );
    return elevatedButton;
  }

  void _showCustomErrorMessage(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.1 - 50,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(195, 255, 235, 59),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Rubik",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
