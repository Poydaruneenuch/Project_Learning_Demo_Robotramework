*** Settings ***

resource     ../Resource/todo_keyword_resource.robot
variables    ./Resource/variables.py

Suite Setup         Open ToDo Website
Suite Teardown      Close ToDo Browser

*** Test Cases***

TC-AUT-001 Verify Adding New Task
    [Documentation]    ทดสอบการเพิ่มรายการใหม่
    ...    Step 1: ไปที่หน้า Add Item
    ...    Step 2: กรอกชื่อและกดเพิ่ม
    ...    Step 3: ตรวจสอบว่ารายการขึ้นใน To-Do List
    Add New Task    ${Input_New_Task_1}
    Verify Task Is In ToDo List    ${Input_New_Task_1}
    Sleep   2s

TC-AUT-002 Verify Marking Task as Completed
    [Documentation]    ทดสอบการติ๊กเมื่องานเสร็จ (ย้ายจาก To-Do -> Completed)

    # Action: ทำงานให้เสร็จ
    Mark Task As Completed    ${Input_New_Task_1}
    # Verification
    Verify Task Is In Completed List    ${Input_New_Task_1}
    Sleep   2s

TC-AUT-003 Verify Deleting Task from To-Do List
    [Documentation]    ทดสอบการลบงานออกจากหน้า To-Do    
    # Pre-condition
    Add New Task    ${Input_New_Task_2}
    Sleep   2s
    # Action
    Delete Task From ToDo List    ${Input_New_Task_2}
    Sleep   2s

TC-AUT-004 Verify Deleting Task from Completed List
    [Documentation]    ทดสอบการลบงานออกจากหน้า Completed
    
    # Pre-condition: สร้างงาน -> ทำให้เสร็จ -> ไปอยู่ที่ Completed
    Add New Task    ${Input_New_Task_3}
    Sleep   2s
    Mark Task As Completed    ${Input_New_Task_3}
    Verify Task Is In Completed List    ${Input_New_Task_3}
    Sleep   2s
    # Action
    Delete Task From Completed List    ${Input_New_Task_3}
    Sleep   2s

