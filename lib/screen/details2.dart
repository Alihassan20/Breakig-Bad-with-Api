import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailss extends StatefulWidget {
  static const routName = "/id";
  @override
  State<Detailss> createState() => _DetailssState();
}

class _DetailssState extends State<Detailss> {

  @override
  Widget build(BuildContext context) {
    var details = ModalRoute.of(context)!.settings.arguments as Map<String ,dynamic>;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body:

        Column(
          children: [
            Hero(
              tag: details['img'].toString(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(details['img'].toString()),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
            Text(details['name'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(details['birthday'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(details['status'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(details['nickname'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(details['portrayed'].toString(),style:const  TextStyle(fontSize: 30),),
            Text(details['occupation'].toString(),style:const  TextStyle(fontSize: 16),),



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
