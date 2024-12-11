import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:jwt_auth_demo/features/auth/domain/auth_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://localhost:8000")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/auth/signin")
  @FormUrlEncoded()
  Future<AuthResponse> login(
    @Field("username") String username,
    @Field("password") String password,
  );

  @POST("/auth/signup")
  Future<User> register(@Body() RegisterRequest request);

  @GET("/users/me/")
  Future<User> getCurrentUser();

  @GET("/users/")
  Future<List<User>> getUsers({
    @Query("skip") int skip = 0,
    @Query("limit") int limit = 100,
  });

  @POST("/books/")
  Future<Book> createBook(@Body() Map<String, dynamic> book);

  @GET("/books/")
  Future<List<Book>> getBooks();

  @GET("/books/{id}")
  Future<Book> getBook(@Path() int id);

  @PUT("/books/{id}")
  Future<Book> updateBook(
    @Path() int id,
    @Body() Map<String, dynamic> book,
  );

  @DELETE("/books/{id}")
  Future<void> deleteBook(@Path() int id);
}
