nested-form - an Exercise in fields_for, accepts_nested_attributes_for and Modal Forms
--------------------------------------------------------------------------------------

A Rails 3.2 CRUD application that demonstrates complex forms, including a modal window for adding new child records.

This demo app builds on the information presented in [Railscast 197] [1].
I wanted to take it a step further and see if I could use a modal form for the "child" object data entry fields.  I couldn't find any good demos on the internet on how to go about this, so I created this demo app to try it out.

The idea behind this application is fairly simple:  it's a Star Wars Starfighter Database (albeit a VERY simplified one).
The object model is very simple:

  1.  There are Ships.  
  2.  Ships have zero to many Pilots (i.e. characters/personalities who fly the type of ship being viewed).

  For example:  Garven Dreis, Wedge Antilles, and Biggs Darklighter all fly the T-65 X-Wing.

This application will allow a user to create/edit/delete a Ship.  While creating a Ship, a user has the option of creating 
records for the Pilots that fly the Ship being created.  When editing an existing Ship, a user has the ability to:

  1.  Create a new Pilot **.
  2.  Edit an existing Pilot.
  3.  Remove a Pilot from the list.

** = this where the modal part comes in to play. In the Railscast, the fields to add a new "child" object are inserted before the link, and a new set of fields is inserted for each new "child" object the user wants to create.  Instead, I'd like to use a modal form that will display the required data entry fields.  The form allows a user to enter a single "child" object (a Pilot in this case).  After the Pilot has been added (i.e. the user clicks "Add" on the modal form), the new Pilot will appear in the table of Pilots.

A user can conduct any number of the changes cited above prior to saving, and Rails/ActiveRecord will do the right thing!  It will:

  1.  Destroy the Pilots that were removed
  2.  Add the Pilots that were created
  3.  Update the Pilots that were changed
  4.  Update the Ship attributes that were changed.

Setup
-----
1.  Clone the app locally.
2.  Run rake db:migrate to set up the database.
3.  Run rake db:populate to seed the database with some sample data.
4.  Create a new Ship or edit an existing Ship from the list.
5.  In the Ship Details screen, edit any details.  Also, add/edit/remove any Pilots in the list.
6.  Save your changes.
7.  View the Ship that was edited during Step 5.
8.  Observe all the changes have been saved.

TO-DOs (read: Bugs!)
--------------------
1.  The Javascript/jQuery for the "Add" button on the modal form is in the .erb file itself - it should probably be moved to ships.js or application.js.

[1]: http://railscasts.com/episodes/197-nested-model-form-part-2
