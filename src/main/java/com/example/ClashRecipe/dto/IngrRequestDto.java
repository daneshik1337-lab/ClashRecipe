package com.example.ClashRecipe.dto;

import com.example.ClashRecipe.entity.Ingredient.Rarity;

public record IngrRequestDto(
        long id,
        String name,
        Rarity rarity,
        boolean allergy,
        boolean isUnlocked
) {}
