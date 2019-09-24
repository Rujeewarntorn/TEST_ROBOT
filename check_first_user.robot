*** Settings ***
Library           Selenium2Library
Library           BuiltIn
Suite Setup       เปิดหน้าสร้างผู้ใช้ใหม่
Suite Teardown    ปิดหน้าเว็บ

*** Test Cases ***
สมัครลูกค้าใหม่
    ไปที่หน้าตรวจสอบรายชื่อผู้ใช้
    เช็คว่ารายชื่อแรกต้องเป็น User JD เท่านั้น
    
*** Keywords ***
เปิดหน้าสร้างผู้ใช้ใหม่
    Open Browser                https://robot-stage-1.firebaseapp.com/#/user/create-user    gc

ไปที่หน้าตรวจสอบรายชื่อผู้ใช้
    Click Element    id=list-user

เช็คว่ารายชื่อแรกต้องเป็น User JD เท่านั้น
    Sleep   2s
    ${aaa}       Get Table Cell         //*[@id="user-table"]/table             2       1  
    Table Row Should Contain     //*[@id="user-table"]/table     1    User JD

ปิดหน้าเว็บ
    Close Browser