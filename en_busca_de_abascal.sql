DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armors_materials;

DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_armors;
DROP TABLE IF EXISTS characters_items;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS armors;
DROP TABLE IF EXISTS items;

DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armors_types;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters;




CREATE TABLE characters (
    id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(24),
    age INT,
    race VARCHAR(16),
    gender CHAR(1),
    class VARCHAR(16),
    height FLOAT,
    weight FLOAT,
    origin CHAR(3),
    description TEXT

);
INSERT INTO characters (name, age, race, gender, class, height, weight, origin, description)
VALUES     ("Payoh", 64, "Cambiapieles", "L", "Dictador", 1.75, 80, "RUM", "Payoh es... un cambiapieles"),
    ("Yuca", 27, "Sirenido", "F", "Cryptolai", 0.7, 40, "PUR", "Una sirena de puertorico que trafica con ezereum"),
    ("Yulen", 70, "Nomuerto", "D", "Minero", 0.8, 25, "NDE", NULL),
    ("Josema", 3000, "Deidad", "T", "Procrastinador", 3.14, 0, "PER", "Es una deidad que deja las cosas pa' después");        


CREATE TABLE stats (
    id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    agility INT NOT NULL,
    hp FLOAT NOT NULL,
    hp_max INT NOT NULL,
    xp FLOAT NOT NULL,
    xp_max INT NOT NULL,
    mp FLOAT NOT NULL,
    mp_max INT NOT NULL,
    lvl INT NOT NULL,
    physic_damage FLOAT NOT NULL,
    physic_defense FLOAT NOT NULL,
    magic_damage FLOAT NOT NULL,
    magic_defense FLOAT NOT NULL,
    inteligence INT NOT NULL,
    stealth INT NOT NULL,
    luck INT NOT NULL,
    faith INT NOT NULL,
    velocity INT NOT NULL,
    dexterity INT NOT NULL,
    strength INT NOT NULL,
    charisma INT NOT NULL,
    vigor INT NOT NULL,
    critical_rate FLOAT NOT NULL,
    tenacity INT NOT NULL,
    balance FLOAT NOT NULL,
    id_character INT UNSIGNED NOT NULL,

    FOREIGN KEY (id_character) REFERENCES characters (id_character)
);
INSERT INTO `stats` (`id_stat`, `agility`, `hp`, `hp_max`, `xp`, `xp_max`, `mp`, `mp_max`, `lvl`, `physic_damage`, `magic_damage`, `physic_defense`, `magic_defense`, `inteligence`, `stealth`, `luck`, `faith`, `velocity`, `dexterity`, `strength`, `charisma`, `vigor`, `critical_rate`, `tenacity`, `balance`, `id_character`)
VALUES (1, 900, 950, 0, 820, 0, 300, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
    (2, 75, 0, 0, 500, 0, 700, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
    (3, 1000, 1000, 0, 999, 0, 1000, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4),
    (4, 200, 600, 0, 150, 0, 750, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);



CREATE TABLE items_types (
    id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
       type VARCHAR(24),
    description TEXT NULL,
    icon VARCHAR(16)
);
INSERT INTO items_types (type, description, icon)
    VALUES ("Recuperación", NULL, NULL),
           ("Ataque", NULL, NULL),
           ("Información", NULL, NULL),
           ("Puzzle", NULL, NULL),
           ("Comida", "Alimento rico", "food.png"),
           ("Poción", "Te cura o te mata o lo que sea", "pocion.png"),
           ("Tesoro", "$__$", "tesoro.png");



CREATE TABLE armors_types (
    id_armor_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
       type VARCHAR(24),
    description TEXT NULL,
    icon VARCHAR(16)
);
INSERT INTO armors_types (type, description, icon)
    VALUES ("Human", NULL, NULL),
           ("Animal", NULL, NULL),
           ("God", NULL, NULL),
           ("Peto", "Pal pexito", "peto.png"),
           ("Casco", "Pa' la cabesa", "casco.png"),
           ("Traje", "Pal cuerpesito", "traje.jpg");



CREATE TABLE weapons_types (
    id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT NULL,
    icon VARCHAR(16)
);
INSERT INTO weapons_types (type, description, icon)
    VALUES ("Melee",  "Cuerpor a cuerpo", "melee.png"),
           ("Rango",  "Distancia", "range.png");


CREATE TABLE items (
    id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(24),
    description TEXT,
    consumible BOOLEAN,
    activable BOOLEAN,
    cost FLOAT,
    `key` BOOLEAN,
    rarity INT,
    weight FLOAT,
    height FLOAT,
    width FLOAT,
    `usage` INT,
    fusionable BOOLEAN,
    durability INT,
    disassamble BOOLEAN,
    physic_defense FLOAT,
    physic_damage FLOAT,
    magic_defense FLOAT,
    magic_damage FLOAT,
    id_item_type INT UNSIGNED,

    FOREIGN KEY (id_item_type) REFERENCES items_types (id_item_type)
);
INSERT INTO items (item, description, consumible, activable, cost, `key`, rarity, weight, height, width, `usage`, fusionable, durability, disassamble, physic_defense, physic_damage, magic_defense, magic_damage, id_item_type)
VALUES     ("Perla Negra", NULL, FALSE, FALSE, 3600, FALSE, 60, 50, 50, 50, 7, FALSE, 90, FALSE, NULL, NULL, NULL, NULL, 4),
        ("Jabón de la Abuela", NULL, TRUE, FALSE, 50, TRUE, 6, 25, 5, 17, 9, FALSE, 8, TRUE, NULL, NULL, NULL, NULL, 1),
        ("Cola de Furro", "0w0", TRUE, FALSE, 9999, FALSE, 9999, 10, 40, 15, 8, FALSE, 9999, TRUE, 40, 60, 20, 0, 2),
        ("Examen Reprobado", NULL, FALSE, FALSE, 0, TRUE, 2, 1, 24, 1, 4, FALSE, 1, TRUE, 1, 2, 0, 0, 4),
        ("Empty Bottle", NULL, FALSE, TRUE, 0, FALSE, 1, 0.2, 20, 10, 5, FALSE, 1, FALSE, NULL, 35, NULL, NULL, 2),
        ("Elf Bow", NULL, FALSE, FALSE, 5000, TRUE, 9, 6, 1, 0.6, 10, FALSE, 9, FALSE, NULL, 8, NULL, 4, 2),
        ("Salt Rock", NULL, TRUE, FALSE, 3, FALSE, 4, 30, 25, 15, 3, TRUE, 8, TRUE, NULL, 4, 8, 2, 1),
        ("Queso", "Queso que sabe a Beso", TRUE, TRUE, 50, FALSE, 3, 20, 0.1, 0.1, 1, TRUE, 3, FALSE, NULL, NULL, NULL, NULL, 1),
        ("Carne de Zombie", "Esto huele mal", TRUE, TRUE, 20, FALSE, 2, 40, 0.3, 0.3, 1, FALSE, 1, FALSE, NULL, NULL, NULL, NULL, 1),
        ("Fragmento Escarlata", "Piedra rara de un volcán", TRUE, TRUE, 500, FALSE, 45, 10000, 0.5, 0.25, 1, TRUE, -1, FALSE, NULL, NULL, NULL, NULL, 2);

     

CREATE TABLE `armors` (
  `id_armor` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `armor` varchar(24) NOT NULL,
  `description` text DEFAULT NULL,
  `class` varchar(16) DEFAULT NULL,
  `durability` int DEFAULT NULL,
  `cost` int NOT NULL,
  `notoriety` int DEFAULT NULL,
  `rarity` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `lvl` int DEFAULT NULL,
  `lvl_min` int DEFAULT NULL,
  `physic_defense` int DEFAULT NULL,
  `physic_damage` int DEFAULT NULL,
  `magic_defense` int DEFAULT NULL,
  `magic_damage` int DEFAULT NULL,
  `id_armor_type` int UNSIGNED NOT NULL,

       FOREIGN KEY (id_armor_type) REFERENCES armors_types (id_armor_type)
);
INSERT INTO `armors` (`armor`, `description`, `class`, `durability`, `cost`, `notoriety`, `rarity`, `weight`, `lvl`, `lvl_min`, `physic_defense`, `physic_damage`, `magic_defense`, `magic_damage`, `id_armor_type`)
VALUES ("Fachaleco", NULL, 'Comun', 100, 1000, 2, 4, 35, 5, 1, 2000, 0, 40, 0, 1),
    ('Vestimenta Divina', NULL, 'Divina', 70, 9999, 7, 7, 25, 50, 10, 2, 0, 50, 0, 4),
    ('Carne', NULL, 'Savage', 45, 43, 9, 6, 70, 1, 1, 40, 20, 30, 0, 3),
    ('Armadura Básica', NULL, 'Basic', 60, 26, 1, 1, 55, 3, 1, 50, 0, 40, 0, 1),
    ('Tunica de Asesino', 'Tunica perfecta pa\' que no te vean', 'Asesino', 400, 1500, 1, 300, 1, 50, 30, 300, 0, 100, 0, 2),
    ('Kronus de Jaggd Helmet', 'Casco hecho para dioses', 'Paladín', -1, -1, 80, 999, 30, 120, 99, 120, 0, 300, 0, 5);



CREATE TABLE weapons (
    id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon VARCHAR(24),
    description TEXT NULL,
    grip INT NOT NULL,
    durability INT,
    distance FLOAT NULL,
    critical_rate FLOAT NULL,
    rarity VARCHAR(16) NULL,
    quality INT NULL,
    `range` FLOAT NULL,
    rate FLOAT NULL,
    weight INT NULL,
    notoriety INT NULL,
    stealth INT NULL,
    physic_damage FLOAT NULL,
    physic_defense FLOAT NULL,
    magic_damage FLOAT NULL,
    magic_defense FLOAT NULL,
    `level` INT NULL,
    level_min INT NOT NULL,
    cost FLOAT,
    id_weapon_type INT UNSIGNED,

    FOREIGN KEY (id_weapon_type) REFERENCES weapons_types (id_weapon_type)
);
INSERT INTO weapons (weapon, description, grip, durability, distance, critical_rate, rarity, quality, `range`, rate, weight, notoriety, stealth, physic_damage, physic_defense, magic_damage, magic_defense, `level`, level_min, cost, id_weapon_type)
VALUES     ("Brazo de Bebé", NULL, 1, 100, 0.5, NULL, 0, 0, 0, NULL, 0.3, 100, NULL, NULL, NULL, 40, NULL, 7, 5, -1, 1),
    ("Estelada", "Una bandera con una estrella :D", 1, 1714, 3, NULL, 0, 100, 1, 1, 1, 1, 1, 1, 1, 1, 1, 102, 100, 1, 1),
    ("Arco Flameante", "Un arco to wapo", 2, 85, 70, 20, 2, 6, 20, 2, 0.3, 4, 4, 36, 0, 0, 14, 7, 5, -1, 2),
    ("Astrape", "El rayo de zeus", 1, -1, 1000, 100, 2, 10, 20, 2, 0.3, 4, 0, 30, 100, 100, 30, 100, 100, 100, 2),
    ("Espada de Yerba", NULL, 1, 900, 1.5, 50, 50, 4, 6, 6, 4, 5, 8, 70, 70, 0, 100, 2, 100, 50, 1);



CREATE TABLE characters_items (
    id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
       id_character INT UNSIGNED NOT NULL,
    id_item INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (id_character) REFERENCES characters (id_character),
    FOREIGN KEY (id_item) REFERENCES items (id_item)
);
INSERT INTO characters_items (id_character, id_item)
VALUES (4, 1), (2, 6), (3, 5), (1, 3), (3, 2), (1, 4), (2, 7);




CREATE TABLE characters_armors (
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
       id_character INT UNSIGNED NOT NULL,
    id_armor INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (id_character) REFERENCES characters (id_character),
    FOREIGN KEY (id_armor) REFERENCES armors (id_armor)
);
INSERT INTO characters_armors (id_character, id_armor)
VALUES (4, 1), (2, 6), (3, 5), (1, 3), (3, 2);



CREATE TABLE characters_weapons (
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
       id_character INT UNSIGNED NOT NULL,
    id_weapon INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (id_character) REFERENCES characters (id_character),
    FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon)
);
INSERT INTO characters_weapons (id_character, id_weapon)
VALUES (1, 1), (4, 3), (4, 1);



CREATE TABLE materials (
    id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
       material VARCHAR(16),
       color CHAR(6) NULL,
    cost FLOAT NULL
);
INSERT INTO materials (material, color, cost)
VALUES ("Obsidiana", "000000", 40),
       ("Madera", "ddeeaa", 10),
       ("Carne", "ffff00", 5),
       ("Pana", "ffdddd", 50),
       ("Goma Sagrada", "ffffff", 1000),
       ("Piedra", "cccccc", 1),
       ("Cuero", "ddddaa", 20),
       ("BanderaEspaña", "ESPAÑA", 2030),
       ("Plumas de Ángel", "ffffff", 10000),
       ("Materia Oscura", "000000", 10000),
       ("Hueso", "dddddd", 10),
       ("Agua", "0000ff", 1),
       ("Lava", "ff0000", 500);



CREATE TABLE armors_materials (
    id_armor_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_armor INT UNSIGNED,
    id_material INT UNSIGNED,

    FOREIGN KEY (id_armor) REFERENCES armors(id_armor) ON DELETE RESTRICT,
    FOREIGN KEY (id_material) REFERENCES materials(id_material) ON DELETE CASCADE
);
INSERT INTO armors_materials (id_armor, id_material)
VALUES (1, 3),
       (4, 11),
       (2, 4),
       (5, 12),
       (3, 1),
       (6, 5),
       (3, 3);



CREATE TABLE weapons_materials (
    id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_weapon INT UNSIGNED,
    id_material INT UNSIGNED,

    FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon) ON DELETE RESTRICT,
    FOREIGN KEY (id_material) REFERENCES materials(id_material) ON DELETE CASCADE
);
INSERT INTO weapons_materials (id_weapon, id_material)
VALUES (1, 3),
       (1, 11),
       (2, 4),
       (2, 12),
       (3, 1),
       (3, 5),
       (3, 9);




