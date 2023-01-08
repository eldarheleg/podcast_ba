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
      id: json['id'] as int,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
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
