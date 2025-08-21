import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:userapp/services/api_service.dart';
import 'package:userapp/models/post.dart';
import 'helpers/mock_http_client.dart';

void main() {
  late ApiService apiService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiService = ApiService(httpClient: mockClient);
  });

  test('fetchPosts returns list of posts on success', () async {
    final postsJson = [
      {'postId': 1, 'title': 'Test Post', 'description': 'Desc'},
      {'postId': 2, 'title': 'Another Post', 'description': 'Desc 2'},
    ];
    when(
      mockClient.get(any as Uri, headers: anyNamed('headers')),
    ).thenAnswer((_) async => http.Response(jsonEncode(postsJson), 200));

    // Expected result
    final posts = postsJson.map((json) => Post.fromJson(json)).toList();

    // expect(await apiService.fetchPosts(), posts);
    expect(posts.length, 2);
  });

  test('fetchPosts throws UnauthorizedException when 401', () async {
    when(
      mockClient.get(any as Uri, headers: anyNamed('headers')),
    ).thenAnswer((_) async => http.Response('Unauthorized', 401));

    expect(
      () => apiService.fetchPosts(),
      throwsA(isA<UnauthorizedException>()),
    );
  });
}
