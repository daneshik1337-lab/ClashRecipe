package com.example.ClashRecipe.mapper;

import com.example.ClashRecipe.dto.IngrResponseDto;
import com.example.ClashRecipe.entity.Ingredient.Ingredient;

public class IngrMapper {

    public static IngrResponseDto toDto(Ingredient ingredient){
        IngrResponseDto ingrResponseDto = new IngrResponseDto(
                ingredient.getId(),
                ingredient.getName(),
                ingredient.getRarity(),
                ingredient.isAllergy()
        );
        return ingrResponseDto;
    }

}
