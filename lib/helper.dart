class RecipeModel {
  String applabel;
  String appimgUrl;
  double appcalories;
  String appurl;

  RecipeModel(
      {this.applabel = "LABEL",
      this.appcalories = 0.000,
      this.appimgUrl = "IMAGE",
      this.appurl = "URL"});
  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
        applabel: recipe["label"],
        appcalories: recipe["calories"],
        appimgUrl: recipe["image"],
        appurl: recipe["url"]);
  }
}
