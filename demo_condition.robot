*** Test Cases ***

GRADE CACULATION 
    [Documentation]    
    ...    GRADE CACULATION
    ...    >= 80 = A
    ...    70-79 = B
    ...    60-69 = C
    ...    50-59 = D
    ...    < 50 = F
    @{student_score_list} =    Create List    45    67    78    90
    FOR    ${score}    IN    @{student_score_list}
        ${grade}=    Set Variable    GET GRADE    ${score}
        Log    ${grade}    
    END

    

*** Keywords ***
GET GRADE
    [Arguments]    ${score}
    IF    ${score}>=80    Return From Keyword    A 
	...    ELSE IF    ${score}>=70    Return From Keyword    B  
	...    ELSE IF    ${score}>=60    Return From Keyword    C  
	...    ELSE IF    ${score}>=50    Return From Keyword    D   
	...    ELSE    Return From Keyword    F  
    
    
    
