class Job {
    final int id;
    final String title;
    final String logo;
    final String company;
    final String location;
    final String type;
    final String preference;

    Job(
            {
            required this.id,
            required this.title,
            required this.logo,
            required this.type,
            required this.location,
            required this.preference,
            required this.company
            }
       );

    factory Job.fromJson(Map<String,dynamic> json){
        return Job(id:json["id"] ,
        title: json["title"],
        logo: json["company"]["logo"],
        type:json['type']['name_en'],
        location: json['location']['name_en'],
        preference: json['workplace_preference']['name_en'],
        company: json['company']['name']);
    }
}
