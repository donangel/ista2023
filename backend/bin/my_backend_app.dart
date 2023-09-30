import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

void main() {
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);

  io.serve(handler, 'localhost', 8080).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}

shelf.Response _echoRequest(shelf.Request request) {
  return shelf.Response.ok('Hello, Dart Backend!');
}
