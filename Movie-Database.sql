/******************************************************************************************
/ Create the Highest-Grossing-Movies database 
/ Contains top 25 highest grossing movies in the world. 
/ Author: Erica Thompson-Becker
/ Date: August 30, 2022
/*****************************************************************************************/
-- Create Movies Database
DROP DATABASE IF EXISTS Movies;
CREATE DATABASE Movies;

-- Create Movie Table 
CREATE TABLE Movies.Movie( 
id INT NOT NULL UNIQUE PRIMARY KEY,
Title VARCHAR(200) NOT NULL,
Year INT,
MovieInfo VARCHAR(255),
ReleaseDate DATE,
Runtime VARCHAR(20) 
);

-- Create Sales Table
CREATE TABLE Movies.Sales(
Movie_id INT NOT NULL,
DomesticSales DECIMAL(12,2),
InternationalSales DECIMAL(12,2),
WorldSales DECIMAL(12,2),
FOREIGN KEY(Movie_id) REFERENCES Movies.Movie(id)
);

-- Create Movie type table
CREATE TABLE Movies.Type(
Movie_id INT NOT NULL,
Distributor VARCHAR(200),
Genre VARCHAR(200),
License VARCHAR(20),
FOREIGN KEY(Movie_id) REFERENCES Movies.Movie(id)
);

-- Insert Values into Movie
INSERT INTO Movies.Movie VALUES 
(1,'Avatar', 2009, 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', '2009-12-16','2hr 42min'),
(2, 'Avengers: Endgame', 2019,"After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.", '2019-04-24','3hr 1min'),
(3, 'Titanic',1997, "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.",'1997-12-19','3hr 14min'),
(4, 'Star Wars: Episode VII - The Force Awakens',2015, "As a new threat to the galaxy rises, Rey, a desert scavenger, and Finn, an ex-stormtrooper, must join Han Solo and Chewbacca to search for the one hope of restoring peace.",'2015-12-15','2hr 18min'),
(5, 'Avengers: Infinity War', 2018,"The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.", NULL , '2hr 29min'),
(6, 'Jurassic World', 2015, "A new theme park, built on the original site of Jurassic Park, creates a genetically modified hybrid dinosaur, the Indominus Rex, which escapes containment and goes on a killing spree.", '2015-06-10','2hr 4min'),
(7, 'The Lion King', 2019,"After the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.", '2019-07-19','1hr 58min'),
(8, 'Spider-Man: No Way Home', 2021,"With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.", NULL, '2hr 28min'),
(9, 'The Avengers', 2012, "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.", '2012-04-25','2hr 23min'),
(10, 'Furious 7', 2015,"Deckard Shaw seeks revenge against Dominic Toretto and his family for his comatose brother.", '2015-04-01','2hr 17min'),
(11, 'Frozen II', 2019,"Anna, Elsa, Kristoff, Olaf and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa's powers in order to save their kingdom.", '2019-11-20','1hr 43min'),
(12, 'Avengers: Age of Ultron', 2015,"When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",'2015-04-22','2hr 21min'),
(13, 'Black Panther', 2018, "T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country's past.",NULL,'2hr 14min'),
(14, 'Harry Potter and the Deathly Hallows: Part 2', 2011, "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.",NULL,'2hr 10min'),
(15, 'Star Wars: Episode VIII: The Last Jedi', 2017, "The Star Wars saga continues as new heroes and galactic legends go on an epic adventure, unlocking mysteries of the Force and shocking revelations of the past.", '2017-12-13', '2hr 32min'),
(16, 'Jurassic World: Fallen Kingdom', 2018,"When the island's dormant volcano begins roaring to life, Owen and Claire mount a campaign to rescue the remaining dinosaurs from this extinction-level event.",'2018-06-06','2hr 8min'),
(17, 'Frozen', 2013, "When the newly crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister Anna teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.",'2013-11-22','1hr 42min'),
(18, 'Beauty and the Beast', 2017, "A selfish Prince is cursed to become a monster for the rest of his life, unless he learns to fall in love with a beautiful young woman he keeps prisoner.",'2017-03-16','2hr 9min'),
(19, 'Incredibles 2', 2018,"The Incredibles family takes on a new mission which involves a change in family roles: Bob Parr (Mr. Incredible) must manage the house while his wife Helen (Elastigirl) goes out to save the world.",NULL, '1hr 58min'),
(20, 'The Fate of the Furious', 2017,"When a mysterious woman seduces Dominic Toretto into the world of terrorism and a betrayal of those closest to him, the crew face trials that will test them as never before.", '2017-04-12','2hr 16min'),
(21, 'Iron Man 3', 2013, "When Tony Stark's world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.",'2013-04-24','2hr 10min'),
(22, 'Minions', 2015, "Minions Stuart, Kevin, and Bob are recruited by Scarlet Overkill, a supervillain who, alongside her inventor husband Herb, hatches a plot to take over the world.",'2015-04-19','1hr 31min'),
(23, 'Captain America: Civi War', 2016, "Political involvement in the Avengers' affairs causes a rift between Captain America and Iron Man.", '2016-04-27','2hr 27min'),
(24, 'Aquaman', 2018, "Arthur Curry, the human-born heir to the underwater kingdom of Atlantis, goes on a quest to prevent a war between the worlds of ocean and land.", NULL, '2hr 23min'),
(25, 'The Lord of the Rings: The Return of the King', 2003,"Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",'2003-12-17','3hr 21min')
;

-- Inserting values into Movie Type
INSERT INTO Movies.Type VALUES
(1, 'Twentieth Century Fox' , "['Action','Adventure','Fantasy', 'Sci-Fi']",'PG-13'),
(2, 'Walt Disney Studio Motion Pictures',"['Action', 'Adventyre', 'Drama', 'Sci-Fi']",'PG-13'),
(3, 'Paramount Picture',"['Drama','Romance']",'PG-13'),
(4, 'Walt Disney Studio Motion Pictures',"['Action','Adventure','Sci-Fi']",'PG-13'),
(5, 'Walt Disney Studio Motion Pictures',"['Action','Adventure','Sci-Fi']",NULL),
(6, 'Universal Pictures', "['Action','Adventure','Sci-Fi']",'PG-13'),
(7, 'Walt Disney Studio Motion Pictures',"['Adventure', 'Animation', 'Drama', 'Family', 'Musical']", 'PG'),
(8, 'Sony Pictures Entertainment',"['Action,'Adventure','Fantasy','Sci-Fi']",NULL),
(9, 'Walt Disney Studio Motion Pictures',"['Action','Adventure','Sci-Fi']",'PG-13'),
(10, 'Universal Pictures',"['Action','Thriller']",'PG-13'),
(11, 'Walt Disney Studio Motion Pictures',"['Adventure','Animation','Comedy','Family''Fantasy','Musical']",'PG'),
(12,'Walt Disney Studio Motion Pictures',"['Action','Adventure','Sci-Fi']",'PG-13'),
(13, 'Walt Disney Studio Motion Pictures',"['Action','Adventure','Sci-Fi']",NULL),
(14, 'Warner Bros.',"['Adventure','Fantasy','Mystery']",NULL),
(15, 'Walt Disney Studio Motion Pictures', "['Action','Adventure','Fantasy','Sci-Fi']",'PG-13'),
(16, 'Universal Pictures',"['Action','Adventure','Sci-Fi']",'PG-13'),
(17, 'Walt Disney Studio Motion Pictures', "['Adventure','Animation','Comedy','Family','Fantasy','Musical']",'PG'),
(18, 'Walt Disney Studio Motion Pictures', "['Adventure','Family','Fantasy','Musical','Romance']",'PG'),
(19, 'Walt Disney Studio Motion Pictures', "['Action','Adventure','Animation','Comedy,'Family','Sci-Fi']",NULL),
(20, 'Universal Pictures', "['Action,'Crime','Thriller']",'PG-13'),
(21, 'Walt Disney Studio Motion Pictures', "['Action','Adventure','Sci-Fi']",'PG-13'),
(22, 'Universal Pictures', "['Adventure','Animation','Comedy','Crime','Family','Sci-Fi']",'PG'),
(23, 'Walt Disney Studio Motion Pictures', "['Action','Adventure','Sci-Fi']",'PG-13'),
(24, 'Warner Bros.', "['Action','Adventure','Fantasy','Sci-Fi']", NULL),
(25, 'New Line Cinema', "['Action','Adventure','Drama','Fantasy']",'PG-13')
;

-- Insert Values into Sales Table 
INSERT INTO Movies.Sales VALUES
(1, 760507625,	2086738578,	2847246203),
(2, 858373000,	1939128328,	2797501328),
(3, 659363944,	1542283320,	2201647264),
(4, 936662225,	1132859475,	2069521700),
(5, 678815482,	1369544272,	2048359754),
(6, 652385625,	1018130819,	1670516444),
(7, 543638043,	1119261396,	1662899439),
(8, 675813257,	868642706,	1544455963),
(9, 623357910,	895457605,	1518815515),
(10, 353007020, 1162334379,	1515341399),
(11, 477373578,  972653355,	1450026933),
(12, 459005868	, 943803672,	1402809540),
(13, 700426566,	647171407,	1347597973),
(14, 381409310,	960912354,	1342321665),
(15, 620181382,	712517448,	1332698830),
(16, 417719760,	892746536,	1310466296),
(17, 400953009,	880555091,	1281508100),
(18, 504481165,	769095055,	1273576220),
(19, 608581744,	634507500,	1243089244),
(20, 226008385,	1009996733,	1236005118),
(21, 409013994,	805797258,	1214811252),
(22, 336045770,	823398892,	1159444662),
(23, 408084349,	745253147, 	1153337496),
(24, 335061807, 	813424079,	1148485886),
(25, 377845905,	768185007,	1146030912)
;


