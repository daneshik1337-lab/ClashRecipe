package com.example.ClashRecipe.dto;

import com.example.ClashRecipe.entity.recipe.Difficulty;

public record RecipeResponseDto(
        long id,
        String name,
        Difficulty difficulty,
        String description
) {}
