import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.categoryList});

  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: TextStyle(fontSize: 20)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 90,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0XFFF9F9F9),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/no_image.png',
                        width: 48,
                        height: 48,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      categoryList[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
