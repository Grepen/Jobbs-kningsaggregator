import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:jobbagregator/services/validator.dart';
import 'package:jobbagregator/services/datbase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDv2BVPBali8__arsRN0T7xGKTSc7T2lLc",
          appId: "1:477512615722:web:5a3e61828a7a6295d74053",
          messagingSenderId: "477512615722",
          projectId: "dat067-1b58f"));

    test('Data should be saved and able to be added and removed from database',()async{
    DatabaseService test = DatabaseService(jid:'test1');
    await test.addJobData("testo", "testare", "testnisien", "www.test.test", ["test","test2"]);
    print(FirebaseFirestore.instance.collection('jobAdds').where('company', arrayContainsAny: ['testo']).get());
    expect(1, 1);
  });
  */
  
  test('String should be returned with &amp not &', () {
    String testString = """Kalle&jon(inte calle)*"gick'hem""";
    final exp = RegExp(r'&amp'); 
    expect(exp.allMatches(Validator.validateString(testString, 50,0)).length,1);
  });


}