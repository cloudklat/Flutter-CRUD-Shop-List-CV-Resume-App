import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> warteg = ['Ikan Teri', 'Ikan Nila', 'Ikan Tongkol'];

  List<double> prices = [10.000, 11.000, 12.000];
  final textController = TextEditingController();
  int? wartegIndex;
  IconData buttonIcon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Toko",
        theme: ThemeData(brightness: Brightness.dark),
        // theme: ThemeData(primarySwatch: Colors.blue),
        // darkTheme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
            appBar: AppBar(
                title: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                      ),
                    ),
                    ElevatedButton(
                      child: Icon(buttonIcon),
                      onPressed: () {
                        setState(() {
                          if (wartegIndex != null) {
                            warteg[wartegIndex!] = textController.text;
                            wartegIndex = null;
                            buttonIcon = Icons.add;
                            textController.clear();
                          } else {
                            warteg.add(textController.text);
                            textController.clear();
                          }
                          textController.clear();
                        });
                        print(warteg);
                      },
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mark_unread_chat_alt_outlined))
                ]),
            body: ListView.builder(
              itemCount: warteg.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  title: Text(warteg[index]),
                  trailing: const Text('\$-'),
                  onTap: () {
                    wartegIndex = index;
                    setState(() {
                      textController.text = warteg[index];
                      buttonIcon = Icons.save;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      warteg.removeAt(index);
                    });
                  },
                ));
              },
            ),
            drawer: Drawer(
              elevation: 20.0,
              child: Column(children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                  ),
                  accountName: Text("Nanang Priambudi"),
                  accountEmail: Text("nanangpad@proton.me"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    child: Text("nngpad"),
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("menu 1 pressed");
                  },
                  leading: Icon(Icons.inbox_rounded),
                  title: Text("Kotak Masuk"),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.nine_k_plus_sharp)),
                ),
                Divider(
                  height: 0.1,
                ),
                ListTile(
                  onTap: () {
                    print("menu 2 pressed");
                  },
                  leading: Icon(Icons.star_border_rounded),
                  title: Text("Berbintang"),
                ),
                ListTile(
                  onTap: () {
                    print("menu 3 pressed");
                  },
                  leading: Icon(Icons.more_time_rounded),
                  title: Text("Ditunda"),
                ),
                ListTile(
                  onTap: () {
                    print("menu 4 pressed");
                  },
                  leading: Icon(Icons.content_paste_go_rounded),
                  title: Text("Draf"),
                ),
                ListTile(
                  onTap: () {
                    print("menu 5 pressed");
                  },
                  leading: Icon(Icons.label_outline_rounded),
                  title: Text("Kategori"),
                ),
                ListTile(
                  onTap: () {
                    print("menu 6 pressed");
                  },
                  leading: Icon(Icons.settings_outlined),
                  title: Text("Kelola Label"),
                ),
                Spacer(),
                ListTile(
                  onTap: () {
                    print("menu 7 pressed");
                  },
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Logout"),
                )
              ]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.lightBlueAccent,
              unselectedItemColor: Colors.white60,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.paypal_rounded),
                  label: "Bayar",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_rounded),
                  label: "Notifikasi",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined), label: "Akun")
              ],
            )));
  }
}
