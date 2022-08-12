import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/providers/favourite_provider.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        actions: [
          InkWell(
            child: Icon(Icons.favorite),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavourites()));
            },
          ),
          SizedBox(width: 15,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context,index)
            {
              return Consumer<FavouriteProvider>(
                  builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                        if(value.selecteditems.contains(index))
                          {
                            value.removeItem(index);
                            print('removing item');
                          }
                        else
                          {
                            value.addItem(index);
                            print('adding item');
                          }
                      },
                      title: Text('Item'+index.toString()),
                      trailing: Icon(
                          value.selecteditems.contains(index)?Icons.favorite:Icons.favorite_border_outlined),
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}

class MyFavourites extends StatelessWidget {
  const MyFavourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouriteProvider=Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selecteditems.length,
                itemBuilder: (context,index)
                {
                  return Consumer<FavouriteProvider>(
                      builder: (context,value,child){
                        return ListTile(
                          onTap: (){
                            if(value.selecteditems.contains(index))
                            {
                              value.removeItem(index);
                              print('removing item');
                            }
                            else
                            {
                              value.addItem(index);
                              print('adding item');
                            }
                          },
                          title: Text('Item'+index.toString()),
                          trailing: Icon(
                              value.selecteditems.contains(index)?Icons.favorite:Icons.favorite_border_outlined),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

