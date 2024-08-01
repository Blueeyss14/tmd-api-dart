import 'package:flutter/material.dart';
import 'package:tmdb_api_test/home/movi.dart';
import 'package:tmdb_api_test/models/movie.dart';
import 'package:tmdb_api_test/static/increment.dart';
import 'package:tmdb_api_test/widgets/item_clicked.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static int tambah = TambahData.dataDatambah;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Movie>> _movie = Movie.movieApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _movie,
        builder: (context, dynamic snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView(
              children: [
                Column(
                  children: [
                    for (int i = 0; i < snapshot.data.length; i++)
                      Column(
                        children: [
                          InkWell(
                            child: ListTile(
                              title: Text(snapshot.data[i].title),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ItemClicked(clicked: snapshot.data[i]),
                                  ));
                            },
                          )
                        ],
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(Icons.remove),
                      onTap: () {
                        setState(() {
                          TambahData.decrement();
                          HomePage.tambah = TambahData.dataDatambah;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                    ),
                    InkWell(
                      child: Icon(Icons.add),
                      onTap: () {
                        setState(() {
                          TambahData.increment();
                          HomePage.tambah = TambahData.dataDatambah;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                    ),
                    Text('${HomePage.tambah}')
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Error: ${snapshot.error}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(Icons.remove),
                      onTap: () {
                        setState(() {
                          TambahData.decrement();
                          HomePage.tambah = TambahData.dataDatambah;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                    ),
                    InkWell(
                      child: Icon(Icons.add),
                      onTap: () {
                        setState(() {
                          TambahData.increment();
                          HomePage.tambah = TambahData.dataDatambah;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                    ),
                    Text('${HomePage.tambah}')
                  ],
                ),
              ],
            ));
          } else {
            return Text("No Data");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeMov(),
              ));
        },
      ),
    );
  }
}
