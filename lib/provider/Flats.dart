import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sakkeny/provider/flat.dart';
import 'package:http/http.dart' as http ;
import 'package:provider/provider.dart';

import '../provider/current_user.dart';

class Flats with ChangeNotifier{

  List<Flat> _posts=[


  ];
  List<Flat> _searchResult=[

  ];
  List<Flat> get searchResult{
    return [..._searchResult];
  }
  List<Flat> get posts{
    return [..._posts];
  }
  List<Flat> get onlyFavPosts{
    return _posts.where((flatItem) => flatItem.isFav).toList();
  }
  List<Flat>  userPosts(var id){
    return _posts.where((flatItem) => flatItem.ownerId==id).toList();
  }
  List<Flat>  searchLocation(var id){
    return _posts.where((flatItem) => flatItem.id==id).toList();
  }

  Flat findById(String id){
    return _posts.firstWhere((element) => element.id==id);
  }

  void addPost(){
    notifyListeners();
  }
  Future<void> getPosts (BuildContext context) async{
    try {
      const url = "https://afternoon-ridge-73830.herokuapp.com/posts";
    final response =   await http.get(Uri.parse(url));
    final extractData = jsonDecode(response.body);
      final currentUser = Provider.of<CurrentUserData>(context,listen: false);
      print("the current user id is  "+ currentUser.currentUserDate.id);
    if(response.statusCode==200)
      {
        final List<Flat> loadedFlats=[] ;
        //print(extractData['Dpost'][0][0]['url']);
        var i = extractData['Dpost'].length;
        // print(extractData['Dpost'][0][0]['ownerId']);
        for(var j =0 ; j < i ; j++)
        {
          var noLikes = extractData['Dpost'][j][0]['numberOfLikes'];
          bool fav = false;
          for(var k = 0 ; k< noLikes ; k ++){
            if(extractData['Dpost'][j][0]['ownersLike'][k]['ownerId'] == currentUser.currentUserDate.id){
              print(extractData['Dpost'][j][0]['ownersLike'][k]['ownerId']);
              print(currentUser.currentUserDate.id);
              fav = true;
             // return;

            }

          }
        //  print(extractData['Dpost'][j][0]['url']);
          String userName = extractData['Dpost'][j][2];
        //  print(extractData['Dpost'][j][0]['timeAgo']);
          loadedFlats.add(Flat(
              timeAgo: extractData['Dpost'][j][0]['timeAgo'],
            id: extractData['Dpost'][j][0]['_id'],
            price: extractData['Dpost'][j][0]['price'].toDouble(),
            ownerId: extractData['Dpost'][j][0]['ownerId'],
            userName: userName ,
            userImage: extractData['Dpost'][j][3],
            description: extractData['Dpost'][j][0]['description'],
            cond: extractData['Dpost'][j][0]['conditioner'],
            tv: extractData['Dpost'][j][0]['tv'],
            wifi: extractData['Dpost'][j][0]['wifi'],
            bedrooms: extractData['Dpost'][j][0]['numberofbedrooms'],
            bed: extractData['Dpost'][j][0]['numberofbeds'],
            bathroom: 1,
            isFav: fav,
            phoneNumber: extractData['Dpost'][j][0]['phoneNumber'],
            location: extractData['Dpost'][j][0]['location'],
            images: extractData['Dpost'][j][0]['url'],
            time: DateTime.now(),
            noComments: extractData['Dpost'][j][1],
              noLikes: extractData['Dpost'][j][0]['numberOfLikes'],
              locationOnMap: extractData['Dpost'][j][0]['locationMap']
          ));
        }
        _posts=loadedFlats;
        print(loadedFlats.length.toString());
        notifyListeners();
        print(extractData);
      }
    }catch(error){
      throw(error.toString());
    }
  }
  Future<void> getSearchResult (String url) async{
    try {
      final response =   await http.get(Uri.parse(url));
      final extractData = jsonDecode(response.body);
      if(response.statusCode==200)
      {
        final List<Flat> loadedFlats=[] ;
        //print(extractData['Dpost'][0][0]['url']);
        var i = extractData['Dpost'].length;
      //  print(extractData['Dpost'][0][0]['ownerId']);
        for(var j =0 ; j < i ; j++)
        {
       //   print(extractData['Dpost'][j][0]['url']);
          String userName = extractData['Dpost'][j][2];
          loadedFlats.add(Flat(
            timeAgo: extractData['Dpost'][j][0]['timeAgo'],
              id: extractData['Dpost'][j][0]['_id'],
              price: extractData['Dpost'][j][0]['price'].toDouble(),
              ownerId: extractData['Dpost'][j][0]['ownerId'],
              userName: userName ,
              userImage: extractData['Dpost'][j][3],
              description: extractData['Dpost'][j][0]['description'],
              cond: extractData['Dpost'][j][0]['conditioner'],
              tv: extractData['Dpost'][j][0]['tv'],
              wifi: extractData['Dpost'][j][0]['wifi'],
              bedrooms: extractData['Dpost'][j][0]['numberofbedrooms'],
              bed: extractData['Dpost'][j][0]['numberofbeds'],
              bathroom: 1,
              isFav: false,
              location: extractData['Dpost'][j][0]['location'],
              images: extractData['Dpost'][j][0]['url'],
              time: DateTime.now(),
              noComments: extractData['Dpost'][j][1],
            locationOnMap: extractData['Dpost'][j][0]['locationMap'],
              noLikes: extractData['Dpost'][j][0]['numberOfLikes'],
              phoneNumber: extractData['Dpost'][j][0]['phoneNumber']
          ));
        }

        _searchResult=loadedFlats;
        print(loadedFlats.length.toString());
        notifyListeners();
        print(extractData);
      }

    }catch(error){

      throw(error.toString());
    }
  }
}