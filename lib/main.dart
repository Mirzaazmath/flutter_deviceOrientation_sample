import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const  Center(
          child: Text("One Piece"),

        ),
        actions: [
          IconButton(onPressed: (){
            setPotraitandLandscape();
          }, icon: Icon(Icons.close))
        ],
      ),
      // OrientationBuilder is used to  check the orientation
      body:OrientationBuilder(

        // by the help of orientation we can acess the device current orientation
        builder: (context,orientation) {
          //here we are checking the  orientation of the device . based on the condition either of the widget displays
          return orientation==Orientation.portrait?
            potraiteModeWidget():landscapeModeWigdet();
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // here we can get the device orientation with the help of MediaQuery
        final isprotrait=MediaQuery.of(context).orientation==Orientation.portrait;
        //here based on condition we are setting the mode of the orientation
        if(isprotrait){
          //if the device is on the protrait we are changing the mode to landscape
          setlandscape();

        }else{

          // vise versa
          sepotrait();

        }
      },
      child:const Icon(Icons.rotate_left),),

    );
  }
  // always use future because it is asycornomos functionality
  Future setlandscape()async=>
  // we ca set orientation by accessing the device using this line below

  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,]);


  Future sepotrait()async=>
    await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,]);

  // this function is used to cancel the set orientation
  Future setPotraitandLandscape()=> SystemChrome.setPreferredOrientations(DeviceOrientation.values);


// this is the potrait mode in which we are using the coloumn
  Widget potraiteModeWidget(){
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const  SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: 300,

              child: Image.asset("assets/onepi.jpg"),
            ),
            const  SizedBox(height: 20,),
            const  Text("One Piece",style: TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),),
            const  SizedBox(height: 20,),

            const Text("One Piece is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's shōnen manga magazine Weekly Shōnen Jump since July 1997, with its individual chapters compiled into 104 tankōbon volumes as of November 2022. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his pirate crew, the Straw Hat Pirates, Luffy explores the Grand Line in search of the deceased King of the Pirates Gol D. Roger's ultimate treasure known as the One Piece in order to become the next King of the Pirates.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),)

          ],

        ),
      ),
    );
  }
  // this is the landscape mode in which we are using the row
  Widget landscapeModeWigdet(){
    return  Padding(
      padding: const EdgeInsets.all(15),
      child:
        Row(

          children: [

            Container(
              alignment: Alignment.center,
              height: 300,

              child: Image.asset("assets/onepi.jpg"),
            ),
            const  SizedBox(width: 20,),
            Expanded(
              child: Column(
                children:const  [
            Text("One Piece",style: TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),

                  Text("One Piece is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha's shōnen manga magazine Weekly Shōnen Jump since July 1997, with its individual chapters compiled into 104 tankōbon volumes as of November 2022. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his pirate crew, the Straw Hat Pirates, Luffy explores the Grand Line in search of the deceased King of the Pirates Gol D. Roger's ultimate treasure known as the One Piece in order to become the next King of the Pirates.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),)



                ],
              ),
            )
            ],

        ),
      );

  }
  // Note: if you are using the on pressed event then the prefer orientation is fix set
// means you cant change the orientation by simply moving your phisical device unless you press back on onpressed event
// to overcome this we are using a function to set back the oreintation in appbar
}

