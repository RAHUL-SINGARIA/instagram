import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('you have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return FirstPage();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 80.0),
          child: Center(
            child: Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50.0,
              ),
            ),
          ),
        ),
        Container(
          width: 380.0,
          height: 50.0,
          margin: EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Log in'),
          ),
        ),
        Container(
          width: 380.0,
          height: 50.0,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.lightBlue,
            width: 2,
          )),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData.fallback(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 40.0),
            child: Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50.0,
              ),
            ),
          ),
          Container(
            width: 380.0,
            height: 50.0,
            margin: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Container(
            width: 380.0,
            height: 50.0,
            margin: EdgeInsets.all(10.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            width: 380.0,
            height: 50.0,
            margin: EdgeInsets.all(10.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
              ),
            ),
          ),
          Container(
            width: 380.0,
            height: 50.0,
            margin: EdgeInsets.all(10.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            width: 380.0,
            height: 50.0,
            margin: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Sign up'),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 20.0),
            child: Text(
              'OR',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('Log in.'),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 20.0),
            child: Text('Instagram From Facebook'),
          ),
        ],
      )),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData.fallback(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 30.0),
              child: Text(
                'Instagram',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 50.0,
                ),
              ),
            ),
            Container(
              width: 380.0,
              height: 50.0,
              margin: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              width: 380.0,
              height: 50.0,
              margin: EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('Forgot password ?'))
                ],
              ),
            ),
            Container(
              width: 380.0,
              height: 50.0,
              margin: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Log in'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 90.0, 10.0, 20.0),
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text('Sign up.'))
              ],
            )),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 140.0, 10.0, 10.0),
              child: Text('Instagram From Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Instagram',
            style: TextStyle(
              fontFamily: 'Billabong',
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.ondemand_video),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DMPage()));
            },
            icon: Icon(Icons.send_outlined),
            color: Colors.black,
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LikePage()));
              },
              icon: Icon(Icons.favorite_border_sharp),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (cotext) => ProfilePage()));
              },
              icon: Icon(Icons.person),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/image-2.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('Your Story')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1625534036193-b9a40da5ec33?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDN8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('craig_love')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1501707549080-f3aba9d978b8?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE5fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('zackjohn')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1597466297665-4af1aaa54dd7?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8cVBZc0R6dkpPWWN8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('kieron_d')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1540348744019-480ed1ef1fce?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE2fHFQWXNEenZKT1ljfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('turu_zaher')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('turu_lob')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('your_chaman')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('chal_hut')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('ashu')),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(child: Text('pratika')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBLrRYEirDef_8U2s0a0UvGi6NuELIYIoG-6RTWOejlBc59YovbsdeW8UbcecOv1h49Xw&usqp=CAU',
                  ),
                  title: Text('jacob'),
                  subtitle: Text('USA'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1626117035828-c38ad9816c43?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8QkpKTXR0ZURKQTR8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg',
                  ),
                  title: Text('Tomy'),
                  subtitle: Text('Tokyo,Japan'),
                ),
                Container(
                  height: 400.0,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621852256306-ed87b7402910?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8cm5TS0RId3dZVWt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'You Have Liked the Post',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.favorite_border_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Add a comment...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.mode_comment_outlined)),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: const Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.send_outlined)),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/profile.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text('Liked by craig_lover and 445 others'),
                ),
                Center(
                  child: Text(
                      'joshua_l The game in Japan was amazing and I want to share some photos'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DMPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Center(
          child: Text(
            'jacob_w ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.black,
          )
        ],
      ),
      body: getListView(),
    );
  }
}

Widget getListView() {
  var listView = ListView(
    children: [
      ListTile(
          title: Container(
        width: double.infinity,
        height: 35.0,
        child: new TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      )),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq6TyuDQ8Jepoq89k6YD9BZzTdNGREsoJuFEE6bfMD8Ngef4-Dq4LoGR7m0_4FTKfiCpg&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('-now'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Q3fgTcmMGq6-QLPzsqHxsqqXK9pToHWVoIz68TfWHZ-SiyQ6dj5Scc05L5gUmGZ1pis&usqp=CAU'),
        title: Text('karennne'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('I heard this is a good movie, s…'),
            Text('-now'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF5wrZNozqMgl1SlkDvYu-kX7QzbHyDtxGWNfB83A_yrAe2q57FsT1VCRc4EBf0KD--FY&usqp=CAU'),
        title: Text('martini_rond'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('See you on the next meeting!'),
            Text('· 15m'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtf4178kFsK4WCPBmtx4Cr-YHgz3T1TNP1N5eJWi8IOBI0Nte6yuhkNb2x4fpGEXyPGFA&usqp=CAU'),
        title: Text('andrewww_'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sounds good 😂😂😂'),
            Text('· 20m'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5dKIhebJBIzbpJV9vARfv1gRdIqHMpKVGCP2e-mP_W7avoGzxR-e8QM60rDugO_Hu3Ao&usqp=CAU'),
        title: Text('kiero_d'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('The new design looks cool, b…'),
            Text('· 1m'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi8EO26WdA-KDg_Hn5Wx2X2FNAOxMeycBvhgmX5lTG7yJi_vgzMPM52cpPKwOE6sPDJO8&usqp=CAU'),
        title: Text('maxjacobson'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Thank you, bro!'),
            Text('· 2h'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGk8-jfi6d8S8e8HiuISgIs6WRGNIau7pH1vuz0wdGNlEXNWhtFHYD9earnYQRc1JWh24&usqp=CAU'),
        title: Text('jamie.franco'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Yeap, I'm going to travel in To…"),
            Text('· 4h'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhGJPxvhV4u_WpRUlvawm9YpDkbtL0d8D2FlZ6HgC5JcoeHfqR-FmG0eWyeLfbATOv2EU&usqp=CAU'),
        title: Text('m_humphrey'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Instagram UI is pretty good'),
            Text('· 5h'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9Wsn1vNI6zv6iKvOUopDLjYoTUXrXL9P7KgAJs_6zIko5F7GtlWsi9LeY1s-2k4fUwXc&usqp=CAU'),
        title: Text('zackjohn'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Do you read this message?'),
            Text('· 10h'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi3lqt2_uyJ5SkAuWrFhjwd8DJNzXBwaGGOXacpXl2aECCn6fg6qFKDNcFgV1Z-XS5l18&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 1d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_34r-7LZoAZeFcQJYwZCmg-rZ5hNL50qKY2d5UKZlodNI7qbI6zCnCaNVifQk7H0bJ9E&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi94mT1BDMxfTIspFiRTeDkq8jYuBMk_T5titprdIa20mpzArxTu0ERR-9QzGW2cENpCQ&usqp=CAU'),
        title: Text('joshua_l'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Have a nice day, bro!'),
            Text('· 2d'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ),
    ],
  );
  return listView;
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(2.0),
            border: OutlineInputBorder(),
            labelText: 'search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LikePage()));
              },
              icon: Icon(Icons.favorite_border_sharp),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (cotext) => ProfilePage()));
              },
              icon: Icon(Icons.person),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: GridView.count(
        primary: false,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1625939347819-19d2797d5007?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDN8QkpKTXR0ZURKQTR8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1625939347819-19d2797d5007?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDN8QkpKTXR0ZURKQTR8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1621569977107-b0b6064504a8?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDd8YWV1NnJMLWo2ZXd8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1618777390832-5f27e30d1ca2?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM1fGFldTZyTC1qNmV3fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1591234835481-6017a62016c5?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1589111486635-6ef0430c20c9?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1589111486635-6ef0430c20c9?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1626498079062-8cb659857c4e?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
          Container(
            child: Image.network(
                'https://images.unsplash.com/photo-1626498079062-8cb659857c4e?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              color: Colors.black,
            ),
            Text(
              'jacob_w',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LikePage()));
              },
              icon: Icon(Icons.favorite_border_sharp),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (cotext) => ProfilePage()));
              },
              icon: Icon(Icons.person),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                            width: 3.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/image-1.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text('54'),
                            Text('Post'),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text('873'),
                            Text('Followers'),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text('143'),
                            Text('Following'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jacob West'),
                      Text('Digital goodies designer @pixsellz'),
                      Text('Everything is designed.'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 30.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black38,
                  )),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Edit Profile'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LikePage()));
              },
              icon: Icon(Icons.favorite_border_sharp),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (cotext) => ProfilePage()));
              },
              icon: Icon(Icons.person),
              color: Colors.black,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Folowing',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'You',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text('sri ram'),
          ),
        ],
      ),
    );
  }
}
