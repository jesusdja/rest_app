// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

MenuModel MenuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String MenuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
    String id;
    String nombre_menu;
    DateTime fecha_ini;
    DateTime fecha_fin;
    TimeOfDay hora_ini;
    TimeOfDay hora_fin;
    String categoria;
    String descripcion;

    MenuModel({
        this.id,
        this.nombre_menu = '',
        this.fecha_ini,
        this.fecha_fin,
        this.hora_fin,
        this.hora_ini,
        this.categoria,
        this.descripcion,
    });

    factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id          : json["id"],
        nombre_menu      : json["nombre_menu"],
        fecha_ini      : json["fecha_ini"],
        fecha_fin  : json["fecha_fin"],
        hora_fin     : json["hora_fin"],
        hora_ini     : json["hora_ini"],
        categoria     : json["categoria"],
        descripcion     : json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id"          : id,
        "nombre_menu"      : nombre_menu,
        "fecha_ini"      : fecha_ini,
        "fecha_fin"  : fecha_fin,
        "hora_fin"     : hora_fin,
        "hora_ini"     : hora_ini,
        "categoria"    :categoria,
        "descripcion"  : descripcion,
    };
}
