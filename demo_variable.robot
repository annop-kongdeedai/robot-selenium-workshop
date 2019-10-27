*** Test Cases ***
DECLARE SCALAR
    ${username}    Set Variable    annop
    ${password}    Set Variable    pass
    LOG    Login with ${username} and ${password}
    
DECLARE LIST
    @{myList}    Create List    Iphone 11    AndroidOreo
    ${iphone}    ${android}    Set Variable   ${myList}
    Log Many    @{myList}      
    LOG    ${myList[0]}

    
DECLARE DICT
    &{dict}    Create Dictionary    firstname=john    lastname=snow
    Log    สวัสดี ${dict.firstname}

 