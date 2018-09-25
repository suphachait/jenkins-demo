*** Settings ***
Library    Collections

*** Variables ***
&{user_info_1}    email=somkiat@gmail.com
...    mobile_no=0868696209

*** Test Cases ***
Test 1
    Fill In Customer Information    ${user_info_1}

Test 2
    &{user_info}=    Create Dictionary
    ...    email=somkiat@gmail.com
    ...    mobile_no=0868696209
    Fill In Customer Information    ${user_info}

*** Keywords ***
Fill In Customer Information
    [Arguments]    ${user}
    Log To Console    ${user.email}
    Log To Console    ${user.mobile_no}