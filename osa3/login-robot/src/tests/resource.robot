*** Settings ***
Library  ../AppLibrary.py


*** Keywords ***
Input Login Command
    Input  login
Input New Command
    Input  new

Input Credentials
    [Arguments]  ${username}  ${password}
    Input  ${username}
    Input  ${password}
    Run Application

Input New Command And Create User
    [Arguments]  ${username}  ${password}
    Input New Command
    Input Credentials  ${username}  ${password}