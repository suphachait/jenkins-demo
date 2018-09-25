*** Settings ***
Library    calculator.py
#Library    SeleniumLibrary

*** Test Cases ***
Add 2 And 3 = 5
    ${result}=    Add    ${2}    ${3}
    Log To Console    ${result}
    Should Be Equal    ${5}    ${result}
    Should Be Equal As Integers    5    ${result}
