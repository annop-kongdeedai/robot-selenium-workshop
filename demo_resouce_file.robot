*** Settings ***
Library    SeleniumLibrary    
Library    String    
Suite Setup    Ecommerce suit setup 
Suite Teardown    Ecommerce suit teardown
Test Setup    Ecommerce test setup
Resource    ../resources/common.resource
Resource    ../resources/homepage.resource
Resource    ../resources/checkoutsummarypage.resource
Resource    ../stepdefinitions/purchase_product_steps.resource

*** Test Cases ***
TEST IMPORT SELENIUM RESOURCE FILE
    ${contactLink}=    Get Text    id:contact-link
    Log    ${contactLink}
    

DEMO PAGE RESOURCE
    homepage.Add product to shopping cart    1
    homepage.Checkout_product 
    checkoutsummarypage.Wait unti page load success
    checkoutsummarypage.Verify total product price    16.51
    checkoutsummarypage.Verify shipping fee    2.00
    checkoutsummarypage.Verify total price 
    
# UNAUTHEN USER CHECKOUT A PRODUCT (ATDD PATTERN)
    # [Tags]    ignore  
    # Given Unauthen user add product "1" to shipping cart
    # When I checkout product
    # Then I should see total product price equal to "$16.61"
    # And I should see total shipping fee equal to "$2.00"
    # AND I should see total price equal to "$18.51"
    # AND I should see total price equal to summary price
   
    
