import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../models/recipe_model/recipe_model.dart';

class RecipeImageAndButton extends StatelessWidget {
  const RecipeImageAndButton({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CachedNetworkImage(
          imageUrl: recipe.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        Positioned(
          bottom: -35,
          left: 0,
          right: 0,
          child: Center(
            child: SizedBox(
              width: 190,
              height: 70,
              child: AppButton(
                title: "Start Cooking",
                textStyle: AppTextStyles().mThick.copyWith(color: Colors.white),
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
