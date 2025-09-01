import 'dart:convert';

class Categorias {
  Categorias({required this.listado});

  List<Listado> listado;

  factory Categorias.fromJson(String str) => Categorias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categorias.fromMap(Map<String, dynamic> json) => Categorias(
    listado: List<Listado>.from(json["Listado"].map((x) => Listado.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class Listado {
  Listado({
    required this.categorytId,
    required this.categorytName,
    required this.categorytState,
  });

  int categorytId;
  String categorytName;
  String categorytState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
    categorytId: json["category_id"],
    categorytName: json["category_name"],
    categorytState: json["category_state"],
  );

  Map<String, dynamic> toMap() => {
    "category_id": categorytId,
    "category_name": categorytName,
    "category_state": categorytState
  };

  Listado copy() => Listado(
    categorytId: categorytId,
    categorytName: categorytName,
    categorytState: categorytState
  );
}
