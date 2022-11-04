DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armors_types;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS characters_weapons;

DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armors_materials;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS armors;
DROP TABLE IF EXISTS items;

CREATE TABLE weapons_types (
    id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT NULL,
    icon VARCHAR(16)
);

INSERT INTO weapons_types (type, description, icon)
	VALUES ("Melee",  "Cuerpor a cuerpo", "melee.png"),
    	   ("Rango",  "Distancia", "range.png");

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


CREATE TABLE weapons_materials (
    id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   	id_weapon INT UNSIGNED,
    id_material INT UNSIGNED,

	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
	FOREIGN KEY (id_material) REFERENCES materials(id_material)
);

INSERT INTO weapons_materials (id_weapon, id_material) 
VALUES (1, 3),
       (1, 11),
       (2, 4),
       (2, 12),
       (3, 1),
       (3, 5),
       (3, 9);
       
CREATE TABLE armors_materials (
    id_armor_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   	id_armor INT UNSIGNED,
    id_material INT UNSIGNED,

	FOREIGN KEY (id_armor) REFERENCES armors(id_armor),
	FOREIGN KEY (id_material) REFERENCES materials(id_material)
);

INSERT INTO armors_materials (id_weapon, id_material) 
VALUES (1, 3),
       (4, 11),
       (2, 4),
       (5, 12),
       (3, 1),
       (7, 5),
       (3, 3);


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

    FOREIGN KEY (id_weapon_type) REFERENCES weapon_types (id_weapon_type)
);

INSERT INTO weapons (weapon, description, grip, durability, distance, critical_rate, rarity, quality, `range`, rate, weight, notoriety, stealth, physic_damage, physic_defense, magic_damage, magic_defense, `level`, level_min, cost, id_weapon_type)
VALUES 	("Brazo de Bebé", NULL, 1, 100, 0.5, NULL, 0, 0, 0, NULL, 0.3, 100, NULL, NULL, 40, NULL, 7, 5, -1, 1),
	("Estelada", "Una bandera con una estrella :D", 1, 1714, 3, NULL, 0, 100, 1, 1, 1, 1, 1, 1, 1, 1, 102, 100, 1, 1),
	("Arco Flameante", "Un arco to wapo", 2, 85, 70, 20, 2, 6, 20, 2, 0.3, 4, 4, 0, 36, 0, 14, 7, 5, -1, 2),
	("Astrape", "El rayo de zeus", 1, -1, 1000, 100, 2, 10, 20, 2, 0.3, 4, 4, 0, 30, 100, 100, 30, 100, 100, 2),
	("Espada de Yerba", NULL, 1, 900, 1.5, 50, 50, 4, 6, 6, 4, 5, 8, 70, 70, 0, 100, 2, 100, 50, 1);


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
VALUES 	("Perla Negra", NULL, FALSE, FALSE, 3600, FALSE, 60, 50, 50, 50, 7, FALSE, 90, FALSE, NULL, NULL, NULL, NULL, 4),
		("Jabón de la Abuela", NULL, TRUE, FALSE, 50, TRUE, 6, 25, 5, 17, 9, FALSE, 8, TRUE, NULL, NULL, NULL, NULL, 1),
		("Cola de Furro", "0w0", TRUE, FALSE, 9999, FALSE, 9999, 10, 40, 15, 8, FALSE, 9999, TRUE, 40, 60, 20, 0, 2),
		("Examen Reprobado", NULL, FALSE, FALSE, 0, TRUE, 2, 1, 24, 1, 4, FALSE, 1, TRUE, 1, 2, 0, 0, 4),
		("Empty Bottle", NULL, FALSE, TRUE, 0, FALSE, 1, 0.2, 20, 10, 5, FALSE, 1, FALSE, NULL, 35, NULL, NULL, 2),
		("Elf Bow", NULL, FALSE, FALSE, 5000, TRUE, 9, 6, 1, 0.6, 10, FALSE, 9, FALSE, NULL, 8, NULL, 4, 2),
		("Salt Rock", NULL, TRUE, FALSE, 3, FALSE, 4, 30, 25, 15, 3, TRUE, 8, TRUE, NULL, 4, 8, 2, 1),
		("Queso", "Queso que sabe a Beso", TRUE, TRUE, 50, FALSE, 3, 20, 0.1, 0.1, 1, TRUE, 3, FALSE, NULL, NULL, NULL, NULL, 1),
		("Carne de Zombie", "Esto huele mal", TRUE, TRUE, 20, FALSE, 2, 40, 0.3, 0.3, 1, FALSE, 1, FALSE, NULL, NULL, NULL, NULL, 1),
		("Fragmento Escarlata", "Piedra rara de un volcán", TRUE, TRUE, 500, FALSE, 45, 10000, 0.5, 0.25, 1, TRUE, -1, FALSE, NULL, NULL, NULL, NULL, 2);



CREATE TABLE characters_weapons (
	id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   	id_character INT UNSIGNED NOT NULL,
    id_weapon INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (id_character) REFERENCES characters (id_character),
    FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon)
);

INSERT INTO characters_weapons (id_character, id_weapon)
VALUES (1, 1), (4, 3), (4, 1);
