import 'dart:convert';

import 'Tag.dart';

class TagService {
  static setTagyData(keywords) async {
   
    try {
      List searchListData = json.decode(await Tag.getString('TagList'));

      print(searchListData);
      var hasData = searchListData.any((v) {
        return v == keywords;
      });
      if (!hasData) {
        searchListData.add(keywords);
        await Tag.setString('TagList', json.encode(searchListData));
      }
    } catch (e) {
      List tempList = new List();
      tempList.add(keywords);
      await Tag.setString('TagList', json.encode(tempList));
    }
  }
  static getTagList() async{
     try {
      List searchListData = json.decode(await Tag.getString('TagList'));
      return searchListData;
    } catch (e) {
      return [];
    }
  }
  static clearTagList() async{    
      await Tag.remove('TagList');
  }
  static removeTagDataByKeywords(keywords) async{    
      List searchListData = json.decode(await Tag.getString('TagList'));
      searchListData.remove(keywords);
      await Tag.setString('TagList', json.encode(searchListData));
  }
  
  static removeTagDataById(id) async{    
      List searchListData = json.decode(await Tag.getString('TagList'));
      searchListData.removeAt(id);
      await Tag.setString('TagList', json.encode(searchListData));
  }
}
