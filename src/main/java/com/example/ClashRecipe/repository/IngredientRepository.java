package com.example.ClashRecipe.repository;

import com.example.ClashRecipe.dto.IngrResponseDto;
import com.example.ClashRecipe.entity.Ingredient.Ingredient;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IngredientRepository extends JpaRepository<Ingredient, Long> {

    @Query(nativeQuery = true, value = """
            SELECT *
            FROM ingredients
            WHERE is_unlocked = true
            """)
    public List<Ingredient> getUnlockedCards();

    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = """
            update ingredients
            set is_unlocked = true
            where id = (select id from ingredients
                        where rarity = (:rarity)
                        AND is_unlocked = false
                        order by random()
                        limit 1);
            """)
    public void unlockCard(String rarity);
}
