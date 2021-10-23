part of '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UserList>> listUser;

  @override
  void initState() {
    super.initState();
    listUser = UserList.getUsers('2');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserList>>(
      future: listUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('${snapshot.data}');

          List<UserList>? list = snapshot.data;
          if (newList!.isNotEmpty) list = newList;

          return ListView.builder(
            itemCount: list!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: InkWell(
                  splashColor: Colors.blueAccent,
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(list![index].image),
                          width: 80,
                          fit: BoxFit.fill,
                          height: 80,
                          filterQuality: FilterQuality.medium,
                          errorBuilder: (context, error, trace) =>
                              const Icon(Icons.link),
                        ),
                        SizedBox(width: 4.0),
                        _cardUserName(list, index),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          print('${snapshot.data}');

          return Center(
            child: Text('Fetch data failed! - ${snapshot.error}'),
          );
        } else {
          print('${snapshot.data}');

          return Center(
            child: Text(
              'No user data',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _cardUserName(List<UserList> list, int index) => Flexible(
    child: Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 4.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            list[index].fname,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          Text(
            list[index].lname,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
  );
}
