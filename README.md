Google Test:

Opens a web browser using SeleniumLibrary.
Navigates to the specified base URL (http://localhost:3001) using the Chrome browser.

API Tests:

Uses the RequestsLibrary to perform API tests.
Defines the base API URL and headers with an access token.
Sets up a session (api_session) for making API requests.
Contains a test case (API Tests) that checks whether the API successfully retrieves data by making a GET request to the /v1 endpoint.


Books CRUD Operations:

Uses the RequestsLibrary for making HTTP requests to perform CRUD operations on a book database.
Defines the base API URL, headers with an access token, and a variable to store the book ID.
Contains a test case (Books CRUD Operations) that includes sub-keywords for adding a new book, updating an existing book, and deleting an existing book.
The test case relies on global variables to store the book ID and pass it between sub-keywords.


MongoDB Interactions:

Uses the RequestsLibrary to interact with a MongoDB database.
Defines the base API URL and headers with an access token.
Contains a test case (MongoDB Interactions) that checks whether books are successfully displayed from MongoDB by making a GET request to the /getBooks endpoint.


Common Keywords:

Contains a common keyword (Should Successfully Retrieve Data From API) used by the API Tests test case to check if the API successfully retrieves data.
