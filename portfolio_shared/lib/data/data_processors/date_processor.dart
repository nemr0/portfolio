class DateProcessor{

  // List of month abbreviations
 static const List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  static String resolveFromApi(String input){
    if(input.isEmpty || input == 'Present') return input;
    // Extract month and year substrings
    String monthStr = input.substring(0, 2); // '09'
    String yearStr = input.substring(2);     // '2023'

    // Convert substrings to integers
    int? month = int.tryParse(monthStr); // 9
    int? year = int.tryParse(yearStr);   // 2023
    if(month==null || year == null) return input;

    // Map month number to abbreviation
    String monthAbbreviation = months[month - 1]; // 'Sep'

    // Assemble the formatted string
    return '$monthAbbreviation. $year';
  }
}