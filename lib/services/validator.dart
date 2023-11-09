class Validator{

///tests for validating Strings for addJobData
  static String validateString(String s, int max , [int min = 0]){
    if(s.length > max || s.isNotEmpty || s.length < min){
      throw FormatException("Bad string length");
    }
    s = _stringFix(s);
    return s;
  }

  static String _stringFix(String s){
    var map = {
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#039;',
      "`": '&#039;'
    };

    final exp = RegExp(r'''[&'"><`]'''); 
    final sFixed = s.replaceAllMapped(exp, (Match m) {
    return map[m.group(0)].toString();}); 
    return sFixed;
  }
///tests for validating int for addJobData
  static int? validateInt(int? value, int max, int min, {bool allowNull=false}){
    if(allowNull && value == null){
      return null;
    }
    if(value == null || value > max || value < min){
      throw FormatException("Bad int value");
    }
    return value;
    
  }
}