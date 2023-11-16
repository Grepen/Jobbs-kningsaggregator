import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobbagregator/services/afobject.dart';
import 'package:jobbagregator/services/validator.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseService {
    
    //Reference to collection
    static final CollectionReference jobAddCollection = FirebaseFirestore.instance.collection('jobAdds');
    final String jid;
    DateTime lastAfUpdate;
   /// A unique  job id must be generated as to allow storage of the new job else it will override
   /// this is a sting so could be a unique name or otheridentifier
    DatabaseService({
      required this.jid,
      required this.lastAfUpdate
    });

     // More could be added currently contact is emitted becuase of GDPR
    /// Function to add job ads to the database
    Future addJobData(String company, String title, String location, String link, String published, String deadline, List<String> tags) async{
      //block for validating all input strings
      company = Validator.validateString(company, 30);
      title = Validator.validateString(title, 30);
      location = Validator.validateString(location, 30);
      link = Validator.validateString(link, 30);
      published = Validator.validateString(published, 30);
      deadline = Validator.validateString(deadline, 30);
      for(String i in tags){
        i = Validator.validateString(i, 30);
      }

      //add the validated strings to database
      return await jobAddCollection.doc(jid).set({
        'company': company,
        'title': title,
        'location':location,
        'link':link,
        'published':published,
        'deadline':deadline,
        'tags':tags,
      });
    }
  //fetch the stream of job ads
  /// Use this to get data when an update happens
  /// requires import 'package:provider/provider.dart';
  /// import 'package:cloud_firestore/cloud_firestore.dart';
  /// check here https://www.youtube.com/watch?v=10PcEkQsF9Y&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=18
  /// or let Sebastian know
  Stream<QuerySnapshot> get jobAds{
    return jobAddCollection.snapshots();
  }

  void af2fs(int t)async{
    final Database database = await openDatabase("af_database/jobads_database_test10.db");

    final List<Map<String, dynamic>> maps = await database.query('');//not sure what to query for, probably fetch all ads since last update

    List<Afobject> afList = List.generate(maps.length, (i) {
      return Afobject(
        company: maps[i]['company'] as String,
        title: maps[i]['occupation'] as String,
        location: maps[i]['city'] as String,
        link: maps[i]['af_url'] as String,
        published: maps[i]['published'] as String,
        deadline: maps[i]['deadline'] as String,
        tags: maps[i][{'email','workplace'}] as List<String>
      );
    });
    DateTime tempTime;
    for (Afobject i in afList){
      tempTime = afString2Time(i.published);
      if(tempTime.isAfter(lastAfUpdate)){
        addJobData(i.company, i.title, i.location, i.link, i.published, i.deadline, i.tags);
      }
    }

  }

  static DateTime afString2Time(String t){
    //t format 2023-05-23T-15:59:59
    t.split('T');
    List<dynamic> t0 = t[0].split('-');//T[0]={yyyy,mm,dd}
    List<dynamic> t1 = t[1].split(':');//T[1]={hh,minmin,ss}
    List<int> t0i = t0.cast<int>();
    List<int> t1i = t1.cast<int>();
    DateTime time = DateTime(t0i[0],t0i[1],t0i[2],t1i[0],t1i[1],t1i[2]);
    return time;
  }

}