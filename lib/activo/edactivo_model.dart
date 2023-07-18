import 'dart:io';

class EditarActivoModel {
  int? id;
  String? descripcion;
  DateTime? dia;
  int? costo;
  String? lugar;
  String? marca;
  String? modelo;
  int? serial;
  String? foto;
  File? fotoFile;

  // Agrega aquí los demás campos que desees editar

  EditarActivoModel(
      {this.id,
      this.descripcion,
      this.dia,
      this.costo,
      this.lugar,
      this.marca,
      this.modelo,
      this.serial,
      this.foto

      // Inicializa los demás campos aquí si es necesario
      });
}
