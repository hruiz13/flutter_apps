import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class InputScreen extends StatelessWidget {
   
  const InputScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    final Map<String,String> formValues = {
      'name': '',
      'lastName': '',
      'password': '',
      'email': '',
      'role': ''
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,            
            child: Column(
              children: [
                CustomInputField(labelText: 'Nombre', hintText: 'Nombre de usuario', prefixIcon: Icons.person, formProperty: 'name', formValues: formValues,),
                const SizedBox(height: 30),
          
                CustomInputField(labelText: 'Apellido', hintText: 'Apellido de usuario', formProperty: 'lastName', formValues: formValues),
                const SizedBox(height: 30),
          
                CustomInputField(labelText: 'Correo', hintText: 'Correo de usuario', keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: formValues),
                const SizedBox(height: 30),
          
                CustomInputField(labelText: 'Contraseña', hintText: 'Contraseña de usuario', obscureText: true, formProperty: 'password', formValues: formValues,),
                const SizedBox(height: 30),

                DropdownButtonFormField<String>(
                  value: 'user',
                  items: const [
                    DropdownMenuItem(value: 'admin',child: Text('Administrador')),
                    DropdownMenuItem(value: 'user',child: Text('Usuario')),
                    DropdownMenuItem(value: 'developer',child: Text('Developer')),
                    DropdownMenuItem(value: 'jrDeveloper',child: Text('Jr. Developer')),
                  ],
                  onChanged: (value){
                    print(value);
                    formValues['role'] = value ?? 'user';
                  }
                ),
          
                ElevatedButton(
                  onPressed: (){
                    FocusScope.of(context).requestFocus( FocusNode() );

                    if(!formKey.currentState!.validate()){
                      print('Formulario no valido');
                      return;
                    }
                    print(formValues);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Enviar'))),
                )
              ],
            ),
          )
        )
      )
    );
  }
}

