import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

    //Reference to collection
    static final CollectionReference jobAddCollection = FirebaseFirestore.instance.collection('jobAdds');

    final String jid;

   /// A unique  job id must be generated as to allow storage of the new job else it will override
   /// this is a sting so could be a unique name or otheridentifier
    DatabaseService({
      required this.jid
    });

     // More could be added currently contact is emitted becuase of GDPR
    /// Function to add job ads to the database
    Future addJobData(String company, String title, String location, String link, List<String> tags) async{
        return await jobAddCollection.doc(jid).set({
            'company': company,
            'title': title,
            'location':location,
            'link':link,
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

  ///tests for validating Strings for addJobData
  bool validateString(String s){
    if(s.length > 30 || s.isNotEmpty){
      return false;
    }

    return true;
  }
  /*
  String stringFix(String s){
    var map = {
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#039;',
      "`": '&#039;'
    };

    final exp = new RegExp(r'\d+(?:\.\d+)?'); 
    final sFixed = s.replaceAllMapped(exp, 
        (Match m) => "<span>${m[0]}</span>"); 
    return sFixed;
  }
 */
}