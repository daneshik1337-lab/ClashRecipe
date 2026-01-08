package com.example.ClashRecipe.mapper;

import com.example.ClashRecipe.dto.RecipeResponseDto;
import com.example.ClashRecipe.entity.recipe.Recipe;

public class RecipeMapper {

    public static RecipeResponseDto toDto(Recipe recipe){
        RecipeResponseDto recipeResponseDto = new RecipeResponseDto(
                recipe.getId(),
                recipe.getName(),
                recipe.getDifficulty(),
                recipe.getDescription()
        );
        return recipeResponseDto;
    }
}
