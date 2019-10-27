*** Settings ***
Library    Dialogs    
*** Test Cases ***

SHOW DIALOG
    LOG    STARTING
    Dialogs.Pause Execution    Waiting for seeing an error
    LOG    Continues