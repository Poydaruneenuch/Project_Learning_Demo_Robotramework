*** Settings ***

resource     ./resource.robot
variables    ./variables.py

Test Setup        เปิดบราวเซอร์    
Test Teardown     ปิดบราวเซอร์

*** Tasks ***
ทดสอบ login สำเร็จ
    # test step
    กรอกข้อมูล Username
    กรอกข้อมูล Password
    กดปุ่ม log in
    # output
    พบข้อความแสดง login succeeded