import 'package:flutter/material.dart';
import 'package:movie/model/view.dart';
import 'package:movie/screen/details.dart';

import '../controller/view.dart';
import 'details2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {


  bool isLoading = true;
  HomeController controller = HomeController();
  List characters = [];
@override
  void initState() {
  getCharacters();
  print("yes");
  super.initState();
  }

  void getCharacters() async {
    characters = await controller.getCharacters();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.blueGrey,
        title:const  Text("Breaking Bad"),
      ),
        body: isLoading ? const Center(child: CircularProgressIndicator()):
        ListView.builder(
          itemCount: characters.length,
          itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),topRight:  Radius.circular(50),
                bottomLeft:  Radius.circular(15),bottomRight: Radius.circular(15),
              )
            ),
            color: Colors.blueGrey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                     Navigator.pushNamed(context, Detailss.routName,arguments: characters[index]);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_){return Details(id: characters[index]['char_id'],);}));
                    // print(characters[index]['char_id']);
                  },
                  child: Hero(
                    tag: characters[index]['img'],
                    child: Container(
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(characters[index]['img']),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: MediaQuery.of(context).size.height*0.5,),
                  ),
                ),
                Container(
                  height: 50,
                    child: Center(child: Text(characters[index]['name'],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)))
              ],
            ),
          );

        },)
    );
  }
}
