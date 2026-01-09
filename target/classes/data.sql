-- ==========================
-- Таблица ингредиентов
-- ==========================
CREATE TABLE IF NOT EXISTS ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    rarity VARCHAR(20) NOT NULL,
    allergy BOOLEAN NOT NULL,
    is_unlocked BOOLEAN NOT NULL
);

-- ==========================
-- Таблица рецептов
-- ==========================
CREATE TABLE IF NOT EXISTS recipes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    difficulty VARCHAR(20) NOT NULL,
    description TEXT NOT NULL
);

-- ==========================
-- Связующая таблица рецепт-ингредиент
-- ==========================
CREATE TABLE IF NOT EXISTS recipe_ingredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

-- ==========================
-- Ингредиенты (20 шт)
-- ==========================
INSERT INTO ingredients (name, rarity, allergy, is_unlocked) VALUES
('Куриное филе','UNCOMMON',false,false),
('Говяжий фарш','UNCOMMON',false,false),
('Свинина','UNCOMMON',false,false),
('Лосось','RARE',true,false),
('Креветки','RARE',true,false),
('Яйца куриные','COMMON',true,true),
('Молоко','COMMON',true,true),
('Сливки','COMMON',true,true),
('Сметана','COMMON',true,true),
('Сыр Чеддер','RARE',true,false),
('Пармезан','RARE',true,false),
('Моцарелла','RARE',true,false),
('Творог','COMMON',true,true),
('Йогурт натуральный','UNCOMMON',true,false),
('Сливочное масло','COMMON',true,true),
('Картофель','COMMON',false,true),
('Морковь','COMMON',false,true),
('Репчатый лук','COMMON',false,true),
('Чеснок','UNCOMMON',false,false),
('Помидоры','COMMON',false,true),
('Огурцы','COMMON',false,true),
('Болгарский перец','COMMON',false,true),
('Брокколи','UNCOMMON',false,false),
('Цветная капуста','RARE',false,false),
('Шпинат','RARE',false,false),
('Салат айсберг','RARE',false,false),
('Руккола','RARE',false,false),
('Кабачки','UNCOMMON',false,false),
('Баклажаны','UNCOMMON',false,false),
('Шампиньоны','UNCOMMON',false,false),
('Спаржа','RARE',false,false),
('Зеленый горошек','UNCOMMON',false,false),
('Кукуруза','UNCOMMON',false,false),
('Рис белый','COMMON',false,true),
('Гречневая крупа','COMMON',false,true),
('Булгур','RARE',false,false),
('Киноа','RARE',false,false),
('Макаронные изделия','COMMON',false,true),
('Овсяные хлопья','UNCOMMON',false,false),
('Мука пшеничная','COMMON',false,true),
('Сахар','COMMON',false,true),
('Мед','RARE',false,false),
('Паприка','RARE',false,false),
('Орегано','RARE',false,false),
('Базилик свежий','MYTHIC',false,false),
('Укроп','UNCOMMON',false,false),
('Петрушка','UNCOMMON',false,false),
('Лавровый лист','UNCOMMON',false,false),
('Оливковое масло','COMMON',false,true),
('Подсолнечное масло','COMMON',false,true),
('Уксус столовый','COMMON',false,true),
('Уксус бальзамический','MYTHIC',false,false),
('Соевый соус','RARE',false,false),
('Томатная паста','UNCOMMON',false,false),
('Лимон','UNCOMMON',false,false),
('Яблоки','COMMON',false,true),
('Бананы','COMMON',false,true),
('Клубника','UNCOMMON',false,false),
('Авокадо','MYTHIC',false,false),
('Фасоль консервированная','UNCOMMON',false,false),
('Нут консервированный','RARE',false,false),
('Тунец консервированный','MYTHIC',true,false),
('Белое вино','LEGENDARY',true,false),
('Горчица','RARE',false,false),
('Майонез','COMMON',false,true),
('Кетчуп','COMMON',false,true),
('Каперсы','RARE',false,false),
('Анчоусы','MYTHIC',true,false),
('Водоросли нори','RARE',false,false),
('Миндаль','MYTHIC',true,false),
('Изюм','UNCOMMON',false,false),
('Черный шоколад','MYTHIC',true,false),
('Фуа-гра','RARE',true,false),
('Устрицы','LEGENDARY',true,false),
('Икра черная (осетровая)','LEGENDARY',true,false),
('Икра красная (лососевая)','MYTHIC',true,false),
('Краб камчатский','LEGENDARY',true,false),
('Мясо краба','MYTHIC',true,false),
('Морские гребешки','MYTHIC',true,false),
('Трюфели','LEGENDARY',false,false),
('Говядина мраморная','LEGENDARY',true,false),
('Перепела','MYTHIC',true,false),
('Утиная грудка','MYTHIC',true,false),
('Угорь','LEGENDARY',true,false),
('Голубой сыр с плесенью','RARE',true,false),
('Прошутто','RARE',true,false),
('Артишоки','RARE',false,false),
('Спаржа белая','RARE',false,false)
ON CONFLICT (name) DO NOTHING;

-- ==========================
-- Рецепты (10 шт)
-- ==========================
INSERT INTO recipes (name, difficulty, description) VALUES
('Яичница', 'EASY', 'Жареные куриные яйца'),
('Омлет', 'EASY', 'Омлет на молоке'),
('Картофельное пюре', 'EASY', 'Отварной картофель со сливочным маслом'),
('Картофель жареный', 'EASY', 'Жареный картофель с луком'),
('Рис отварной', 'EASY', 'Классический белый рис'),
('Гречка с маслом', 'EASY', 'Гречневая каша со сливочным маслом'),
('Паста с сыром', 'EASY', 'Макароны с сыром'),
('Паста с томатной пастой', 'EASY', 'Паста в томатном соусе'),
('Овсяная каша', 'EASY', 'Овсяные хлопья на молоке'),
('Творог с медом', 'EASY', 'Творог с натуральным медом'),

('Куриное филе на сковороде', 'EASY', 'Обжаренное куриное филе'),
('Куриное филе с чесноком', 'EASY', 'Курица с чесноком'),
('Свинина жареная', 'MEDIUM', 'Свинина на сковороде'),
('Говяжий фарш с луком', 'MEDIUM', 'Обжаренный фарш с луком'),
('Курица с рисом', 'MEDIUM', 'Куриное филе с рисом'),

('Салат из помидоров и огурцов', 'EASY', 'Классический овощной салат'),
('Салат с авокадо', 'MEDIUM', 'Авокадо с овощами'),
('Салат с рукколой и пармезаном', 'MEDIUM', 'Руккола с сыром'),
('Салат айсберг с курицей', 'MEDIUM', 'Курица с салатом айсберг'),
('Овощное рагу', 'MEDIUM', 'Тушеные овощи'),

('Лосось жареный', 'MEDIUM', 'Филе лосося на сковороде'),
('Лосось с лимоном', 'MEDIUM', 'Лосось с лимонным соком'),
('Креветки жареные', 'MEDIUM', 'Обжаренные креветки'),
('Креветки с чесноком', 'MEDIUM', 'Креветки с чесноком'),
('Тунец с рисом', 'MEDIUM', 'Консервированный тунец с рисом'),

('Сырники', 'EASY', 'Творожные сырники'),
('Блины', 'EASY', 'Блины из муки и молока'),
('Оладьи', 'EASY', 'Оладьи на молоке'),
('Шоколадный десерт', 'MEDIUM', 'Десерт из шоколада'),
('Фрукты с йогуртом', 'EASY', 'Фрукты с натуральным йогуртом'),

('Пицца маргарита', 'MEDIUM', 'Моцарелла и томаты'),
('Паста карбонара', 'MEDIUM', 'Паста с сыром и яйцом'),
('Паста с пармезаном', 'EASY', 'Паста с сыром'),
('Ризотто', 'MEDIUM', 'Рис со сливками'),
('Запеканка творожная', 'MEDIUM', 'Запеканка из творога'),

('Брускетта с томатами', 'EASY', 'Хлеб с томатами'),
('Брускетта с авокадо', 'MEDIUM', 'Авокадо на тосте'),
('Суп овощной', 'MEDIUM', 'Легкий овощной суп'),
('Суп куриный', 'MEDIUM', 'Куриный бульон'),
('Суп грибной', 'MEDIUM', 'Суп из шампиньонов'),

('Рыба с овощами', 'MEDIUM', 'Рыба и овощи'),
('Мясо с картофелем', 'MEDIUM', 'Мясо и картофель'),
('Овощи на пару', 'EASY', 'Овощи без масла'),
('Фруктовый салат', 'EASY', 'Фрукты без сахара'),
('Сырная тарелка', 'EASY', 'Ассорти сыров'),
('Стейк из говядины', 'HARD', 'Классический говяжий стейк'),
('Стейк с чесноком', 'HARD', 'Говядина с ароматом чеснока'),
('Лосось сливочный', 'HARD', 'Лосось в сливочном соусе'),
('Ризотто с пармезаном', 'HARD', 'Рис с сыром пармезан'),
('Паста с лососем', 'HARD', 'Паста с лососем'),

('Креветки в сливках', 'HARD', 'Креветки в сливочном соусе'),
('Карбонара классическая', 'HARD', 'Паста с яйцом и сыром'),
('Курица в сливках', 'HARD', 'Куриное филе со сливками'),
('Свинина с чесноком', 'HARD', 'Свинина с чесноком'),
('Говядина с луком', 'HARD', 'Говядина, тушёная с луком'),

('Омлет с сыром', 'HARD', 'Омлет с расплавленным сыром'),
('Запечённый лосось', 'HARD', 'Лосось в духовке'),
('Ризотто сливочное', 'HARD', 'Сливочный рис'),
('Паста три сыра', 'HARD', 'Паста с тремя сырами'),
('Тунец с сыром', 'HARD', 'Тунец с сыром')
ON CONFLICT (name) DO NOTHING;

-- ==========================
-- Связи рецептов и ингредиентов
-- ==========================
INSERT INTO recipe_ingredients (recipe_id, ingredient_id)
SELECT r.id, i.id FROM recipes r, ingredients i
WHERE
-- яйца / молоко
(r.name = 'Яичница' AND i.name = 'Яйца куриные') OR
(r.name = 'Омлет' AND i.name IN ('Яйца куриные','Молоко')) OR
(r.name = 'Овсяная каша' AND i.name IN ('Овсяные хлопья','Молоко')) OR

-- картофель
(r.name = 'Картофельное пюре' AND i.name IN ('Картофель','Сливочное масло')) OR
(r.name = 'Картофель жареный' AND i.name IN ('Картофель','Репчатый лук')) OR

-- рис / гречка
(r.name = 'Рис отварной' AND i.name = 'Рис белый') OR
(r.name = 'Гречка с маслом' AND i.name IN ('Гречневая крупа','Сливочное масло')) OR

-- паста
(r.name = 'Паста с сыром' AND i.name IN ('Макаронные изделия','Сыр Чеддер')) OR
(r.name = 'Паста с томатной пастой' AND i.name IN ('Макаронные изделия','Томатная паста')) OR
(r.name = 'Паста карбонара' AND i.name IN ('Макаронные изделия','Яйца куриные','Пармезан')) OR

-- курица
(r.name = 'Куриное филе на сковороде' AND i.name = 'Куриное филе') OR
(r.name = 'Куриное филе с чесноком' AND i.name IN ('Куриное филе','Чеснок')) OR
(r.name = 'Курица с рисом' AND i.name IN ('Куриное филе','Рис белый')) OR
(r.name = 'Суп куриный' AND i.name = 'Куриное филе') OR

-- овощи
(r.name = 'Салат из помидоров и огурцов' AND i.name IN ('Помидоры','Огурцы')) OR
(r.name = 'Овощное рагу' AND i.name IN ('Картофель','Морковь','Репчатый лук')) OR
(r.name = 'Овощи на пару' AND i.name IN ('Брокколи','Цветная капуста')) OR

-- рыба
(r.name = 'Лосось жареный' AND i.name = 'Лосось') OR
(r.name = 'Лосось с лимоном' AND i.name IN ('Лосось','Лимон')) OR
(r.name = 'Креветки жареные' AND i.name = 'Креветки') OR
(r.name = 'Креветки с чесноком' AND i.name IN ('Креветки','Чеснок')) OR

-- десерты
(r.name = 'Сырники' AND i.name IN ('Творог','Яйца куриные')) OR
(r.name = 'Блины' AND i.name IN ('Мука пшеничная','Молоко')) OR
(r.name = 'Шоколадный десерт' AND i.name = 'Черный шоколад') OR
(r.name = 'Фруктовый салат' AND i.name IN ('Яблоки','Бананы')) OR
(r.name = 'Фрукты с йогуртом' AND i.name IN ('Йогурт натуральный','Яблоки')) OR

(r.name = 'Стейк из говядины' AND i.name = 'Говядина') OR
(r.name = 'Стейк с чесноком' AND i.name IN ('Говядина','Чеснок')) OR
(r.name = 'Говядина с луком' AND i.name IN ('Говядина','Репчатый лук')) OR

-- лосось
(r.name = 'Лосось сливочный' AND i.name IN ('Лосось','Сливки')) OR
(r.name = 'Запечённый лосось' AND i.name = 'Лосось') OR
(r.name = 'Паста с лососем' AND i.name IN ('Макаронные изделия','Лосось')) OR

-- креветки
(r.name = 'Креветки в сливках' AND i.name IN ('Креветки','Сливки')) OR

-- паста / рис
(r.name = 'Ризотто с пармезаном' AND i.name IN ('Рис белый','Пармезан')) OR
(r.name = 'Ризотто сливочное' AND i.name IN ('Рис белый','Сливки')) OR
(r.name = 'Карбонара классическая' AND i.name IN ('Макаронные изделия','Яйца куриные','Пармезан')) OR
(r.name = 'Паста три сыра' AND i.name IN ('Макаронные изделия','Моцарелла','Пармезан')) OR

-- курица / свинина
(r.name = 'Курица в сливках' AND i.name IN ('Куриное филе','Сливки')) OR
(r.name = 'Свинина с чесноком' AND i.name IN ('Свинина','Чеснок')) OR

-- яйца / сыр
(r.name = 'Омлет с сыром' AND i.name IN ('Яйца куриные','Сыр Чеддер')) OR

-- тунец
(r.name = 'Тунец с сыром' AND i.name IN ('Тунец консервированный','Сыр Чеддер'))
ON CONFLICT DO NOTHING;
