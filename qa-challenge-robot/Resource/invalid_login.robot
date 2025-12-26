*** Settings ***
Resource     ./resource.robot
variables    ./variables.py

Test Setup        เปิดบราวเซอร์    
Test Teardown     ปิดบราวเซอร์

*** Tasks ***
ทดสอบ login ไม่สำเร็จ (กรอก username ไม่ถูกต้อง)
    # test step
    กรอกข้อมูล Username ไม่ถูกต้อง
    กรอกข้อมูล Password
    กดปุ่ม log in
    # output
    พบข้อความแสดง log in failed

ทดสอบ login ไม่สำเร็จ (กรอก password ไม่ถูกต้อง)
    # test step
    กรอกข้อมูล Username 
    กรอกข้อมูล Password ไม่ถูกต้อง
    กดปุ่ม log in
    # output
    พบข้อความแสดง log in failed

ทดสอบ login ไม่สำเร็จ (กรอก username และ password ไม่ถูกต้อง)
    # test step
    กรอกข้อมูล Username ไม่ถูกต้อง
    กรอกข้อมูล Password ไม่ถูกต้อง
    กดปุ่ม log in
    # output
    พบข้อความแสดง log in failed

ทดสอบ login ไม่สำเร็จ (ไม่กรอก username)
    # test step
    กรอกข้อมูล Password
    กดปุ่ม log in
    # output
    พบข้อความแสดง log in failed

ทดสอบ login ไม่สำเร็จ (ไม่กรอก password)
    # test step
    กรอกข้อมูล Username
    กดปุ่ม log in
    # output
    พบข้อความแสดง log in failed

ทดสอบ login ไม่สำเร็จ (ไม่กรอกทั้ง username และ password)
    # test step
    กดปุ่ม log in
    # output
    พบข้อความแสดง log in failed