import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../../repository/firabase_api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { male, female }

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();


  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();
  final _name = TextEditingController();

  var _isPasswordObscure = true;
  var _isPasswordConfirmObscure = true;

  var _isActionFavorite = false;
  var _isThrillerFavorite = false;
  var _isAdventureFavorite = false;
  var _isComicFavorite = false;
  late String? _city;
  var _bornDate = DateTime.now();
  String _btnBornLabel = "Select a Born Date";

  String _dateConverter(DateTime date) {
    final DateFormat formatter = DateFormat("yyyy-MM-dd");
    final String dateFormatted = formatter.format(date);
    return dateFormatted;
  }

  Genre? _genre = Genre.male;
  final List<String> _cities = ['Medellín', 'Bogotá', 'Cali', 'Pereira'];

  void _showDateSelector() async {
    final DateTime? newDate = await showDatePicker(
        locale: const Locale("es"),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920, 1, 1),
        lastDate: DateTime.now(),
        helpText: "Date of born");

    if (newDate != null) {
      setState(() {
        _bornDate = newDate;
        _btnBornLabel = "Born date: ${_dateConverter(newDate)}";
      });
    }
  }

  void _showErrorMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(msg),
      action:
          SnackBarAction(label: "Ok", onPressed: scaffold.hideCurrentSnackBar),
      duration: const Duration(days: 365),
    ));
  }

  void _saveUser(User user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
    Navigator.pop(context);
  }

  void _onRegisterButtonClick() {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showErrorMsg("Error: Email and Password are required");
    } else if (_password.text != _passwordConfirm.text) {
      _showErrorMsg("Passwords don't match");
    } else {
      var genre = _genre == Genre.male ? "Male" : "Female";
      var user = User(
        _name.text,
        _email.text,
        _password.text,
        _city,
        genre,
        _isActionFavorite,
        _isThrillerFavorite,
        _isAdventureFavorite,
        _isComicFavorite,
        _bornDate.toString(),
      );

      _saveUser(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 192,
                  height: 192,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      helperText: "*Required",
                      helperStyle: TextStyle(color: Colors.red),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.isValidEmail() ? null : "Email is invalid"),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _password,
                  obscureText: _isPasswordObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                      icon: Icon(_isPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    helperText: "*Required",
                    helperStyle: const TextStyle(color: Colors.red),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordConfirm,
                  obscureText: _isPasswordConfirmObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password Confirm",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordConfirmObscure =
                              !_isPasswordConfirmObscure;
                        });
                      },
                      icon: Icon(_isPasswordConfirmObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    helperText: "*Required",
                    helperStyle: const TextStyle(color: Colors.red),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Choose a genre",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownMenu<String>(
                  width: 380,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  label: const Text("Choose a city"),
                  onSelected: (String? city) {
                    setState(() {
                      _city = city;
                    });
                  },
                  dropdownMenuEntries:
                      _cities.map<DropdownMenuEntry<String>>((String city) {
                    return DropdownMenuEntry<String>(value: city, label: city);
                  }).toList(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                          title: const Text("Male"),
                          value: Genre.male,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          }),
                    ),
                    Expanded(
                      child: RadioListTile(
                          title: const Text("Female"),
                          value: Genre.female,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          }),
                    ),
                  ],
                ),
                const Text(
                  "Choose your favorite literary books",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text("Thriller"),
                        value: _isThrillerFavorite,
                        selected: _isThrillerFavorite,
                        onChanged: (bool? value) {
                          setState(() {
                            _isThrillerFavorite = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text("Adventure"),
                        value: _isAdventureFavorite,
                        selected: _isAdventureFavorite,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _isAdventureFavorite = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text("Comics"),
                        value: _isComicFavorite,
                        selected: _isComicFavorite,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _isComicFavorite = value!;
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text("Action"),
                        value: _isActionFavorite,
                        selected: _isActionFavorite,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              _isActionFavorite = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      _showDateSelector();
                    },
                    child: Text(_btnBornLabel)),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      _onRegisterButtonClick();
                    },
                    child: const Text("Register")),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
