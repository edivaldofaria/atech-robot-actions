*** Settings ***
Documentation        Testes de login

Library            Browser
Resource           ../resources/base.resource


Test Setup         Start Session
Test Teardown      Finish Session     


*** Test Cases ***
Deve Logar com sucesso
   ${user}       Create Dictionary        user=qa    password=xperience

   Submit login form    qa        xperience
   Pop Up Should Be     Suas credenciais são válidas :)

Não deve logar se a senha for incorreta   
  Submit login form    qa        123456
  Toast Should Be      Oops! Credenciais inválidas :(

User deve ser obrigatorio
  Submit login form    ${EMPTY}    123456
  Toast Should Be      Informe o seu nome de usuário!  

Email deve ser obrigatoria
  Submit login form    qa    ${EMPTY}
  Toast Should Be      Informe a sua senha secreta!