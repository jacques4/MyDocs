class Etudiants {
  int id;
  String? nom;
  String? prenoms;
  String? dateNaissance;
  String? lieuNaissance;
  String? email;
  String? password;

  Etudiants(
      {this.id = 0,
      this.nom,
      this.prenoms,
      this.email,
      this.dateNaissance,
      this.lieuNaissance,
      this.password});

  factory Etudiants.fromJson(Map<String, dynamic> json) {
    return Etudiants(
      id: json['id'],
      nom: json['nom'],
      prenoms: json['prenoms'],
      email: json['email'],
      password: json['password'],
      dateNaissance: json['dateNaissance'],
      lieuNaissance: json['lieuNaissance'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenoms': prenoms,
      'email': email,
      'password': password,
      'dateNaissance': dateNaissance,
      'lieuNaissance': lieuNaissance,
    };
  }

  @override
  String toString() {
    return "Users{id : $id,nom :$nom, prenoms:$prenoms, email:$email,password:$password,dateNaissance:$dateNaissance,lieuNaissance:$lieuNaissance}";
  }
}
