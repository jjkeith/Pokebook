#POKR

[link to finished page]

---

POKR is a web app designed to allow users to store their favorite Pokémon characters online, share their favorites with friends, and make new friends.




##Screenshots


##ERD
![](ERD.png)

##Wireframes

![](Pages_Index.png)
![](User_New.png)
![](Session_New.png)
![](User_Show.png)
![](User_Cards.png)

##Technologies Used
- Ruby on Rails
- PostgreSQL
- jQuery
- Bootstrap
- HTML/CSS

##User Stories

| As a ... | I'd like to ... |
| ---------|-----------------|
|User|Login to my account to see my deck|
|User|Add new entries via a form so the app can store my deck|
|User|Display my entire deck|
|User|Be able to see other users' decks|
|User|Be able to edit my account info/card listing info|
|User|Login to my account to see my inventory.|
|User|Be able to sort my deck by type, card id, and alphabetically by Pokémon name|
|Admin|Be able to delete users.|

##Installation

Just login and start using!


##Known Issues
* When adding a new card to favorites, a JaveScript-based alert would be better than redirecting back to the user_path.
* There is no filtering on the images that users add to ensure that it is a Pokémon.


##Future Improvements
* Add a database that contains the entire Pokédex
* The ability for users to "friend" one another
* A board for users to schedule IRL Pokémon games
