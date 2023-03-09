// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvancedForm extends StatefulWidget {
  const AdvancedForm({super.key});

  @override
  State<AdvancedForm> createState() => _AdvancedFormState();
}

class _AdvancedFormState extends State<AdvancedForm> {
  //*form key
  final _formKey = GlobalKey<FormState>();
  //*Password Input Filed
  TextEditingController passwordController = TextEditingController();

  bool isEmailContainsAtLeast8Char = false;
  bool isEmailContainsNumber = false;
  bool isEmailContainsCapitalCase = false;
  bool isEmailContainsSymbols = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 100.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                 "assets/webL.png",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            
            )
          ];
        },
        body: SingleChildScrollView(
          child: newMethod(),
        ),
      ),
    );
  }

  Center newMethod() {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                
                const SizedBox(
                  height: 20.0,
                ),
                //* Password Input Field
                TextFormField(
                  controller: passwordController,
                  onChanged: (val) {
                    passwordValidation(val);
                  },
                  decoration: InputDecoration(
                      hintText: "Please Write Your Password Here.",
                      hintStyle: GoogleFonts.poppins(fontSize: 10),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: Colors.tealAccent, width: 3)),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                const SizedBox(
                  height: 20,
                ),
                //*Status of Checking password  Process
                Column(
                  children: [
                    CheckPasswordWidget(
                      contains: "Capital Case",
                      keyContains: isEmailContainsCapitalCase,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CheckPasswordWidget(
                        contains: "Symbols",
                        keyContains: isEmailContainsSymbols),
                    const SizedBox(
                      height: 5,
                    ),
                    CheckPasswordWidget(
                        contains: "Number",
                        keyContains: isEmailContainsNumber),
                    const SizedBox(
                      height: 5,
                    ),
                    CheckPasswordWidget(
                        contains: "More than 8 char",
                        keyContains: isEmailContainsAtLeast8Char)
                  ],
                ),
                //* Submit Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton(
                    color: Colors.green,
                    onPressed: isEmailContainsCapitalCase &
                                isEmailContainsAtLeast8Char &
                                isEmailContainsNumber ==
                            false
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              // Scaffold.of(context).showSnackBar(
                              //     SnackBar(content: Text('Processing Data')));

                            }
                          },
                    child: const Text('Submit'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void passwordValidation(String val) {
    return setState(() {
      val.contains(RegExp('[1-9]'))
          ? isEmailContainsNumber = true
          : isEmailContainsNumber = false;
      val.contains(RegExp('[A-Z]'))
          ? isEmailContainsCapitalCase = true
          : isEmailContainsCapitalCase = false;
      val.contains(RegExp(r'[^\s\w]'))
          ? isEmailContainsSymbols = true
          : isEmailContainsSymbols = false;
      val.length > 8
          ? isEmailContainsAtLeast8Char = true
          : isEmailContainsAtLeast8Char = false;
    });
  }
}

//
class CheckPasswordWidget extends StatelessWidget {
  String contains;

  var keyContains;
  CheckPasswordWidget({
    Key? key,
    required this.contains,
    required this.keyContains,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 8,
          backgroundColor: keyContains ? Colors.green : Colors.red,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(keyContains
            ? "Password Must Contains $contains."
            : "password  Contains $contains."),
      ],
    );
  }
}
