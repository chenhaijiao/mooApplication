import 'dart:convert';

import 'Strings.dart';

class StringService {
  static setTagyData(key,keywords) async {
   
    try {
      List searchListData = json.decode(await Strings.getString(key));

      print(searchListData);
      var hasData = searchListData.any((v) {
        return v == keywords;
      });
      if (!hasData) {
        searchListData.add(keywords);
        await Strings.setString(key, json.encode(searchListData));
      }
      
    } catch (e) {
      List tempList = new List();
      tempList.add(keywords);
      await Strings.setString(key, json.encode(tempList));
    }
  }
  static getTagList(key) async{
     try {
      List searchListData = json.decode(await Strings.getString(key));
      return searchListData;
    } catch (e) {
      return [];
    }
  }
  static clearTagList(key) async{    
      await Strings.remove(key);
  }
  static removeTagDataByKeywords(key,keywords) async{    
      List searchListData = json.decode(await Strings.getString(key));
      searchListData.remove(keywords);
      await Strings.setString(key, json.encode(searchListData));
  }
  
  static removeTagDataById(key,id) async{    
      List searchListData = json.decode(await Strings.getString(key));
      searchListData.removeAt(id);
      await Strings.setString(key, json.encode(searchListData));
  }
}
