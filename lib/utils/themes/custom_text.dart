import 'package:flutter/material.dart';
import 'package:library_app/utils/screen_size.dart';

class CustomTextStyle{

  double sh;
  double sw;
  void sizeConfig(BuildContext context){
    SizeConfig().init(context);
    sh = SizeConfig.safeBlockVertical;
    sw = SizeConfig.safeBlockHorizontal;
  }
  static TextStyle headline2(BuildContext context){

    return Theme.of(context).textTheme.headline2.copyWith();
  }

}