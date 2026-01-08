package com.example.ClashRecipe.controller;

import com.example.ClashRecipe.dto.IngrRequestDto;
import com.example.ClashRecipe.dto.IngrResponseDto;
import com.example.ClashRecipe.dto.RecipeResponseDto;
import com.example.ClashRecipe.service.Service;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class Controller {

    private final Service service;

    @GetMapping("/ingredients/getUnlockedCards")
    public ResponseEntity<List<IngrResponseDto>> getUnlockedIngrCards(){
        List<IngrResponseDto> ingrResponseDtos = service.getUnlockedCards();
        return ResponseEntity.ok().body(ingrResponseDtos);
    }

    @PostMapping("/recipe/getRecipes")
    public ResponseEntity<List<RecipeResponseDto>> getRecipes
            (@RequestBody List<IngrRequestDto> ingrRequestDtos) {
        List<RecipeResponseDto> responseDtos = service.getRecipes(ingrRequestDtos);
        return ResponseEntity.ok().body(responseDtos);
    }

    @PostMapping("/ingredients/UnlockRandomCard/")
    public ResponseEntity<Void> UnlockRandomCard(){
        service.unlockRandomCard();
        return ResponseEntity.ok().build();
    }



}
