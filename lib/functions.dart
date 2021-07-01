import 'package:functions_framework/functions_framework.dart';
import 'package:googleapis/docs/v1.dart' as docs_pkg;
import 'package:googleapis/sheets/v4.dart' as sheets_pkg;
import 'package:googleapis/slides/v1.dart' as slides_pkg;
import 'package:googleapis_auth/auth_io.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final authClient = await clientViaApplicationDefaultCredentials(
    scopes: [
      docs_pkg.DocsApi.documentsReadonlyScope,
      sheets_pkg.SheetsApi.spreadsheetsReadonlyScope,
      slides_pkg.SlidesApi.presentationsReadonlyScope,
    ],
  );

  return Response.ok('Hello, World!');
}
