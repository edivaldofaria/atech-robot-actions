*** Settings ***
Documentation        Ações e elmentos da pagina de login
Library              Browser


*** Keywords ***
Submit login form
    [Arguments]        ${user}        ${password}

    Fill Text          css=input[name=user]        ${user}
    Fill Text          css=input[name=pass]        ${password}

    Click              css=button >> text=Entrar

Pop Up Should Be
   [Arguments]         ${expected_text}   

   ${element}          Set Variable         css=.swal2-html-container   

   Wait For Elements State    ${element}   visible     5
   Get Text    ${element}     equal    ${expected_text}   

Toast Should Be
   [Arguments]    ${expected_text}

   ${element}          Set Variable         css=.toast-message div[role=status]

   Wait For Elements State    ${element}   visible     5
   Get Text    ${element}      equal    ${expected_text}   
  
   