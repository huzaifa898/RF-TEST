*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    http://localhost:3001

*** Test Cases ***
Google Test
    Open Browser    ${BASE_URL}    chrome