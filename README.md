#Checkov

[See Portfolio Writeup](https://transplanar.github.io/portfolio//checkov/)

[View on Heroku](https://checkov-app.herokuapp.com/)

A to-do list app that allows users to create to do list items and view the to do lists of others. Items are automatically deleted after 7 days.


##Using Checkov
Sign up for an account or login using ```admin@example.com / password``` or ```member@example.com / password```. From here you may create new tasks, delete old tasks, or view other users.

###Creating a Task
Scroll down to the bottom of the screen and enter the text for the desired task. Upon hitting enter or clicking "add task," the new task will appear at the bottom of the list of current tasks.

###Deleting a task
Click the checkmark on the left of a task to remove it from the list.

###View other Users
At the top, click ```All Users``` to see an index of all users in the database. From there you may click a user to view their tasks. If you are logged in as an admin, you may add or delete tasks to these other users. Otherwise, you will be unable to.


##Features
* Devise authentication
* AJAX on add/remote list items
* Automated Cron job to remove old items
