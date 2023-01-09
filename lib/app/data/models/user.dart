class User {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  User( 
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password
      };
}
