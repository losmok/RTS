INSERT INTO players (name, email, password) VALUES ("pawel","pawel.lewandowski2004@wp.pl","1234");
INSERT INTO players (name, email, password) VALUES ("kacper","kacper.kaminski2004@wp.pl","1234");
INSERT INTO players (name, email, password) VALUES ("oskar","oskar.stawikowski2004@wp.pl","1234");
INSERT INTO resources (name) VALUES ("drewno","glina","żelazo");
INSERT INTO buildings (name) VALUES ("dół z gliną","huta żelaza","chata drwala");
INSERT INTO troopers (name) VALUES ("łucznik","kusznik","rycerz");

SELECT name,password FROM players;
SELECT * FROM players WHERE username='pawel' AND password='1234';