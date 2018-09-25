*** Settings ***
Library    SeleniumLibrary

*** Variable ***


*** Test Cases ***
Open RD Server
    [Tags]    Test1
    Open Tax Online Page
    Open Manual Of Compatability View Setting
    Close Warning Popup
    Close Browser

Open http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    [Tags]    Test2
    Open nervgh.github
    #Click Single Choose File Button
    Select File    SCK-ADVANCE-ROBOT-FRAMEWORK-DAY-1.pdf
    Select File    SCK-PYTHON-BASIC.pdf
    Select File    SCK-WORKSHOP.pdf
    # Select File    selenium-screenshot-1.png
    Selected File Should Have 3 Files
    Upload File    1
    Upload File    2
    Upload File    3
    # Upload File    4
    Upload Should Be Sucessd
    Close Browser

*** Keywords ***
Open Tax Online Page
    Open Browser    https://rdserver.rd.go.th/    chrome
    Maximize Browser Window

Open Manual Of Compatability View Setting
    Click Element    xpath=(//*[@id="menuList"]/li[3]/a)
    Wait Until Element Is Visible    xpath=(//*[@id="lightboxdialog"]/button)
    Select Frame    xpath=(//*[@id="lightboxdialog"]/p/iframe)
    Click Link    คลิก
    Select Window
    Wait Until Element Is Visible    xpath=(//*[@id="lightboxdialog"]/button)

Close Warning Popup
    Click Element    xpath=(//*[@id="lightboxdialog"]/button)

Open nervgh.github
    Open Browser    http://nervgh.github.io/pages/angular-file-upload/examples/simple/    chrome
    Maximize Browser Window

Click Single Choose File Button
    Click Element    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2])

Select File
    [Arguments]    ${filename}
    Choose File    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2])    ${CURDIR}/${filename}

Selected File Should Have 3 Files
    Page Should Contain Element    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[1])    limit=3

Upload File
    [Arguments]    ${order no}
    Click Element    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[${order no}]/td[5]/button[1])

# Upload File 1
#     Click Element    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/button[1])

# Upload File 2
#     Click Element    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/button[1])

# Upload File 3
#     Click Element    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[5]/button[1])

Upload Should Be Sucessd
    Wait Until Page Contains Element    xpath=(//*[@id="ng-app"]/body/div/div[2]/div[2]/div/div/div/div[@style="width: 100%;"])