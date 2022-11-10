*** Settings ***
Resource    ./setting.robot
variables    ./variables.py

*** Keywords ***
# ------- reuseable function -------
เปิดบราวเซอร์
    Open Available Browser         ${URL}         	
    Maximize Browser Window
    Set Selenium Speed    0.5
    Sleep    5

ปิดบราวเซอร์
    Close All Browsers
    Sleep    5


# ------insert -----

กรอกข้อมูล Username       
    Element Should Be Visible           ${LOCATOR_INPUT_USERNAME}
    Input Text                          ${LOCATOR_INPUT_USERNAME}        ${TEXT_USERNAME}
    Sleep    5

กรอกข้อมูล Username ไม่ถูกต้อง
    Element Should Be Visible           ${LOCATOR_INPUT_USERNAME}
    Input Text                          ${LOCATOR_INPUT_USERNAME}        ${TEXT_WRONG_USERNAME}
    Sleep    5

กรอกข้อมูล Password
    Element Should Be Visible           ${LOCATOR_INPUT_PASSWORD} 
    Input Text                          ${LOCATOR_INPUT_PASSWORD}        ${TEXT_PASSWORD} 
    Sleep    5

กรอกข้อมูล Password ไม่ถูกต้อง
    Element Should Be Visible           ${LOCATOR_INPUT_PASSWORD} 
    Input Text                          ${LOCATOR_INPUT_PASSWORD}        ${TEXT_WRONG_PASSWORD} 
    Sleep    5

กดปุ่ม log in
    Element Should Be Visible            ${LOCATOR_BUTTON_LOGIN}
    Click Button                         ${LOCATOR_BUTTON_LOGIN}

พบข้อความแสดง login succeeded   
    Page Should Contain                  ${TEXT_SUCCESS}

พบข้อความแสดง log in failed
    Page Should Contain                 ${TEXT_FAILED}

