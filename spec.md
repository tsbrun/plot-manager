# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category) => User, Plot, Character
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) => User has many Plots
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) => Character belongs to Plot
- [x] Include user accounts with unique login attribute (username or email) => User signs up / logs in with a unique email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying => /plots, /plots/new, /plots/edit, delete route for /plots/:id
- [x] Ensure that users can't modify content created by other users => User must be logged in to create new plot
- [x] Include user input validations => All form fields must be filled out before the form is submitted.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) => Error messages for successful / failed login and failed signup.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message