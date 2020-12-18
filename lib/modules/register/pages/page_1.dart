import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icare_profissional/modules/register/register_controller.dart';

class Page1 extends StatelessWidget {
  final RegisterController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Insira seus dados pessoais"),
        elevation: 2,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 30, right: 30),
                child: TextFormField(
                  onChanged: (value){
                    controller.user.value.firstName = value;
                  },
                  validator: (value) {
                    return controller.validateNome();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Nome', border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextFormField(
                  onChanged: (value){
                    controller.user.value.lastName = value;
                  },
                  validator: (value) {
                    return controller.validateSobrenome();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Sobrenome', border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    controller.user.value.email = value;
                  },
                  validator: (value) {
                    return controller.validateEmail();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    controller.user.value.cpf= value;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  validator: (value) {
                    return controller.validateCPF();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'CPF', border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value){
                    controller.user.value.phone = value;
                  },
                  validator: (value) {
                    return controller.validatePhone();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: 'Telefone', border: OutlineInputBorder()),
                ),
              ),
              Obx(() {
                return Container(
                  margin:
                      EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 50),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.showPassword.value,
                    onChanged: (value){
                      controller.user.value.password = value;
                    },
                    validator: (value) {
                      return controller.validatePassword();
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (controller.showPassword.value) {
                              controller.showPassword.value = false;
                            } else {
                              controller.showPassword.value = true;
                            }
                          },
                          icon: Icon(Icons.visibility),
                        )),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
