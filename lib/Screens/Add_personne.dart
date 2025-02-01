import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPersonne extends StatefulWidget {
  const AddPersonne({super.key});

  @override
  State<AddPersonne> createState() => _AddPersonneState();
}

class _AddPersonneState extends State<AddPersonne> {
  File? pickedimage;
  void uploadImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var selected = File(image!.path);
    if (image != null) {
      setState(() {
        pickedimage = selected;
      });
    }
  }

  final formkey = GlobalKey<FormState>();
  String categories = 'Man';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Lost and found Personns',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a validate Name!';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a validate Name!';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'User name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le champ ne doit pas être vide';
                            }
                            if (!RegExp(r"^\d{8}$").hasMatch(value)) {
                              return 'Enter a validate number!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Phone number',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a validate text!';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Descriptions',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                DropdownButtonHideUnderline(
                    child: DropdownButton(
                        hint: Text('select a categorie'),
                        onChanged: (value) {
                          setState(() {
                            categories = value!;
                          });
                        },
                        items: [
                      DropdownMenuItem(
                        child: Text('Man'),
                        value: 'Man',
                      ),
                      DropdownMenuItem(
                        child: Text('Woman'),
                        value: 'Woman',
                      ),
                      DropdownMenuItem(
                        child: Text('Child'),
                        value: 'Child',
                      )
                    ])),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      uploadImage();
                    },
                    child:pickedimage == null?Text('choose image'):Image.file(pickedimage!)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900]),
                      onPressed: () {
                        formkey.currentState?.save();
                        if (formkey.currentState!.validate()) {}
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(color: Colors.white),
                      )),
                ),

                //TextButton(onPressed: () {}, child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
