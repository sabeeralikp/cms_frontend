import 'package:cms/views/conferences/conference_admin.dart';
import 'package:cms/views/conferences/conference_user.dart';
// import 'package:cms/views/conferences/request.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      //   automaticallyImplyLeading: false,
      // ),

      body: 
         SafeArea(
          child:SingleChildScrollView(
          child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

               Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('NewsLetter'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Conference_User()),
                    );
                  },
                  child: const Text('Conferences'))
            ],
          ),
              SizedBox(height:10.0),

              Padding(padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Padding(padding: const EdgeInsets.all(10.0,),child:Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec consequat lectus. Nunc nec dui ligula. Nullam at justo sed ipsum congue fermentum. Pellentesque convallis mauris id magna fringilla tristique.'),
              ),
              ),
              ),SizedBox(height:10.0),

              Padding(padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Padding(padding: const EdgeInsets.all(10.0,),child:Text('Suspendisse sed fermentum diam. Aliquam erat volutpat. Ut lacinia quam id diam posuere, in congue nisi posuere. Nam eget purus vestibulum, vulputate est vel, ullamcorper ipsum. Quisque commodo, elit id tempus pellentesque, mauris dui vulputate dui, non consequat sapien elit sit amet mi.'),
              ),
              ),
              ),SizedBox(height:10.0),

              Padding(padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Padding(padding: const EdgeInsets.all(10.0,),child:Text('Proin dapibus mauris vel elit fringilla lacinia. Integer faucibus rutrum turpis, a aliquet nibh tristique sed. Integer tristique odio vel ligula pulvinar, id pulvinar elit elementum.'),
              ),
              ),
              ),SizedBox(height:10.0),

              Padding(padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Padding(padding: const EdgeInsets.all(10.0,),child:Text('Vestibulum id mi aliquet, feugiat turpis sed, elementum dui. Cras non nisl et odio laoreet tempus. Nullam sed facilisis odio. Curabitur malesuada ipsum a sapien consectetur tristique. Integer rhoncus erat vel quam dictum gravida.'),
              ),
              ),
              ),SizedBox(height:10.0),

              Padding(padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Padding(padding: const EdgeInsets.all(10.0,),child:Text('suscipit congue mi id semper. Integer eu fringilla mauris. Integer iaculis nunc sit amet diam scelerisque interdum. Nulla facilisi. Sed finibus mollis libero, vitae auctor enim.'),
              ),
              ),
              ),SizedBox(height:10.0),
              
              Padding(padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Padding(padding: const EdgeInsets.all(10.0,),child:Text('Integer dapibus lorem risus, a congue nunc congue non. Sed tincidunt, velit ut suscipit consectetur, ante ligula luctus massa, ac aliquam metus nisi vel odio. In eu ipsum vel massa pellentesque laoreet.'),
              ),
              ),
              ),SizedBox(height:10.0),
              
            ],
          ),
          ],
      ),
         ), ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(

        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Conference_admin(),)),
        label: Text('Hosted Conferences'),
        icon: Icon(Icons.add),
      ),
        

      //Bottom Navigation
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.red,
              onTap: (int index) {
                setState(() {
                  selectedIndex = index;
                });

                switch (index) {
                  case 0:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IndexPage()));
                    break;

                  case 1:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                    break;

                  default:
                }
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: 'Profile'),
              ],
            )
          : null,
    );
  }
}