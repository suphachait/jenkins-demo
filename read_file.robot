*** Settings ***
Library    csv_library.py

*** Test Cases ***
Try To Read From User.csv
    [Tags]    read
    ${users}=    Read Data    user.csv
    Log To Console    User=${users[0][0]}
    Log To Console    Password=${users[0][1]}

Try To Read From User.csv With For Loop
    [Tags]    loopfor
    ${users}=    Read Data    user.csv
    :FOR    ${data}    IN    @{users}
    \    Log To Console    ${data[0]}=${data[1]}

Try To Write Dictionary Data To Csv File
    [Tags]    dev
    &{user_info}=    Create Dictionary
    ...    email=somkiat@gmail.com
    ...    mobile_no=0868696209
    Write Data    ${user_info}

Try To Write Dictionary Data To Csv File
    [Tags]    dev2
    &{user_info}=    Create Dictionary
    ...    email=somkiat@gmail.com
    ...    mobile_no=0868696209
    @{all data}=    Create List
    ...    ${user_info}
    ...    ${user_info}
    Write Data    ${all data}