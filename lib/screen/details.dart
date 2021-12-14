import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/view.dart';
import '../model/view.dart';

class Details extends StatefulWidget {
   final int id;
    Details({required this.id});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List characters = [];
  bool isLoading = true;
  HomeController controller = HomeController();

  @override
  void initState() {
    getCharacters();
    super.initState();
  }
  void getCharacters() async {
    characters = await controller.getCharactersById(widget.id) ;
    print(characters.toString(),);
    setState(() {
       isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body:
         isLoading ? const Center(child: CircularProgressIndicator()):
        Column(
          children: [
            Hero(
              tag: characters[0]['img'].toString(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(characters[0]['img'].toString()),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
            Text(characters[0]['name'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(characters[0]['birthday'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(characters[0]['status'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(characters[0]['nickname'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(characters[0]['portrayed'].toString(),style:const  TextStyle(fontSize: 30),),


          ],
        )
        // او تبعت argument وتستقبله كاmap وبعدين تجيب الداتا الى جواه زى ك\دا
      //pushNamed(context,argument : characters[index] as navigator
      //وبعدين فى صفحه الdetails
      //details = ModalRoute.of(context)!.settings.arguments as Map<String ,dunamic>;
      //detail['img'].tostring
      //ياكدا ياكدا
          );
  }
}
