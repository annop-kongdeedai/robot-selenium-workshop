*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}    http://automationpractice.com/index.php
${BROWSER}    chrome

*** Test Cases ***

OPEN BROWSER
    Open Browser    url=${URL}    browser=${BROWSER}
    # Input Text    ${inputElement}    iphone11
    # Press Keys    None    RETURN

VIEW CONTACT US DETAIL
     ${inputElement}=    Set Variable    id:contact-link
     
     Click Element    ${inputElement}
     Wait Until Page Contains    send a message    
     Select From List By Value    id:id_contact    2   
     Sleep    3      


SIGN IN
    ${signUpButton}=    Set Variable    css:a.login
    Click Element    ${signUpButton} 
    Page Should Contain    Create an account   

CLOSE BROWSER
    Close Browser
    