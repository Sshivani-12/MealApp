import 'package:flutter/material.dart';
import '../dummy.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName ='/meal-detail'; 
  @override
  Widget build(BuildContext context) {

  final mealId=ModalRoute.of(context).settings.arguments as String;
 final selectMeal=DUMMY_MEALS.firstWhere(
   (meal)=>meal.id==mealId);
  return Scaffold(
appBar: AppBar(title:Text('${selectMeal.title}')),
    body: Column(
      children: <Widget>[
        Container
        (height:300,
        width:double.infinity,
        child:Image.network(selectMeal.imageUrl,
         fit:BoxFit.cover)),
         Container(
           child: Text('Ingrediants',
         style: TextStyle(fontSize: 30),
         ),
         ),
         Container(
           margin: EdgeInsets.all(10),
           height: 200,
           
           child: ListView.builder(
             itemBuilder:(ctx,index)=>Card(
               color:Colors.yellow,
               
               child: Text(selectMeal.ingredients[index]),

             ),
             itemCount: selectMeal.ingredients.length,

           )),
           Divider(),
      ],

    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.delete),
      onPressed: (){
      Navigator.of(context).pop(mealId);
        
      }
    ),);
  }
}