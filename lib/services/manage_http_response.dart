import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void manageHttpResponse(
    {required http.Response response, //the http response from the request
    required BuildContext context, //the context is to show on snackbar
    required VoidCallback
        onSuccess //the callback to execute on a successful response
    }) {
  //switch statement to handle different fttp status code
  switch (response.statusCode) {
    case 200: //status code 200 indicate that the API response is success
      onSuccess();
      break;
    case 400: //status code for bad requests response
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500: //status code 500 indicates a server error
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: //status code 201 indicates a resource is created successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
