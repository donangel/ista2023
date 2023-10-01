import 'dart:convert';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

shelf.Response _addCorsHeaders(shelf.Response response) {
  return response.change(headers: {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Origin, Content-Type',
  });
}

void main() {
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_router);

  io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}

shelf.Response _router(shelf.Request request) {
  switch (request.url.path) {
    case 'users':
      return _addCorsHeaders(_usersHandler(request));
    default:
      return shelf.Response.notFound('Not Found');
  }
}

shelf.Response _usersHandler(shelf.Request request) {
  final users = [
    {'id': 1, 'name': 'Alice', 'email': 'alice@example.com'},
    {'id': 2, 'name': 'Bob', 'email': 'bob@example.com'},
    {'id': 3, 'name': 'Charlie', 'email': 'charlie@example.com'},
    {'id': 4, 'name': 'David', 'email': 'david@example.com'},
    {'id': 5, 'name': 'Eva', 'email': 'eva@example.com'},
  ];

  return shelf.Response.ok(json.encode(users),
      headers: {'content-type': 'application/json'});
}
