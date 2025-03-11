USE MASTER

GO

IF EXISTS (SELECT * FROM Sysdatabases WHERE Name = 'GameOfThronesDB')
DROP DATABASE GameOfThronesDB

GO

CREATE DATABASE GameOfThronesDB

GO

USE GameOfThronesDB
GO

CREATE TABLE Seasons (
    SeasonID INT PRIMARY KEY,
    EpisodesPerSeason INT,
    PremiereDate DATE,
    IMBD_Season_Rating FLOAT,
    AvgBudget VARCHAR(100),
    IqonicEvents VARCHAR(100),
    NumberOfDeaths INT
    );

INSERT INTO Seasons 
(SeasonID, EpisodesPerSeason, PremiereDate, IMBD_Season_Rating,
AvgBudget, IqonicEvents, NumberOfDeaths) 
VALUES

(1, 10, '2011-04-17', 9.0, '$60m', 'Ned Starks Execution, Dragons Hatch', 59),
(2, 10, '2012-04-01', 8.8, '$70m', 'Theons betrayal, The Battle of Blackwater Bay', 130),
(3, 10, '2013-04-30', 8.9, '$70m', 'The Red Wedding, Daenerys Conquers Slaver’s Bay', 87),
(4, 10, '2014-04-06', 9.2, '$80m', 'Tyrion Lannister’s Trial, The Battle at Castle Black', 182),
(5, 10, '2015-04-12', 8.7, '$100m', 'Arya Stark arrives at Braavos, Cerseis Walk of Shame', 246),
(6, 10, '2016-04-24', 9.0, '$100m', 'Battle of the Bastards, Hold the Door', 540),
(7, 7,  '2017-06-16', 9.0, '$90m', 'The Wall Falls, The big Trick on LittleFinger', 1096),
(8, 6,  '2019-04-14', 6.4, '$90m', 'Daenerys Becomes The Mad Queen, Arya Kills The Night King', 3523);




CREATE TABLE Episodes (
    EpisodeID INT PRIMARY KEY,
    EpisodeName VARCHAR(100),
    SeasonID INT,
    EpisodeNumber INT,
    CharactersDeathNum INT,
    IMBD_Episode_Rating FLOAT,
    BattleInEpisode VARCHAR(100),
    FOREIGN KEY (SeasonID) REFERENCES Seasons (SeasonID));


INSERT INTO Episodes
(EpisodeID, EpisodeName, SeasonID, EpisodeNumber, CharactersDeathNum,
IMBD_Episode_Rating, BattleInEpisode)
VALUES

(1, 'Winter Is Coming', 1, 1, 4, 9.0, 'No Battle'),
(2, 'The Kingsroad', 1, 2, 3, 8.8, 'No Battle'),
(3, 'Lord Snow', 1, 3, 2, 8.7, 'No Battle'),
(4, 'Cripples, Bastards, and Broken Things', 1, 4, 1, 8.7, 'No Battle'),
(5, 'The Wolf and the Lion', 1, 5, 6, 8.9, 'The Battle of the Hand'),
(6, 'A Golden Crown', 1, 6, 1, 9.2, 'No Battle'),
(7, 'You Win or You Die', 1, 7, 3, 9.2, 'No Battle'),
(8, 'The Pointy End', 1, 8, 5, 8.9, 'Battle of the Whispering Wood'),
(9, 'Baelor', 1, 9, 7, 9.5, 'No Battle'),
(10, 'Fire and Blood', 1, 10, 2, 9.4, 'No Battle'),
(11, 'The North Remembers', 2, 1, 5, 9.0, 'No Battle'),
(12, 'The Night Lands', 2, 2, 2, 8.5, 'No Battle'),
(13, 'What Is Dead May Never Die', 2, 3, 1, 8.6, 'No Battle'),
(14, 'Garden of Bones', 2, 4, 3, 8.9, 'No Battle'),
(15, 'The Ghost of Harrenhal', 2, 5, 4, 8.8, 'No Battle'),
(16, 'The Old Gods and the New', 2, 6, 6, 8.7, 'Sack of Winterfell'),
(17, 'A Man Without Honor', 2, 7, 1, 8.6, 'No Battle'),
(18, 'The Prince of Winterfell', 2, 8, 3, 8.4, 'No Battle'),
(19, 'Blackwater', 2, 9, 8, 9.4, 'Battle of Blackwater'),
(20, 'Valar Morghulis', 2, 10, 2, 9.1, 'No Battle'),
(21, 'Valar Dohaeris', 3, 1, 1, 8.9, 'No Battle'),
(22, 'Dark Wings, Dark Words', 3, 2, 1, 8.5, 'No Battle'),
(23, 'Walk of Punishment', 3, 3, 2, 8.7, 'No Battle'),
(24, 'And Now His Watch Is Ended', 3, 4, 5, 9.0, 'No Battle'),
(25, 'Kissed by Fire', 3, 5, 2, 8.8, 'No Battle'),
(26, 'The Climb', 3, 6, 1, 8.9, 'No Battle'),
(27, 'The Bear and the Maiden Fair', 3, 7, 1, 8.7, 'No Battle'),
(28, 'Second Sons', 3, 8, 3, 8.9, 'No Battle'),
(29, 'The Rains of Castamere', 3, 9, 15, 9.9, 'The Red Wedding'),
(30, 'Mhysa', 3, 10, 4, 9.1, 'No Battle'),
(31, 'Two Swords', 4, 1, 2, 9.0, 'No Battle'),
(32, 'The Lion and the Rose', 4, 2, 1, 9.2, 'No Battle'),
(33, 'Breaker of Chains', 4, 3, 4, 8.7, 'No Battle'),
(34, 'Oathbreaker', 4, 4, 3, 8.8, 'No Battle'),
(35, 'First of His Name', 4, 5, 2, 8.6, 'No Battle'),
(36, 'The Laws of Gods and Men', 4, 6, 1, 9.1, 'No Battle'),
(37, 'Mockingbird', 4, 7, 2, 8.9, 'No Battle'),
(38, 'The Mountain and the Viper', 4, 8, 3, 9.6, 'Trial by Combat'),
(39, 'The Watchers on the Wall', 4, 9, 6, 9.4, 'Battle of Castle Black'),
(40, 'The Children', 4, 10, 5, 9.6, 'No Battle'),
(41, 'The Wars to Come', 5, 1, 1, 8.5, 'No Battle'),
(42, 'The House of Black and White', 5, 2, 2, 8.4, 'No Battle'),
(43, 'High Sparrow', 5, 3, 1, 8.5, 'No Battle'),
(44, 'Sons of the Harpy', 5, 4, 10, 8.7, 'Battle of Meereen'),
(45, 'Kill the Boy', 5, 5, 3, 8.6, 'No Battle'),
(46, 'Unbowed, Unbent, Unbroken', 5, 6, 5, 8.1, 'No Battle'),
(47, 'The Gift', 5, 7, 1, 8.4, 'No Battle'),
(48, 'Hardhome', 5, 8, 18, 9.7, 'Battle of Hardhome'),
(49, 'The Dance of Dragons', 5, 9, 7, 9.1, 'No Battle'),
(50, 'Mothers Mercy', 5, 10, 12, 9.0, 'No Battle'),
(51, 'The Red Woman', 6, 1, 1, 8.1, 'No Battle'),
(52, 'Home', 6, 2, 4, 8.6, 'No Battle'),
(53, 'Oathbreaker', 6, 3, 2, 8.4, 'No Battle'),
(54, 'Book of the Stranger', 6, 4, 6, 8.9, 'No Battle'),
(55, 'The Door', 6, 5, 9, 9.7, 'No Battle'),
(56, 'Blood of My Blood', 6, 6, 3, 8.6, 'No Battle'),
(57, 'The Broken Man', 6, 7, 1, 8.4, 'No Battle'),
(58, 'No One', 6, 8, 2, 8.4, 'No Battle'),
(59, 'Battle of the Bastards', 6, 9, 50, 9.9, 'Battle of the Bastards'),
(60, 'The Winds of Winter', 6, 10, 10, 9.9, 'No Battle'),
(61, 'Dragonstone', 7, 1, 3, 8.1, 'No Battle'),
(62, 'Stormborn', 7, 2, 2, 8.5, 'No Battle'),
(63, 'The Queens Justice', 7, 3, 1, 8.7, 'No Battle'),
(64, 'The Spoils of War', 7, 4, 10, 9.8, 'The Battle of the Goldroad'),
(65, 'Eastwatch', 7, 5, 1, 8.3, 'No Battle'),
(66, 'Beyond the Wall', 7, 6, 15, 9.0, 'Battle Beyond the Wall'),
(67, 'The Dragon and the Wolf', 7, 7, 4, 8.9, 'No Battle'),
(68, 'Winterfell', 8, 1, 3, 7.5, 'No Battle'),
(69, 'A Knight of the Seven Kingdoms', 8, 2, 1, 7.9, 'No Battle'),
(70, 'The Long Night', 8, 3, 100, 7.5, 'Battle of Winterfell'),
(71, 'The Last of the Starks', 8, 4, 7, 6.4, 'No Battle'),
(72, 'The Bells', 8, 5, 50, 6.1, 'Battle of Kings Landing'),
(73, 'The Iron Throne', 8, 6, 10, 4.1, 'No Battle');



CREATE TABLE Battles (
    BattleID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    SeasonID INT,
    EpisodeID INT,
    Location VARCHAR(100),
    Date DATE,
    Main_Combatants VARCHAR (100),
    Outcome VARCHAR(100),
    Casualties INT,
    Winner VARCHAR(100),
    Loser VARCHAR(100),
    Weapon_Types_Used VARCHAR(100),
    Alliances VARCHAR(100),
    Significant_Deaths VARCHAR(100),
    Duration VARCHAR(100),
    Leaders VARCHAR(100),
    FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID),
    FOREIGN KEY (EpisodeID) REFERENCES Episodes(EpisodeID)
    );



INSERT INTO Battles (
    BattleID, Name, SeasonID, EpisodeID, Location, Date, Main_Combatants, 
    Outcome, Casualties, Winner, Loser, Weapon_Types_Used, 
    Alliances, Significant_Deaths, Duration, Leaders )
VALUES


(1, 'Battle of the Whispering Wood', 1, 8, 'Riverlands', '2011-06-12',
 'Stark forces vs Lannister forces', 'Victory', 500,
 'Robb Stark', 'Jaime Lannister', 'Swords, bows, spears', 'House Stark and Tully alliance',
 'No significant deaths', '4 hours', 
 'Robb Stark, Jaime Lannister'),

(2, 'Battle of Blackwater', 2, 19, 'Kings Landing', '2012-06-03',
 'Lannister and Tyrell forces vs Stannis Baratheons army', 'Victory', 3000,
 'House Lannister', 'Stannis Baratheon',
 'Wildfire, ships, swords, bows', 'Lannister and Tyrell alliance', 
 'Ser Davoss son (Matthos Seaworth)', '6 hours', 
 'Tyrion Lannister, Stannis Baratheon'),

(3, 'The Red Wedding', 3, 29, 'The Twins', '2013-06-09', 
 'House Frey and Bolton forces vs Stark forces', 'Massacre', 200, 
 'House Frey and Bolton', 'House Stark',
 'Daggers, swords, crossbows', 'Frey and Bolton secret pact with Lannisters', 
 'Robb Stark, Catelyn Stark, Talisa Stark', '30 minutes',  
 'Walder Frey, Roose Bolton'),

(4, 'Battle of Hardhome', 5, 48, 'Hardhome', '2015-05-31', 
 'Night’s Watch and Wildlings vs White Walkers and Wights', 'Retreat', 5000, 
 'White Walkers', 'Night’s Watch and Wildlings', 
 'Dragonglass, swords, bows, ice weapons', 'Night’s Watch and Wildlings united', 
 'Karsi (wildling leader)', '1 hour', 
 'Jon Snow, Night King'),

(5, 'Battle of the Bastards', 6, 59, 'Winterfell', '2016-06-19', 
 'Jon Snows forces vs Ramsay Boltons forces', 'Victory', 1200, 
 'Jon Snow', 'Ramsay Bolton', 
 'Swords, shields, bows, cavalry', 'Jon Snow allied with Sansa Stark and the Vale',
 'Rickon Stark', '2 hours', 
 'Jon Snow, Ramsay Bolton'),

 (6, 'The Battle of Castle Black', 4, 39, 'Castle Black', '2014-06-08', 
 'Night’s Watch vs Wildlings', 'Victory', 400, 
 'Night’s Watch', 'Wildlings', 
 'Swords, bows, siege weapons, giants', 'Night’s Watch united under Jon Snow', 
 'Ygritte', '6 hours', 
 'Jon Snow, Tormund Giantsbane'),

(7, 'The Dance of Dragons', 5, 49, 'Meereen', '2015-06-07', 
 'Meereenese forces vs Sons of the Harpy', 'Victory', 300, 
 'Daenerys Targaryen', 'Sons of the Harpy', 
 'Dragons, swords, spears', 'Daenerys supported by Daario and her council', 
 'No significant deaths', '1 hour', 
 'Daenerys Targaryen, Sons of the Harpy leader'),

(8, 'Battle Beyond the Wall', 7, 66, 'Beyond the Wall', '2017-08-20', 
 'Jon Snows party vs White Walkers and Wights', 'Escape', 200, 
 'White Walkers', 'Jon Snows party', 
 'Dragonglass, swords, ice weapons, dragons', 'United group of wildlings and Westerosi', 
 'Viserion the dragon', '2 hours', 
 'Jon Snow, Night King'),

(9, 'The Spoils of War (The Battle of the Goldroad)', 7, 64, 'The Goldroad', '2017-08-06', 
 'Lannister forces vs Dothraki and Daenerys with Drogon', 'Victory', 1000, 
 'Daenerys Targaryen', 'Lannisters', 
 'Dragons, swords, spears', 'Daenerys supported by Dothraki', 
 'No significant deaths', '1 hour',
 'Daenerys Targaryen, Jaime Lannister'),


 (10, 'Battle of Winterfell', 8, 70, 'Winterfell', '2019-04-28', 
 'Westerosi alliance vs White Walkers and Wights', 'Victory', 8000, 
 'Westerosi alliance', 'White Walkers', 
 'Swords, dragonglass, dragon fire, catapults', 'All forces of the living', 
 'Jorah Mormont, Theon Greyjoy, Lyanna Mormont', '3 hours', 
 'Jon Snow, Arya Stark, Night King'),

(11, 'Battle of Kings Landing', 8, 72, 'Kings Landing', '2019-05-12', 
 'Daenerys forces vs Lannister forces and civilians', 'Massacre', 50000, 
 'Daenerys Targaryen', 'Kings Landing', 
 'Dragons, wildfire, swords', 'Daenerys supported by Unsullied and Dothraki', 
 'Cersei Lannister, Jaime Lannister, Qyburn', '2 hours',  
 'Daenerys Targaryen, Cersei Lannister');



 CREATE TABLE Houses (
    HouseID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Sigil VARCHAR(100),
    Motto VARCHAR(100),
    Region VARCHAR(100),
    Religion VARCHAR(100),
    Homeland VARCHAR(100),
    Founder VARCHAR(100),
    Current_Leader VARCHAR(100),
    Military_Strength INT,
    Key_Battles VARCHAR(100),
    Primary_Enemies VARCHAR(100),
    Allied_Houses VARCHAR(100),
    Historical_Significance VARCHAR(100),
    );


INSERT INTO Houses (
    HouseID, Name, Sigil, Motto, Region, Religion, Homeland, 
    Founder, Current_Leader, Military_Strength, Key_Battles, 
    Primary_Enemies, Allied_Houses, Historical_Significance
)
VALUES
(1, 'House Stark', 'A grey direwolf on a white field', 'Winter is Coming', 
 'The North', 'Old Gods of the Forest', 'Winterfell', 'Bran the Builder', 
 'Sansa Stark', 30000, 'Battle of the Bastards, The Long Night', 
 'House Lannister, House Bolton', 'House Tully, House Arryn', 
 'Guardians of the North, leaders in the fight against the White Walkers'),

(2, 'House Lannister', 'A golden lion on a crimson field', 'Hear Me Roar!', 
 'The Westerlands', 'Faith of the Seven', 'Casterly Rock', 'Lann the Clever', 
 'Tyrion Lannister', 40000, 'Battle of Blackwater, Battle of King’s Landing', 
 'House Stark, House Targaryen', 'House Tyrell, House Frey', 
 'One of the richest and most powerful houses in Westeros'),

(3, 'House Targaryen', 'A red three-headed dragon on a black field', 'Fire and Blood', 
 'Dragonstone', 'Valyrian Faith', 'Dragonstone', 'Aegon the Conqueror', 
 'Daenerys Targaryen', 25000, 'Battle of King’s Landing, The Dance of Dragons', 
 'House Lannister, House Baratheon', 'Dothraki, Unsullied', 
 'Rulers of Westeros for centuries, dragonlords of Valyria'),

(4, 'House Baratheon', 'A crowned black stag on a gold field', 'Ours is the Fury', 
 'The Stormlands', 'Faith of the Seven', 'Storm’s End', 'Orys Baratheon', 
 'Gendry Baratheon', 20000, 'Battle of Blackwater, Battle of Storm’s End', 
 'House Targaryen, House Stark', 'House Lannister', 
 'A major house during Robert’s Rebellion and early Game of Thrones'),

(5, 'House Greyjoy', 'A golden kraken on a black field', 'We Do Not Sow', 
 'The Iron Islands', 'Drowned God', 'Pyke', 'Greyiron Kings', 
 'Yara Greyjoy', 10000, 'Battle of Winterfell, Battle of Pyke', 
 'House Stark, House Tully', 'House Targaryen', 
 'Naval power of Westeros, rulers of the Ironborn culture'),

 (6, 'House Tyrell', 'A golden rose on a green field', 'Growing Strong', 
 'The Reach', 'Faith of the Seven', 'Highgarden', 'Garth Greenhand', 
 'Olenna Tyrell (formerly)', 30000, 'Battle of Blackwater, Fall of Highgarden', 
 'House Lannister, House Baratheon', 'House Martell, House Tarly', 
 'Known for their wealth, agriculture, and political influence'),

(7, 'House Martell', 'A red sun pierced by a gold spear on an orange field', 'Unbowed, Unbent, Unbroken', 
 'Dorne', 'Faith of the Seven', 'Sunspear', 'Morgan Martell', 
 'Ellaria Sand (formerly)', 20000, 'Rebellion against the Iron Throne, Alliance with Daenerys', 
 'House Lannister', 'Sand Snakes, House Targaryen', 
 'Known for independence, unique culture, and fierce warriors'),

(8, 'House Arryn', 'A white falcon and crescent moon on a blue field', 'As High as Honor', 
 'The Vale of Arryn', 'Faith of the Seven', 'The Eyrie', 'Artys Arryn', 
 'Robin Arryn', 15000, 'Battle of the Bastards', 
 'House Lannister', 'House Stark, House Tully', 
 'Strategically important region with a nearly impregnable stronghold'),

(9, 'House Bolton', 'A flayed man hanging upside-down on a pink field', 'Our Blades Are Sharp', 
 'The North', 'Old Gods of the Forest', 'The Dreadfort', 'Unknown', 
 'Ramsay Bolton (formerly)', 10000, 'Battle of Winterfell, Red Wedding', 
 'House Stark', 'House Lannister', 
 'Known for cruelty, betrayal, and ambition during the War of the Five Kings'),

(10, 'House Frey', 'Two blue towers united by a bridge on a silver-grey field', 'We Stand Together', 
 'The Riverlands', 'Faith of the Seven', 'The Twins', 'Frey family ancestors', 
 'Walder Frey (formerly)', 20000, 'The Red Wedding', 
 'House Stark, House Tully', 'House Lannister', 
 'Key players in the Red Wedding, secured power through betrayal');

CREATE TABLE Characters (
    CharacterID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Alias VARCHAR(100),
    Gender VARCHAR(100),
    HouseID INT,
    Actor_Name VARCHAR(100),
    EpParticipate VARCHAR(100),
    SeasonParticipate VARCHAR(100),
    Role VARCHAR(100),
    Kills INT,
    Primary_Location VARCHAR(100),
    Famous_Quote VARCHAR(100),
    Weapon_of_Choice VARCHAR(100),
    Friends VARCHAR(100),
    FOREIGN KEY (HouseID) REFERENCES Houses(HouseID)
    );


INSERT INTO Characters (
    CharacterID, Name, Alias, Gender, HouseID, Actor_Name, 
    EpParticipate, SeasonParticipate, Role, Kills, Primary_Location, 
    Famous_Quote, Weapon_of_Choice, Friends
)
VALUES
(1, 'Ned Stark', 'Warden of the North', 'Male', 1, 'Sean Bean', 
 '1-9', '1', 'Main', 2, 'Winterfell', 
 'The man who passes the sentence should swing the sword.', 'Greatsword (Ice)', 
 'Jon Snow, Robert Baratheon'),

(2, 'Jaime Lannister', 'Kingslayer', 'Male', 2, 'Nikolaj Coster-Waldau', 
 '1-73', '1-8', 'Main', 20, 'Kings Landing', 
 'The things I do for love.', 'Sword', 'Brienne of Tarth, Tyrion Lannister'),

(3, 'Catelyn Stark', 'Lady of Winterfell', 'Female', 1, 'Michelle Fairley', 
 '1-29', '1-3', 'Main', 1, 'Winterfell', 
 'Show them how it feels to lose what they love.', 'Dagger', 
 'Robb Stark, Brienne of Tarth'),

(4, 'Cersei Lannister', 'Queen Regent', 'Female', 2, 'Lena Headey', 
 '1-73', '1-8', 'Main', 10, 'Kings Landing', 
 'When you play the game of thrones, you win or you die.', 'Poison', 
 'Jaime Lannister, Qyburn'),

(5, 'Daenerys Targaryen', 'Mother of Dragons', 'Female', 3, 'Emilia Clarke', 
 '1-73', '1-8', 'Main', 1000, 'Dragonstone', 
 'I am not your little princess. I am Daenerys Stormborn of the House Targaryen.', 
 'Dragons', 'Jorah Mormont, Missandei'),

(6, 'Jon Snow', 'The Bastard of Winterfell', 'Male', 1, 'Kit Harington', 
 '1-73', '1-8', 'Main', 50, 'The Wall', 
 'The North remembers.', 'Longclaw (Valyrian steel sword)', 
 'Sam Tarly, Arya Stark'),

(7, 'Sansa Stark', 'Lady of Winterfell', 'Female', 1, 'Sophie Turner', 
 '1-73', '1-8', 'Main', 1, 'Winterfell', 
 'No one can protect me. No one can protect anyone.', 'None', 
 'Jon Snow, Arya Stark'),

(8, 'Arya Stark', 'No One', 'Female', 1, 'Maisie Williams', 
 '1-73', '1-8', 'Main', 30, 'Braavos', 
 'Not today.', 'Needle', 'Jon Snow, The Hound'),

(9, 'Robb Stark', 'The Young Wolf', 'Male', 1, 'Richard Madden', 
 '1-29', '1-3', 'Main', 10, 'The North', 
 'I’ll kill them all.', 'Sword', 'Talisa Stark, Theon Greyjoy'),

(10, 'Theon Greyjoy', 'Reek', 'Male', 5, 'Alfie Allen', 
 '1-70', '1-8', 'Main', 5, 'Pyke', 
 'You’re a good man.', 'Bow and axe', 'Sansa Stark, Jon Snow'),

(11, 'Bran Stark', 'The Three-Eyed Raven', 'Male', 1, 'Isaac Hempstead Wright', 
 '1-73', '1-8', 'Main', 0, 'Winterfell', 
 'I can never be Lord of Winterfell. I can never be anything.', 'None', 
 'Meera Reed, Hodor'),

(12, 'Joffrey Baratheon', 'Joffrey the Illborn', 'Male', 4, 'Jack Gleeson', 
 '1-32', '1-4', 'Main', 5, 'Kings Landing', 
 'Everyone is mine to torment.', 'Crossbow', 'Cersei Lannister'),

 (13, 'Sandor Clegane', 'The Hound', 'Male', NULL, 'Rory McCann', 
 '1-73', '1-8', 'Main', 50, 'The Riverlands', 
 'I’m not a knight.', 'Sword', 'Arya Stark, Sansa Stark'),

(14, 'Tyrion Lannister', 'The Imp', 'Male', 2, 'Peter Dinklage', 
 '1-73', '1-8', 'Main', 2, 'Kings Landing', 
 'I drink and I know things.', 'Wit and tongue', 
 'Bronn, Varys'),

(15, 'Petyr Baelish', 'Littlefinger', 'Male', NULL, 'Aidan Gillen', 
 '1-67', '1-7', 'Main', 5, 'The Vale', 
 'Chaos isn’t a pit. Chaos is a ladder.', 'Schemes', 
 'Sansa Stark, Lysa Arryn'),

(16, 'Samwell Tarly', 'Sam', 'Male', 1, 'John Bradley', 
 '1-73', '1-8', 'Main', 1, 'The Wall', 
 'I killed a White Walker.', 'Dragonglass', 'Jon Snow, Gilly'),

(17, 'Hodor', 'Hodor', 'Male', NULL, 'Kristian Nairn', 
 '1-55', '1-6', 'Supporting', 0, 'Winterfell', 
 'Hodor.', 'Strength', 'Bran Stark, Meera Reed'),

(18, 'Bronn', NULL, 'Male', NULL, 'Jerome Flynn', 
 '1-73', '1-8', 'Supporting', 20, 'Kings Landing', 
 'Ill double your pay.', 'Sword', 'Tyrion Lannister, Jaime Lannister'),

(19, 'Varys', 'The Spider', 'Male', NULL, 'Conleth Hill', 
 '1-73', '1-8', 'Main', 0, 'Kings Landing', 
 'Power resides where men believe it resides.', 'Schemes', 
 'Tyrion Lannister, Daenerys Targaryen'),

(20, 'Ramsay Bolton', 'The Bastard of Bolton', 'Male', 9, 'Iwan Rheon', 
 '21-59', '3-6', 'Main', 100, 'The Dreadfort', 
 'If you think this has a happy ending, you haven’t been paying attention.', 'Bow, torture', 
 'Roose Bolton, Myranda'),

(21, 'Jaqen H’ghar', NULL, 'Male', NULL, 'Tom Wlaschiha', 
 '11-60', '2-6', 'Supporting', 3, 'Braavos', 
 'A man has no name.', 'Daggers', 'Arya Stark'),

(22, 'Ygritte', NULL, 'Female', NULL, 'Rose Leslie', 
 '13-39', '2-4', 'Supporting', 5, 'Beyond the Wall', 
 'You know nothing, Jon Snow.', 'Bow', 'Jon Snow, Tormund Giantsbane'),

(23, 'Brienne of Tarth', NULL, 'Female', NULL, 'Gwendoline Christie', 
 '14-73', '2-8', 'Main', 10, 'The Riverlands', 
 'Nothing’s more hateful than failing to protect the one you love.', 'Sword', 
 'Jaime Lannister, Sansa Stark');
