package com.example.ClashRecipe.repository;

import com.example.ClashRecipe.entity.recipe.Recipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long> {


    @Query(value = """
            SELECT r.*
            FROM recipes r
            JOIN recipe_ingredients ri ON r.id = ri.recipe_id
            WHERE ri.ingredient_id IN (:ids)
            GROUP BY r.id, r.name, r.difficulty, r.description
            ORDER BY COUNT(*) DESC
            LIMIT 3;
            """,
            nativeQuery = true)
    public List<Recipe> getThreeRecipes(List<Long> ids);

}
