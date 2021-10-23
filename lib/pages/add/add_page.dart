part of '../pages.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> _postFieldKey = GlobalKey<FormState>();

  var size = 0;
  var name = '';
  var avatar =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Adhisty_Zara_SK_04Dec19_IMG_0071.jpg/800px-Adhisty_Zara_SK_04Dec19_IMG_0071.jpg';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Form(
          key: _postFieldKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  maxLines: 1,
                  autofocus: true,
                  cursorColor: Colors.blueAccent,
                  decoration: InputDecoration(
                    hintText: 'Nama User',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                    fillColor: Colors.white,
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  onChanged: (inputName) {
                    setState(() {
                      name = inputName;
                    });
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Input nama lengkap!' : null,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    _getCurrenId();

                    String fname = '';
                    String lname = '';

                    if (_postFieldKey.currentState!.validate()) {
                      UserPost.postUser(name, avatar).then((value) {
                        if (name.contains(" ")) {
                          fname = name.substring(0, name.indexOf(" "));
                          lname =
                              name.substring(name.indexOf(" "), name.length);

                          var newUser = UserList(
                            id: size.toString(),
                            fname: fname,
                            lname: lname,
                            image: avatar,
                          );

                          newList!.add(newUser);
                        } else {
                          var newUser = UserList(
                            id: size.toString(),
                            fname: name,
                            lname: '',
                            image: avatar,
                          );

                          newList!.add(newUser);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Berhasil menambahkan user')),
                        );
                      });
                    }
                  },
                  child: Text('POST NEW USER'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getCurrenId() {
    UserList.getUsers("2").then((value) {
      this.size = value.length;
      print('$size');

      newList!.addAll(value);
    });
  }
}
