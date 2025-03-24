import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/styles/sizes.dart';
import '../../../core/utils/extensions/context.dart';
import 'recipe_page_body.dart';
import '../widgets/add_recipe_menu.dart';

class Recipes extends ConsumerStatefulWidget {
  const Recipes({super.key});

  @override
  ConsumerState<Recipes> createState() => _RecipesState();
}

class _RecipesState extends ConsumerState<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RecipePageBody(),
      floatingActionButton: AddRecipeMenu(
        builder: (context, showMenu) => Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: context.primaryColor,
            shape: BoxShape.circle,
          ),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: showMenu,
            child: const Icon(
              Icons.add,
              size: PaddingSizes.xl,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
