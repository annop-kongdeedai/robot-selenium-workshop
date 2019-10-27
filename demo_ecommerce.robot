*** Settings ***
Library    SeleniumLibrary   
Library    String  
Resource    ../resources/common.resource
Suite Setup    Ecommerce suit setup 
Suite Teardown    Ecommerce suit teardown
Test Setup    Ecommerce test setup

*** Test Cases ***
Demo page resource
    ${addToCartButton}=    Set Variable    css:ul#homefeatured a[data-id-product="1"]
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Element    ${addToCartButton} 
    ${processToCheckoutLink}=    Set Variable    css:a[title="Proceed to checkout"]
    Wait Until Element Is Visible    ${processToCheckoutLink} 
    Click Link    ${processToCheckoutLink}     

    Wait Until Page Contains    Shopping-cart summary
	${totalProductsPrice}=    Get Text    id:total_product
	Should Be Equal As Strings    $16.51    ${totalProductsPrice}    
	
    ${totalShippingPrice}=    Get Text    id:total_shipping
	Should Be Equal As Strings    $2.00    ${totalShippingPrice}  
	
    ${totalProductsPriceRemoveDollar}=    Replace String    ${totalProductsPrice}    $    ${EMPTY}   
	${totalShippingPriceRemoveDollar}=    Replace String    ${totalShippingPrice}    $    ${EMPTY}   
    ${totalPriceCalculate}=    Evaluate     ${totalProductsPriceRemoveDollar}+${totalShippingPriceRemoveDollar}
      
    ${totalPrice}=    Get Text    total_price
    ${totalPriceRemoveDollar}=    Replace String    ${totalPrice}    $    ${EMPTY}   
    Should Be Equal As Strings   ${totalPriceRemoveDollar}    ${totalPriceCalculate}  
    # ${totalPrice}=    Get Text    id:total_price
    # Should Be Equal As Strings    $2    ${totalPrice}
    
   