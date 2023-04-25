-- create a schema called `notesdb`

-- Create the tables for Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory

-- Note table fields: note_id, note_title, note_content, note_status, note_creation_date
  
-- User table fields: user_id, user_name, user_added_date, user_password, user_mobile

-- alter table User modify column user_added_date date

-- Category table fields : category_id, category_name, category_descr, category_creation_date, category_creator

-- Reminder table fields : reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator

-- NoteCategory table fields : notecategory_id, note_id, category_id

-- NoteReminder table fields : notereminder_id, note_id, reminder_id

-- Usernote table fields : usernote_id, user_id, note_id

-- Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory)

-- Fetch the row from User table based on Id and Password.

-- Fetch all the rows from Note table based on the field note_creation_date.

-- Fetch all the Categories created after the particular Date.

-- Fetch all the Note ID from UserNote table for a given User.

-- Write Update query to modify particular Note for the given note id.

-- Fetch all the Notes from the Note table by a particular User.

-- Fetch all the Notes from the Note table for a particular Category.

-- Fetch all the reminder details for a given note id.

-- Fetch the reminder details for a given reminder id.

-- Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement).

-- Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)

-- Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)

-- Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)

-- Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)

