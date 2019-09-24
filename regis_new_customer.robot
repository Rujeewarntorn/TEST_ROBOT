*** Settings ***
Library           Selenium2Library
Suite Setup       เปิดหน้าสมัครลูกค้าใหม่
Suite Teardown    ปิดหน้าเว็บ

*** Test Cases ***
สมัครลูกค้าใหม่
    กรอกชื่อนามสกุล "Moonoy Noi"
    กรอกอีเมล์ "moonoynoi@gmail.com"
    ระบุเพศ "หญิง"
    ระบุความสนใจ "ช้อปปิ้ง"
    ระบุรายละเอียด "สมัครลูกค้าใหม่"
    ระบุว่าเป็นลูกค้า VIP
    คลิกปุ่ม ยืนยัน
    บันทึกสำเร็จ

*** Keywords ***
เปิดหน้าสมัครลูกค้าใหม่
    Open Browser                https://robot-stage-1.firebaseapp.com/#/user/create-customer    gc

กรอกชื่อนามสกุล "${username}"
    Wait Until Element Is Visible    id=inputName
    Input Text                   id=inputName    ${username}

กรอกอีเมล์ "${Email}"
    Wait Until Element Is Visible     id=inputEmail
    Input Text                   id=inputEmail    ${Email}

ระบุเพศ "${Gender}"
    Wait Until Element Is Visible    id=inputGender
    Select From List By Label    id=inputGender   ${Gender}

ระบุความสนใจ "${Interest}"
    Wait Until Element Is Visible    id=inputInterest
    Select From List By Label       id=inputInterest    ${Interest}

ระบุรายละเอียด "${Detail}"
    Wait Until Element Is Visible    id=inputDetail
    Input Text                       id=inputDetail    ${Detail}

ระบุว่าเป็นลูกค้า VIP
    Wait Until Element Is Visible    id=inputVIP
    Select Checkbox                  id=inputVIP

คลิกปุ่ม ยืนยัน
    Wait Until Element Is Visible    id=buttonConfirm
    Click Button                     id=buttonConfirm

บันทึกสำเร็จ
    Wait Until Page Contains         บันทึกสำเร็จ

ปิดหน้าเว็บ
    Close Browser


