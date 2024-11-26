*** Settings ***
Resource          resource.robot
Test Setup        Input New Command
Test Setup        Input New Command And Create User    testuser    TestPass123!

*** Variables ***
${VALID_USERNAME}    kalle
${VALID_PASSWORD}    Kalle1234!

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  ${VALID_USERNAME}  ${VALID_PASSWORD}
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  testuser  TestPass123!
    Output Should Contain  New user registered

Register With Too Short Username And Valid Password
    Input Credentials  ka  ${VALID_PASSWORD}
    Output Should Contain  Username must be at least 3 characters long.

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  invalid_username123  ${VALID_PASSWORD}
    Output Should Contain  Username can only contain lowercase letters a-z.

Register With Valid Username And Too Short Password
    Input Credentials  ${VALID_USERNAME}  short
    Output Should Contain  Password must be at least 8 characters long.

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  ${VALID_USERNAME}  onlyletters
    Output Should Contain  Password must contain at least one non-letter character.