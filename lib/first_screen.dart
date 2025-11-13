import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/single.dart';

import 'multi_player.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const first_screen(),
    );
  }
}

class first_screen extends StatelessWidget {
  const first_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 113, 104, 232),

      drawerEnableOpenDragGesture: false,

      appBar: AppBar(
          elevation: 15,
          shadowColor: Color.fromARGB(106, 247, 79, 79),
          backgroundColor: Color.fromARGB(207, 26, 159, 122),
          title: const Text('Tic Tac Toe Game')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(162, 3, 113, 82),
              Color.fromARGB(161, 86, 191, 236),
              Color.fromARGB(255, 107, 43, 186),
            ],
            stops: [
              0.3,
              0.4,
              0.8,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shadowColor: Color.fromARGB(248, 70, 2, 80),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                color: Color.fromARGB(193, 237, 235, 239),
                child: const SizedBox(
                  width: 250,
                  height: 60,
                  child: Center(
                    child: Text(
                      '💜 wish a good time 💜',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                clipBehavior: Clip.antiAlias,
                shadowColor: Color.fromARGB(248, 70, 2, 80),
                elevation: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                color: Color.fromARGB(181, 41, 107, 127),
                child: const SizedBox(
                  width: 290,
                  height: 290,
                  child: Image(
                    image: AssetImage('images/tic_tac_toe_loader_.gif'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(232, 3, 113, 82),
                    elevation: 20,
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Color.fromARGB(207, 3, 113, 82)
                    //  minimumSize: MaterialStateProperty.all(const Size(230, 50)),
                    ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MultiScreen()),
                  );
                },
                child: const Text(
                  'Play With Friend',
                  style: TextStyle(fontSize: 24,color:Colors.white),

                ),
              ),
              const SizedBox(width: 50, height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Color.fromARGB(232, 3, 113, 82),
                  elevation: 20,
                  backgroundColor: Color.fromARGB(207, 3, 113, 82),
                  minimumSize: Size(225, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const single_screen()),
                  );
                },
                child: const Text(
                  'Play With Computer',
                  style: TextStyle(fontSize: 24,color:Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
