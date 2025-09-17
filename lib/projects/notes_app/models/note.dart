import 'dart:convert';

class Note{
  String title;
  String content;
  
  Note({required this.title, required this.content});
  
  factory Note.fromJsom(Map<String, dynamic> json){
    
    return Note(
      title: json['title'],
      content: json['content']
    );
    
  }
  
  Map<String, dynamic> toJson(){
    return {
      'title' : title,
      'content' : content
    };
  }
  
  String toJsonString(){
    return jsonEncode(toJson());
  }
  
  static Note fromJsonString(String jsonString){
    return Note.fromJsom(jsonDecode(jsonString));
  }
}