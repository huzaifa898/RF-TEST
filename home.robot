*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  Collections
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  http://localhost:3001
${API_URL}   http://localhost:1000/api/v1
${HEADERS}  Authorization=Bearer YOUR_ACCESS_TOKEN

*** Test Cases ***
Google Test
    Open Browser  ${BASE_URL}  chrome

API Tests
    [Setup]  Create Session  api_session  ${API_URL}
    Should Successfully Retrieve Data From API

Books CRUD Operations
    Add a New Book
    Update an Existing Book
    Delete an Existing Book

MongoDB Interactions
    Display Books from MongoDB

*** Keywords ***
Should Successfully Retrieve Data From API
    ${response}=  Get Request  api_session  /v1
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.text}  "data"

Add a New Book
    ${response}=  Post Request  api_session  /add  json=${{"bookname": "Test Book", "author": "John Doe", "description": "A great book for testing", "image": "https://example.com/book-image.jpg", "price": 19.99}}
    Should Be Equal As Numbers  ${response.status_code}  200
    ${book_id}=  Set Variable  ${response.json().book_id}
    Set Suite Variable  ${BOOK_ID}  ${book_id}

Update an Existing Book
    ${response}=  Put Request  api_session  /updateBook/${BOOK_ID}  json=${{"bookname": "Updated Book Name", "description": "Updated book description", "author": "Updated Author", "image": "https://url", "price": 29.99}}
    Should Be Equal As Numbers  ${response.status_code}  200

Delete an Existing Book
    ${response}=  Delete Request  api_session  /deleteBook/${BOOK_ID}
    Should Be Equal As Numbers  ${response.status_code}  200

Display Books from MongoDB
    ${response}=  Get Request  api_session  /getBooks
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.text}  "books"

Get Request
    [Arguments]  ${session}  ${uri}
    ${response}=  Get Request  ${session}  ${uri}
    Log  ${response.status_code}
    Log  ${response.text}
    [Return]  ${response}

Post Request
    [Arguments]  ${session}  ${uri}  ${json}
    ${response}=  Post Request  ${session}  ${uri}  json=${json}
    Log  ${response.status_code}
    Log  ${response.text}
    [Return]  ${response}

Put Request
    [Arguments]  ${session}  ${uri}  ${json}
    ${response}=  Put Request  ${session}  ${uri}  json=${json}
    Log  ${response.status_code}
    Log  ${response.text}
    [Return]  ${response}

Delete Request
    [Arguments]  ${session}  ${uri}
    ${response}=  Delete Request  ${session}  ${uri}
    Log  ${response.status_code}
    Log  ${response.text}
    [Return]  ${response}
