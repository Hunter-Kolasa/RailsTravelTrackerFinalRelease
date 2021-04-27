TRAVEL TRACKER
       ______________________
       
       =======[README]=======
       ______________________

Welcome to Travel Tracker reimagined using Ruby on Rails!  This app is intended to showcase various Rails concepts using the familiar concept introduced in my past Travel Tracker Sinatra project!  While there are some shortcomings in the app including issues surrounding the many-to-many relationship of Vacations to Destinations and the corresponding form(s), I believe that, with future implementation of Javascript and multiple, MULTIPLE refactors and bugfixes, this app may eventually serve as a functional, potentially even efficient method of keeping track of past and future travels.  
---[DEMO]---
https://youtu.be/_h_Al8ysOpQ

---[Usage]---

In order to use this app, please run: 

(1) "bundle install"

(2) "rake db:migrate" 

(3) "rails s"

Then navigate http://localhost:3000/ to begin using the web application.

From the main page, a new user can see a list of all existing destinations entered by other users.  If selected, any specific vacation will route to a destination page listing the different vacations associated with the destination.  These vacations are clickable and will route to the details of any vacation, but will only allow editing if they are owned by the current user.  Once logged in, a user can add new vacations with a list of the existing destinations to check-off(1+) or a nested input to add a single custom vacation.  Additionally, destinations can be added wihout linkage to a vacation for future addition to the current user's or others' vacations.  Finally, a user can see a sorted list of upcoming vacations.

---[Notes]---

Current known bugs:

    -Duplicate destinations CAN be added and will be displayed in any collection_select or destination lists.
        This can potentialy be addressed by validating uniqueness of a helper method that combines destination city and country into a single attribute.

    -Omniauth will occasionally suffer a fatal error when first used.  This appears to be a communication issue between the provider(Google) and the actual "GET /:provider/auth" route.
        The quick-fix here is to simply reload the page and attempt to sign-in again.

    -Certain forms rest much lower on the webpage than necessary. While this does showcase the cool static background that maintains its position if you scroll, it is unsightly and feels forced.

    -...

---[Fin]---

Thank you for your interest in my web application! Any comments, concerns, newly found bugs, hatemail, etc can be sent directly through Github!
