
class Dev {
  String nome;
  String email;
  String githubUserName;
  String githubProfilePicUrl;
  String whatsapp;
  List<String> techs;

  Dev(this.nome, this.email, this.githubUserName, this.whatsapp ,this.techs);

  Dev.fromJson(Map<String, dynamic> json) 
    : nome = json['name'],
      email = json['email'],
      githubUserName = json['githubUserName'],
      whatsapp = json['whatsapp'],
      techs = json['techs'];

}