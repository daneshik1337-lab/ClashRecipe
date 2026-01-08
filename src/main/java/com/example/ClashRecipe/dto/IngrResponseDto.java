package com.example.ClashRecipe.dto;

import com.example.ClashRecipe.entity.Ingredient.Rarity;

public record IngrResponseDto(
        long id,
        String name,
        Rarity rarity,
        boolean allergy
) {}
