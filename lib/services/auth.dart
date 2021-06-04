import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class AuthService {
  final Box<String> box;
  final Strapi strapi;

  AuthService({
    required this.box,
    required this.strapi,
  });

  Future<Map<String, dynamic>> login(String id, String password) async {
    final r = await strapi.http.post("/auth/local", data: {
      "identifier": id,
      "password": password,
    });

    final authResponse = r.data;

    if (box == null) {
      throw 'Not box';
    }

    await box.put('jwt', authResponse["jwt"]);
    return authResponse;
  }

  Future<void> logout() async {
    strapi.http.interceptors.clear();
    return box.delete('jwt');
  }
}
