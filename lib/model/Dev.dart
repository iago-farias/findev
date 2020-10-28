
class Dev {
  String nome;
  String email;
  String githubUserName;
  String githubProfilePicUrl;
  String location;
  List<String> techs;

  Dev(this.nome, this.email, this.githubUserName, this.githubProfilePicUrl, this.location, this.techs);

  Dev.fromJson(Map<String, dynamic> json) 
    : nome = json['name'],
      email = json['email'],
      githubUserName = json['githubUserName'],
      githubProfilePicUrl = json['githubProfilePicUrl'],
      location = json['location'],
      techs = json['techs'];

}