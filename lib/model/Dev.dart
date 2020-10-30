
class Dev {
  String id;
  String name;
  String email;
  String githubUserName;
  String githubProfilePicUrl;
  String location;
  List techs;

  Dev(this.name, this.githubUserName, this.githubProfilePicUrl, this.location,
      this.techs,
      {this.id});

  Dev.fromJson(Map<String, dynamic> json, String id_firebase)
      : name = json['name'],
        githubUserName = json['githubUserName'],
        githubProfilePicUrl = json['githubProfilePicUrl'],
        location = json['location'],
        techs = json['techs'],
        id = id_firebase;


  Map<String, dynamic> toMap() => {
        "name": name,
        "githubUserName": githubUserName,
        "githubProfilePicUrl": githubProfilePicUrl,
        "location": location,
        "techs": techs,
      };
  @override
  String toString() {
    return "Name:$name\nGithub user:$githubUserName\nGitHubProfilePicUrl:$githubProfilePicUrl\nLocation:$location\nTechs:$techs";
  }
}
