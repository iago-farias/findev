
class Dev {
  String name;
  String email;
  String githubUserName;
  String githubProfilePicUrl;
  String location;
  List<String> techs;

  Dev(this.name, this.email, this.githubUserName, this.githubProfilePicUrl, this.location, this.techs);

  Dev.fromJson(Map<String, dynamic> json) 
    : name = json['name'],
      email = json['email'],
      githubUserName = json['githubUserName'],
      githubProfilePicUrl = json['githubProfilePicUrl'],
      location = json['location'],
      techs = json['techs'];

}