// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    String id;
    String nombre;
    double precio;
    bool disponible;
    String fotoUrl;

    ProductoModel({
        this.id,
        this.nombre       = '',
        this.precio       = 0.0,
        this.disponible   = true,
        this.fotoUrl,
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id          : json["id"],
        nombre      : json["nombre"],
        precio      : json["precio"],
        disponible  : json["disponible"],
        fotoUrl     : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"          : id,
        "nombre"      : nombre,
        "precio"      : precio,
        "disponible"  : disponible,
        "fotoUrl"     : fotoUrl,
    };
}
