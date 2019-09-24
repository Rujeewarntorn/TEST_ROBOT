*** Settings ***
Library           Selenium2Library
Library           BuiltIn
Suite Setup       เปิดหน้าสร้างผู้ใช้ใหม่
Suite Teardown    ปิดหน้าเว็บ

*** Test Cases ***
สมัครลูกค้าใหม่
    ระบุชื่อนามสกุล "Moonoy Noi"
    ระบุล็อคอิน "MoonoyNoi"
    ระบุรหัสผ่าน "Moonoy123"
    ยืนยันรหัสผ่าน "Moonoy123"
    คลิกปุ่ม ยืนยัน
    บันทึกสำเร็จ "บันทึกสำเร็จ"
    
*** Keywords ***
เปิดหน้าสร้างผู้ใช้ใหม่
    Open Browser                https://robot-stage-1.firebaseapp.com/#/user/create-user    gc

ระบุชื่อนามสกุล "${username}"
    Wait Until Element Is Visible    id=inputName
    Input Text                   id=inputName    ${username}

ระบุล็อคอิน "${Login}"
    Wait Until Element Is Visible     id=inputLogin
    Input Text                   id=inputLogin   ${Login}

ระบุรหัสผ่าน "${Password}"
    Wait Until Element Is Visible    id=inputPassword
    Input Text    id=inputPassword  ${Password}

ยืนยันรหัสผ่าน "${Confirm Password}"
    Wait Until Element Is Visible    id=inputPassword2
    Input Text       id=inputPassword2    ${Confirm Password}

คลิกปุ่ม ยืนยัน
    Wait Until Element Is Visible    id=buttonConfirm
    Click Button                     id=buttonConfirm
    # Click Button                     id=button-close-success-modal

บันทึกสำเร็จ "${regis_customer_result}"
    Wait Until Page Contains         ${regis_customer_result}

ปิดหน้าเว็บ
    Close Browser