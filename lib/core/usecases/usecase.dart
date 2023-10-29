abstract class UseCase<T, P>{
  Future<T> call(P params);
}

class NoParams {}

class SearchProductValue
{
  String? name;
  String? category;
  int ? page;
  int ? count;
  SearchProductValue(this.name,this.category,this.page,this.count);
}

class LoginData{
  String username;
  String password;
  LoginData({required this.username,required this.password});
}

class Authentication{
  bool IsAuthenticated;
  Authentication({required this.IsAuthenticated});
}