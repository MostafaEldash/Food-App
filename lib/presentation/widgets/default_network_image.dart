import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageURL;
  final BoxFit? fit;

  const DefaultNetworkImage(
      {Key? key, this.height, this.width, required this.imageURL, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageURL.isNotEmpty) {
      return Image.network(
        imageURL,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: CircularProgressIndicator(
                  strokeWidth: 4.sp,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null),
            );
          }
        },
        errorBuilder: (context, error, stackTrace){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50.sp,
                ),
              ],
            ),
          );
        },
      );
    }else{
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 75.sp,
            ),
          ],
        ),
      );
    }
  }
}
