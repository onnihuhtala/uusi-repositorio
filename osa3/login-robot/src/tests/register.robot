*** Settings ***
Resource          resource.robot
Test Setup        Input New Command And Create User



*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  testuser  TestPass123!
	Input New Command
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  testuserr  TestPass123!
	Input New Command
    Output Should Contain  Username already taken

Register With Too Short Username And Valid Password
    Input Credentials  ka  TestPass123!
    Output Should Contain  Username must be at least 3 characters long.

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  invalid_username123  TestPass123!
    Output Should Contain  Username can only contain lowercase letters a-z.

Register With Valid Username And Too Short Password
    Input Credentials  testuser  short
    Output Should Contain  Password must be at least 8 characters long.

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  testuser  onlyletters
    Output Should Contain  Password must contain at least one non-letter character.

*** Keywords ***
Input New Command And Create User
    Input New Command
    Create User  testuserr  TestPass123!