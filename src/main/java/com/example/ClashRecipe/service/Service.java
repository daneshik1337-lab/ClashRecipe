package com.example.ClashRecipe.service;


import com.example.ClashRecipe.dto.IngrRequestDto;
import com.example.ClashRecipe.dto.IngrResponseDto;
import com.example.ClashRecipe.dto.RecipeResponseDto;
import com.example.ClashRecipe.mapper.IngrMapper;
import com.example.ClashRecipe.mapper.RecipeMapper;
import com.example.ClashRecipe.repository.IngredientRepository;
import com.example.ClashRecipe.repository.RecipeRepository;
import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@org.springframework.stereotype.Service
@RequiredArgsConstructor
public class Service {

    private final IngredientRepository ingredientRepository;
    private final RecipeRepository recipeRepository;

    public List<RecipeResponseDto> getRecipes(List<IngrRequestDto> ingrRequestDtos){
        List<Long> ingrIds = ingrRequestDtos
                .stream()
                .map(IngrRequestDto::id)
                .toList();
        return recipeRepository.getThreeRecipes(ingrIds)
                .stream()
                .map(RecipeMapper::toDto)
                .toList();
    }

    public List<IngrResponseDto> getUnlockedCards(){
        return ingredientRepository.getUnlockedCards()
                .stream()
                .map(IngrMapper::toDto)
                .toList();
    }

    public void unlockRandomCard(){

        String rarity = "UNCOMMON";
        double randomValue = ThreadLocalRandom.current().nextDouble(0, 1);
        int key = (int) (randomValue * 10);
        switch (key) {
            case 9:
                rarity = "LEGENDARY";
                break;
            case 8:
                rarity = "MYTHIC";
                break;
            case 7:
                rarity = "RARE";
                break;
            default:
                break;
        }
        ingredientRepository.unlockCard(rarity);
    }
}
