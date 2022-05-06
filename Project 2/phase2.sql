DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS places;
DROP TABLE IF EXISTS updates;
DROP TABLE IF EXISTS update_menu;
DROP TABLE IF EXISTS update_item_IS;
DROP TABLE IF EXISTS Exists_in_IS;
DROP TABLE IF EXISTS Has_status_in_IS;

-- Entities
CREATE TABLE Users( phoneNum CHAR(13) UNIQUE, login CHAR(50) NOT NULL, password CHAR(50) NOT NULL, FavItems char(400), Type CHAR(8) NOT NULL,
                    PRIMARY KEY(login));
CREATE TABLE Menu(	Type CHAR(20) NOT NULL, ItemName CHAR(50) NOT NULL, Price INTEGER NOT NULL, Description CHAR(400),
                    ImageURL CHAR(256), PRIMARY KEY (ItemName));
CREATE TABLE Orders(	OrderId SERIAL NOT NULL, timestampReceived TIMESTAMP NOT NULL, Paid BOOLEAN, Total REAL NOT NULL,
                    PRIMARY KEY(OrderId));

-- Relationships
CREATE TABLE updates(	updater_login CHAR(50), target_login CHAR(50),
                        PRIMARY KEY(updater_login, target_login),
                        FOREIGN KEY(updater_login) REFERENCES Users
                            ON UPDATE CASCADE,
                        FOREIGN KEY(target_login) REFERENCES Users
                            ON UPDATE CASCADE);

CREATE TABLE places(	login CHAR(50) NOT NULL, OrderId SERIAL,
                        PRIMARY KEY(OrderId),
                        FOREIGN KEY(login) REFERENCES Users
                            ON UPDATE CASCADE,
                        FOREIGN KEY(OrderId) REFERENCES Orders
                            ON DELETE CASCADE);

CREATE TABLE update_menu(	login CHAR(50), ItemName CHAR(50),
                            PRIMARY KEY(login, ItemName),
                            FOREIGN KEY(login) REFERENCES Users
                                ON UPDATE CASCADE,
                            FOREIGN KEY(ItemName) REFERENCES Menu
                                ON UPDATE CASCADE
                                ON DELETE CASCADE);

CREATE TABLE update_item_IS(login CHAR(50), OrderId SERIAL, ItemName CHAR(50), lastUpdated TIMESTAMP, Status CHAR(20), Comments CHAR(130),
					        PRIMARY KEY(login, OrderId, ItemName),
					        FOREIGN KEY(login) REFERENCES Users
                                ON UPDATE CASCADE,
                            FOREIGN KEY(OrderId) REFERENCES Orders
	                            ON DELETE CASCADE,
                            FOREIGN KEY(ItemName) REFERENCES Menu
	                            ON DELETE CASCADE
                                ON UPDATE CASCADE);

CREATE TABLE Exists_in_IS(	ItemName CHAR(50) NOT NULL, OrderId SERIAL, lastUpdated TIMESTAMP, Status CHAR(20), Comments CHAR(130),
                            PRIMARY KEY(OrderId),
                            FOREIGN KEY(ItemName) REFERENCES Menu
	                            ON DELETE CASCADE
                                ON UPDATE CASCADE,
                            FOREIGN KEY(OrderId) REFERENCES Orders
                                ON DELETE CASCADE);

CREATE TABLE Has_status_IS(	OrderId SERIAL NOT NULL, ItemName CHAR(50), lastUpdated TIMESTAMP, Status CHAR(20), Comments CHAR(130),
                            PRIMARY KEY (ItemName),
                            FOREIGN KEY(ItemName) REFERENCES Menu
                                ON UPDATE CASCADE
                                ON DELETE CASCADE,
                            FOREIGN KEY (OrderId) REFERENCES Orders
	                            ON DELETE CASCADE);
