import 'package:html/parser.dart';


String DeleteTagHtml(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body?.text).documentElement?.text ?? '';
  return parsedString;
}
