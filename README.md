# Simple App to Fetch users from a public API

A new Flutter project, featuring parsing json fetched from a public API: https://jsonplaceholder.typicode.com/users (READ-ONLY). The app is based on clean architecture and implements a modular design and has seperation of concerns/layers. The architecture is also inspired from MVC & MVVM. Provider is used as a simple state management solution.

## Features

1) Fetches user data & parses it effectively to show in a dynamic scrollable list (using listview.builder).
2) Provider is used for state management.
3) Carefully curated UX as system constantly informs user its state after any action.
4) Pull to refresh/refetch functionality.
5) Deletes any user locally.
6) Has a seperate screen, providing a form to add a new user. The added user is shown back in the list.
7) Simple navigation to & from homepage to the create new user page.
8) Implements singleton pattern to interact with fetching API.
9) The application is well tested against edge cases like: network failure, no server response and empty data fetched. 

## What fuctionalities can further be added to the project
1) Details of a specific user can be viewed by tapping on it in the list.
2) An unscrollable persistent search bar can be added to the homescreen filtering the users in the list.


## Video Recording
 
https://github.com/user-attachments/assets/7841260d-25f7-40f9-88bc-d8db43293588


