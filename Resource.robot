*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}      https://www.kabum.com.br/

*** keywords ***
### Setup e Teardown
Abrir navegador
  Open Browser   https://www.kabum.com.br/  ${BROWSER}
Fechar navegador
  Close Browser

### Passo-a-Passo
Acessar a home do site
  Go To    https://www.kabum.com.br/
Clicar no botão Login
  Click Element  id=linkLoginHeader
Preencher email e senha
  Wait Until Element Is Enabled    id=onetrust-accept-btn-handler
  Click Element                    id=onetrust-accept-btn-handler
  Input Text                       inputUsuarioLogin  testekabum@test.com
  Input Text                       inputSenhaLogin    123mudar@
Clicar em Entrar
  Click Element       id=botaoLogin
Conferir se a mensagem "${MENSAGEM_ALERTA}" foi exibida
  Wait Until Element Is Visible     //*[@id='formLogin']/div[1]/div[2]/div/div[2]
  Element Text Should Be            //*[@id='formLogin']/div[1]/div[2]/div/div[2]    ${MENSAGEM_ALERTA}

Digitar "${PRODUTO}" no campo pesquisar e clicar avançar
  Input Text      id=input-busca    ${PRODUTO}
  Click Element   xpath=//*[@id='barraBuscaKabum']/div/form/button
Clicar em Games no sub menu todos os departamentos
  Mouse Over        xpath=//*[@id='menuExpansivelCategorias']/div/div/div/nav/div/button
  Click Element     xpath=//*[@id='menuExpansivelCategorias']/div/div/div/nav/div/div/div[1]/div/a[3]
Selecionar um produto e clicar em comprar
  Scroll Element Into View    xpath=//*[@id='listing']/article/section/div[2]/div/main/div[2]/a/img
  Click Element               xpath=//*[@id='listing']/article/section/div[2]/div/main/div[2]/a/img
  Click Element               xpath=//*[@id='blocoValores']/div[2]/button
Conferir se o produto está no carrinho "${MENSAGEM_SUCESSO}"
  Wait Until Element Is Visible    xpath=//*[@id='__next']/div[1]/section/div/div[2]
  Element Text Should Be           xpath=//*[@id='__next']/div[1]/section/div/div[2]   ${MENSAGEM_SUCESSO}
