package com.example.ClashRecipe.entity.Ingredient;

import com.example.ClashRecipe.entity.recipe.Recipe;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Entity
@Table(name = "ingredients")
@Getter
@Setter
public class Ingredient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    // Редкость енум
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Rarity rarity;

    // Флаг аллергена
    @Column(nullable = false)
    private boolean allergy;

    @Column(name = "is_unlocked")
    private boolean isUnlocked;

    @ManyToMany(mappedBy = "ingredients")
    private Set<Recipe> recipes;
}
