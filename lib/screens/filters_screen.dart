import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName='/filters';
final Function saveFilters;
final Map<String,bool> cureentFilters;
FilterScreen(this.cureentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
bool _glutenFree=false;
bool _vegtarian=false;
bool _vegan=false;
bool _luctosFree=false;
@override
initState(){
  _glutenFree=widget.cureentFilters['gluten'];
_luctosFree=widget.cureentFilters['lactose'];
_vegtarian=widget.cureentFilters['vegetarian'];
_vegan=widget.cureentFilters['vegan'];

}
Widget _buildSwitchListTile(
  String title,
  String description,
  bool currentValue,
  Function updateValue
  ){
    return  SwitchListTile(
                    title: Text(title),
                    value:currentValue,
                    subtitle: Text(description),
                    onChanged:updateValue
              
              );
         
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Your filters'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.save),
        onPressed: (){
          final SelectFilters={
     'gluten':_glutenFree,
    'luctose':_luctosFree,
    'vegan':_vegan,
    'vegetarian':_vegtarian
    
  };
      
          widget.saveFilters(SelectFilters);
          })
      ],
      ) ,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding:EdgeInsets.all(20) ,
            child: Text('Ajust your meal'),
            
            ),
            Expanded(
              child:ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only inclue gluten-free meal',
                    _glutenFree,
                    (newValue){
                      setState(() {
                        _glutenFree=newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Luctose-free',
                    'Only inclue lucten-free meal',
                    _luctosFree,
                    (newValue){
                      setState(() {
                        _luctosFree=newValue;
                      });
                    }
                  ),
                   _buildSwitchListTile(
                    'Vegan-free',
                    'Only inclue vegan meal',
                    _vegan,
                    (newValue){
                      setState(() {
                        _vegan=newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only inclue gluten-free meal',
                    _vegtarian,
                    (newValue){
                      setState(() {
                        _vegtarian=newValue;
                      });
                    },
                  ),
                 

                ],
              ))
            ],
      ),
      );
  }
}