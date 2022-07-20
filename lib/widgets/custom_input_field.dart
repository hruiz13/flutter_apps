import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? counterText;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key, 
    this.labelText, 
    this.hintText, 
    this.helperText, 
    this.counterText, 
    this.icon, 
    this.suffixIcon, 
    this.prefixIcon, 
    this.keyboardType, 
    this.obscureText, 
    required this.formProperty, 
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value){
        if(value== null) return 'No puede estar vacio';
        return value.length < 3 ? 'Minimo 3 caracteres' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        counterText: counterText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
        /* focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10)
        ),
        border: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(10),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), 
            topRight: Radius.circular(10)),
        ), */
      ),
    );
  }
}