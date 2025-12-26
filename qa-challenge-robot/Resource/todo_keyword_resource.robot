*** Settings ***
Resource    ./setting.robot
variables    ./variables.py

*** Keywords ***
# ------- reuseable function -------
Open ToDo Website
    Open Browser       ${URL}       chrome
    Maximize Browser Window
    Sleep   3s


Close ToDo Browser
    Close All Browsers
    Sleep    5

Add New Task
    [Arguments]    ${task_name}
    [Documentation]    คลิกแท็บ Add Item และเพิ่มรายการใหม่
    Click Element    ${LOCATOR_TAB_ADD_ITEM}
    Wait Until Element Is Visible    ${LOCATOR_TEXT_FIELD_ADD_ITEM}
    Input Text       ${LOCATOR_TEXT_FIELD_ADD_ITEM}    ${task_name}
    Sleep   2s
    Click Element    ${BTN_ADD_TASK}
    

Mark Task As Completed
    [Arguments]    ${task_name}
    [Documentation]    คลิกแท็บ To-Do และติ๊กถูกที่งานที่ระบุ
    Click Element    ${LOCATOR_TAB_TO_DO_TASK}
    # แทนที่ {} ด้วยชื่อ Task เพื่อสร้าง XPath ที่สมบูรณ์
    Wait Until Page Contains     ${task_name}
    Click Element    ${TASK_1}

Delete Task From ToDo List
    [Arguments]    ${task_name}
    [Documentation]    ลบงานออกจากหน้า To-Do
    Click Element    ${LOCATOR_TAB_TO_DO_TASK}
    Sleep   2s
    Click Element    ${TASK_1}

Delete Task From Completed List
    [Arguments]    ${task_name}
    [Documentation]    ลบงานออกจากหน้า Completed
    Click Element    ${LOCATOR_TAB_COMPLETED}
    Sleep   2s
    Click Element   ${BTN_DELETE_TASK_COMPLETE_1}

# --- Verification Keywords ---
Verify Task Is In ToDo List
    [Arguments]    ${task_name}
    Click Element    ${LOCATOR_TAB_TO_DO_TASK}
    Wait Until Page Contains     ${task_name}

Verify Task Is In Completed List
    [Arguments]    ${task_name}
    Click Element    ${LOCATOR_TAB_COMPLETED}
    Wait Until Page Does Not Contain Element     ${task_name}

