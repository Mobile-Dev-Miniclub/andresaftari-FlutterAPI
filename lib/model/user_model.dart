part of 'models.dart';

class UserList {
  static final String _baseURL = 'https://reqres.in/api/users';
  final String id, fname, lname, image;

  UserList({
    required this.id,
    required this.fname,
    required this.lname,
    required this.image,
  });

  factory UserList.fromJson(Map<String, dynamic> json) =>
      UserList(
        id: json['id'].toString(),
        fname: json['first_name'],
        lname: json['last_name'],
        image: json['avatar'],
      );

  static Future<List<UserList>> getUsers(String page) async {
    Uri url = Uri.parse("$_baseURL?page=$page");

    var res = await http.get(url);
    var jsonObj = json.decode(res.body);
    List<dynamic> data = (jsonObj as Map<String, dynamic>)['data'];
    List<UserList> users = [];

    data.forEach((element) {
      users.add(UserList.fromJson(element));
    });

    return users;
  }
}

class UserPost {
  static final String _baseURL = 'https://reqres.in/api/users';
  final String id, name, avatar, created; // DIGANTI KE AVATAR KARENA BIAR PAS AJA GITU SAMA CARD NYA :)

  UserPost({
    required this.id,
    required this.name,
    required this.avatar,
    required this.created,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) =>
      UserPost(
        id: json['id'].toString(),
        name: json['name'],
        avatar: json['job'],
        created: json['createdAt'],
      );

  static Future<UserPost> postUser(String name, String avatar) async {
    Uri url = Uri.parse("$_baseURL");

    var res = await http.post(url, body: { 'name': name, 'job': avatar},);
    var jsonObj = json.decode(res.body);

    return UserPost.fromJson(jsonObj);
  }
}
