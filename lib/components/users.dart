class User {
  final String name;
  final String imageUrl;

  User({required this.name, required this.imageUrl});
}

final List<User> users = [
  User(name: 'João', imageUrl: 'assets/profile1.png'),
  User(name: 'Parasita 1', imageUrl: 'assets/profile2.png'),
  User(name: 'Professor', imageUrl: 'assets/profile3.png'),
  User(name: 'Mãe', imageUrl: 'assets/profile4.png'),
  User(name: 'Vizinha', imageUrl: 'assets/profile5.png'),
  // Adicione outros usuários aqui
];
