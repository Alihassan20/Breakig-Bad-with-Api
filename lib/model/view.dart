class Movie{
  String? name ;
  String? image;
  Movie({this.name, this.image});

  // Movie.fromMap(Map map):name=map['name'],image=map['img'];
  //
  // Map toMap() {
  //   return {
  //     'name': name,
  //     'img':image,
  //   };
  Movie.fromJson(Map<String, dynamic> json){
    image = json['img'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'img': image,
    'name': name,
  };


  }


