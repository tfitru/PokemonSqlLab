# What are all the types of pokemon that a pokemon can have?
SELECT NAME FROM TYPES;

# What is the name of the pokemon with id 45?
SELECT * FROM POKEMONS WHERE id=45;

# How many pokemon are there?
SELECT COUNT(*) FROM POKEMONS;

# How many types are there?
SELECT COUNT(*) FROM TYPES;

# How many pokemon have a secondary type?
SELECT COUNT(*) FROM POKEMONS WHERE SECONDARY_TYPE IS NOT NULL;

# What is each pokemon's primary type?
SELECT POKEMONS.PRIMARY_TYPE, TYPES.NAME, POKEMONS.NAME FROM POKEMONS JOIN TYPES ON POKEMONS.PRIMARY_TYPE = TYPES.ID;

# What is Rufflet's secondary type?
SELECT p.name, t.name FROM POKEMONS AS P INNER JOIN TYPES AS T ON p.secondary_type = t.id WHERE
p.name = "Rufflet";

# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT pokemon_trainer.trainerID, pokemons.name, pokemons.id FROM pokemon_trainer JOIN pokemons ON pokemon_trainer.pokemon_id = pokemons.id WHERE trainerID = 303;

# How many pokemon have a secondary type Poison
SELECT COUNT(*), types.name FROM pokemons JOIN types ON pokemons.secondary_type = types.id WHERE types.name="Poison" GROUP BY types.name;

# What are all the primary types and how many pokemon have that type?
SELECT COUNT(*), pokemons.primary_type, types.name FROM pokemons JOIN types ON pokemons.primary_type=types.id GROUP BY primary_type, types.name ORDER BY primary_type DESC;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT COUNT(*), pokemon_trainer.pokelevel FROM pokemon_trainer JOIN trainers ON pokemon_trainer.pokemon_id = trainers.trainerID WHERE pokemon_trainer.pokelevel = 100 GROUP BY pokemon_trainer.pokel
evel;

# How many pokemon only belong to one trainer and no other?
SELECT pokemon_ID, COUNT(pokemon_ID) FROM pokemon_trainer GROUP BY pokemon_ID HAVING COUNT(pokemon_ID) = 1;


Directions: Write a query that returns the following collumns:

# Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type

# Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name
# Sort the data by finding out which trainer has the strongest pokemon so that this will act as a ranking of strongest to weakest trainer. You may interpret strongest in whatever way you want,
# but you will have to explain your decision.
SELECT trainers.trainername, pokemons.name, pokemon_trainer.pokelevel, p_types.name, s_types.name FROM pokemons JOIN types p_types
 ON pokemons.primary_type = p_types.id LEFT JOIN types s_types
 ON pokemons.secondary_type = s_types.id JOIN pokemon_trainer
 ON pokemons.id = pokemon_trainer.pokemon_id
 JOIN trainers ON pokemon_trainer.trainerID = trainers.trainerid ORDER BY maxhp & attack & defense & spatk & speed DESC;

// sorted by the max health, attack, defense, special attack and speed
// if a pokemon can have the first move with a strong attack and special attack and take a lot of attacks it should be strongest pokemon and in this case
// the strongest pokemon trainer in this list is Boss Trainer Iria with a moltres
