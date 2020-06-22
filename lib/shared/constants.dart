import 'package:flutter/material.dart';

const boxDecoration = BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.all(Radius.circular(20))
);
const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
        borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))
    )
);