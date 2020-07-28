import 'package:flutter/material.dart';
import 'package:flutter_task/Models/Badg.dart';
import 'package:flutter_task/Models/Winner.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AchievementScreen extends StatefulWidget {
  @override
  _AchievementScreenState createState() => _AchievementScreenState();
}


class _AchievementScreenState extends State<AchievementScreen> {
  List<Bage> listBadges = [
    Bage("Badge Name","assets/images/Badge.png"),
    Bage("Badge Name","assets/images/Badge.png"),
    Bage("Badge Name","assets/images/Badge.png"),
    Bage("Badge Name","assets/images/Badge.png"),
    Bage("Badge Name","assets/images/Badge.png"),
    Bage("Badge Name","assets/images/Badge.png"),
    Bage("Badge Name","assets/images/Badge.png"),
    Bage("Badge Name","assets/images/Badge.png"),


  ];
  List<Winner> lisWinners = [
    Winner("Omar Khaled","#1","2000 Points"),
    Winner("Yehyia Ahmed","#2","2000 Points"),
    Winner("Mazen Zeen","#3","2000 Points"),
    Winner("Ahmed Hassan","#4","1000 Points"),
    Winner("Mohamed Zein","#5","950 Points"),
    Winner("Aya Hassan","#6","900 Points"),
    Winner("Ahmed Hassan","#7","800 Points"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
            width: 30,
            child: BackButton(color: Colors.black,)),

        title: Center(
          child: Container(
              width: 200,
              child: Image.asset("assets/images/Logo.png")),
        ),

        backgroundColor: Color(0xffEDF5F8),
        actions: <Widget>[
          Container(
              width: 30,
              child: Image.asset("assets/images/Search.png")),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          BackGround(context),
          Body(),
        ],
      ),
    );
  }

  Widget Body() {
    return Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),

              ProgressView(),
              SizedBox(
                height: 5,
              ),
              BageScroller(),
              Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: WinnersView(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/Background-2.png",fit: BoxFit.fill,),)

              ]),
              SizedBox(
                height: 10,
              ),
              BottomScroller()



            ],
          ),
        ));
  }


  Widget BageScroller() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) {
          return BadgeItem(listBadges[position].image,listBadges[position].name);
        },
        itemCount: listBadges.length,
      ),
    );
  }
  Widget WinnersView() {
    return Container(
      height: 170,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WinnerItem("assets/images/Silver.png",lisWinners[1].name,Color(0xffEDF5F8),Colors.black),
          WinnerItem("assets/images/Gold.png",lisWinners[0].name,Colors.red,Colors.white),
          WinnerItem("assets/images/Bronze.png",lisWinners[2].name,Color(0xffEDF5F8),Colors.black),

        ],
      ),
    );


  }
  Widget BottomScroller() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          int index = position + 3;
          return BottomWinnerItem(lisWinners[index ].number,lisWinners[index].name,lisWinners[index].points);
        },
        itemCount: lisWinners.length - 3,
      ),
    );
  }
  Widget ProgressView(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:  BoxDecoration(
          color: Color(0xff17365D),

          borderRadius:  BorderRadius.all(Radius.circular(3)),),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("PROGRESS OVERALL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    new LinearPercentIndicator(
                      width: 340,
                      lineHeight: 6.0,
                      percent: 0.8,
                      backgroundColor: Colors.white70,
                      progressColor: Colors.orange,
                    ),
                    SizedBox(width: 10),

                    Text("86%",style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
  Widget BackGround(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/images/Background.png",fit: BoxFit.fill,),
    );
  }


  // Items
  Widget BadgeItem(String imageUrl, String name) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10,),
        Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 30.0,
                  child: Image.asset(imageUrl),
                  backgroundColor: Colors.transparent,
                ),
                height: 60,
                width: 60,
              ),
              Text(name)
            ],
          ),
        ),
      ],
    );
  }
  Widget WinnerItem(String imageUrl, String name,Color color,Color textColors) {
    return Card(
      color: color,
      child: Row(

        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child:Image.asset(imageUrl),
                  height: 110,
                  width: 125,
                ),
                SizedBox(height: 10,),
                Text(name,style:TextStyle(color: textColors,fontWeight: FontWeight.bold,fontSize: 13),),
                Text("2000 Points",style:TextStyle(color: textColors,fontSize: 10),)

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget BottomWinnerItem(String number, String name,String points) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ) ,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 47,
                    decoration: BoxDecoration(
                        color:Color(0xffEDF5F8) ,
                        borderRadius:BorderRadius.only(
                            topLeft:Radius.circular(10) ,
                            bottomLeft: Radius.circular(10)
                        )),
                    child: Center(child: Text(number,style: TextStyle(color: Color(0xffD2A13B),fontWeight: FontWeight.bold,fontSize: 18))),
                  ),
                  SizedBox(width: 10,),
                  Text(name,style:TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 13),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(points,style:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
              ),
            ],
          ) ,

        ),
      ),
    );
  }

}
