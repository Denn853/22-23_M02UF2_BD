DROP TABLE IF EXISTS weapons_materials;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS weapons_types;


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
       
CREATE TABLE weapons_types (
    id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT NULL,
    icon VARCHAR(16)
);

INSERT INTO weapons_types (type, description, icon)
    VALUES ("Melee",  "Cuerpor a cuerpo", "melee.png"),
           ("Rango",  "Distancia", "range.png");

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
VALUES     ("Brazo de Bebé", NULL, 1, 100, 0.5, NULL, 0, 0, 0, NULL, 0.3, 100, NULL, NULL, 40, NULL, 7, 5, -1, 1),
    ("Estelada", "Una bandera con una estrella :D", 1, 1714, 3, NULL, 0, 100, 1, 1, 1, 1, 1, 1, 1, 1, 102, 100, 1, 1),
    ("Arco Flameante", "Un arco to wapo", 2, 85, 70, 20, 2, 6, 20, 2, 0.3, 4, 0, 36, 0, 14, 7, 5, -1, 2),
    ("Astrape", "El rayo de zeus", 1, -1, 1000, 100, 2, 10, 20, 2, 0.3, 4, 4, 30, 100, 100, 30, 100, 100, 2),
    ("Espada de Yerba", NULL, 1, 900, 1.5, 50, 50, 4, 6, 6, 4, 5, 8, 70, 0, 100, 2, 100, 50, 1);


CREATE TABLE weapons_materials (
    id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
       id_weapon INT UNSIGNED,
    id_material INT UNSIGNED,

    FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
    FOREIGN KEY (id_material) REFERENCES materials(id_material)
);


