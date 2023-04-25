-- create a schema called `notesdb`
CREATE SCHEMA notesdb;

-- Create the tables for Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory

-- Note table fields: note_id, note_title, note_content, note_status, note_creation_date
  CREATE TABLE Note (
    note_id INT NOT NULL AUTO_INCREMENT,
    note_title VARCHAR(255) NOT NULL,
    note_content TEXT NOT NULL,
    note_status ENUM('active', 'archived') NOT NULL,
    note_creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (note_id)
);
-- User table fields: user_id, user_name, user_added_date, user_password, user_mobile
CREATE TABLE User (
    user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(255) NOT NULL,
    user_added_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_password VARCHAR(255) NOT NULL,
    user_mobile VARCHAR(20) NOT NULL,
    PRIMARY KEY (user_id)
);
-- alter table User modify column user_added_date date
ALTER TABLE User MODIFY COLUMN user_added_date DATE;

-- Category table fields : category_id, category_name, category_descr, category_creation_date, category_creator
CREATE TABLE Category (
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    category_descr TEXT NOT NULL,
    category_creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    category_creator INT NOT NULL,
    PRIMARY KEY (category_id),
    FOREIGN KEY (category_creator) REFERENCES User(user_id)
);
-- Reminder table fields : reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator
CREATE TABLE Reminder (
    reminder_id INT NOT NULL AUTO_INCREMENT,
    reminder_name VARCHAR(255) NOT NULL,
    reminder_descr TEXT NOT NULL,
    reminder_type ENUM('email', 'notification') NOT NULL,
    reminder_creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reminder_creator INT NOT NULL,
    PRIMARY KEY (reminder_id),
    FOREIGN KEY (reminder_creator) REFERENCES User(user_id)
);
-- NoteCategory table fields : notecategory_id, note_id, category_id
CREATE TABLE NoteCategory (
    notecategory_id INT NOT NULL AUTO_INCREMENT,
    note_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (notecategory_id),
    FOREIGN KEY (note_id) REFERENCES Note(note_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
-- NoteReminder table fields : notereminder_id, note_id, reminder_id
CREATE TABLE NoteReminder (
    notereminder_id INT NOT NULL AUTO_INCREMENT,
    note_id INT NOT NULL,
    reminder_id INT NOT NULL,
    PRIMARY KEY (notereminder_id),
    FOREIGN KEY (note_id) REFERENCES Note(note_id),
    FOREIGN KEY (reminder_id) REFERENCES Reminder(reminder_id)
);
-- Usernote table fields : usernote_id, user_id, note_id

CREATE TABLE UserNote (
    usernote_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    note_id INT NOT NULL,
    PRIMARY KEY (usernote_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (note_id) REFERENCES Note(note_id)
);
-- Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory)
INSERT INTO User (user_name, user_added_date, user_password, user_mobile)
VALUES ('Mohamed', '2022-04-01', 'password123', '252xxxxxxxx');

INSERT INTO Note (note_title, note_content, note_status, note_creation_date)
VALUES ('My first note', 'This is the content of my first note.', 'active', '2022-04-01 12:00:00');

INSERT INTO Category (category_name, category_descr, category_creation_date, category_creator)
VALUES ('Work', 'Notes related to work', '2022-04-01 12:00:00', 'Mohamed');

INSERT INTO Reminder (reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator)
VALUES ('Meeting development team', 'Discuss new project details', 'email', '2022-04-01 12:00:00', 'Mohamed');

INSERT INTO UserNote (user_id, note_id)
VALUES (1, 1);

INSERT INTO NoteReminder (note_id, reminder_id)
VALUES (1, 1);

INSERT INTO NoteCategory (note_id, category_id)
VALUES (1, 1);
-- Fetch the row from User table based on Id and Password.
SELECT * FROM User WHERE user_id = 1 AND user_password = 'password123';
-- Fetch all the rows from Note table based on the field note_creation_date.
SELECT * FROM Note WHERE note_creation_date = '2022-04-25';
-- Fetch all the Categories created after the particular Date.
SELECT * FROM Category WHERE category_creation_date > '2022-04-10';
-- Fetch all the Note ID from UserNote table for a given User.
SELECT note_id FROM UserNote WHERE user_id = 1;
-- Write Update query to modify particular Note for the given note id.
UPDATE Note SET note_title = 'New Title', note_content = 'New Content' WHERE note_id = 1;
-- Fetch all the Notes from the Note table by a particular User.
SELECT n.* FROM Note n JOIN UserNote un ON n.note_id = un.note_id WHERE un.user_id = 1;
-- Fetch all the Notes from the Note table for a particular Category.
SELECT n.* FROM Note n JOIN NoteCategory nc ON n.note_id = nc.note_id WHERE nc.category_id = 1;
-- Fetch all the reminder details for a given note id.
SELECT r.* FROM Reminder r JOIN NoteReminder nr ON r.reminder_id = nr.reminder_id WHERE nr.note_id = 1;
-- Fetch the reminder details for a given reminder id.
SELECT * FROM Reminder WHERE reminder_id = 1;
-- Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement).
INSERT INTO Note (note_title, note_content, note_status, note_creation_date) 
VALUES ('New Note Title', 'New Note Content', 'active', NOW());

INSERT INTO UserNote (user_id, note_id) VALUES (1, 1);
-- Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)
INSERT INTO Note (note_title, note_content, note_status, note_creation_date)
VALUES ('New Note Title', 'New Note Content', 'active', NOW());

INSERT INTO NoteCategory (note_id, category_id) VALUES (1, 1);
-- Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)
INSERT INTO Reminder (reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator)
VALUES ('New Reminder Name', 'New Reminder Description', 'email', NOW(), 'Reminder Creator');

INSERT INTO NoteReminder (note_id, reminder_id)
VALUES (1, 1);
-- Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)
DELETE Note, UserNote FROM Note
JOIN UserNote ON Note.note_id = UserNote.note_id
WHERE Note.note_id = <note_id> AND UserNote.user_id = <user_id>;
-- Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)

