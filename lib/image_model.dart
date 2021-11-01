
class ImageModel{
  late final String message;

  ImageModel(this.message);

  ImageModel.fromJson(Map <String , dynamic> parsedJson)  //named constructor
  {
    message = parsedJson['message'];
  }
}