*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir navegador
# Test Teardown   Fechar navegador

### SETUP roda keywords antes da suite ou antes de um teste
### TERDOWN roda keyword depois de um suite ou um teste

*** Variables ***
${URL}        https://www.kabum.com.br/
${BROWSER}    chrome

*** Test Case ***
Caso de teste 01: Fazer a validação de usuário inválido
  Acessar a home do site
  Clicar no botão Login
  Preencher email e senha
  Clicar em Entrar
  Conferir se a mensagem "Dados inválidos, tente novamente!" foi exibida
# Caso de teste 02: Fazer a busca por iphone e validar a exibição dos produtos
  Digitar "iphone" no campo pesquisar e clicar avançar
# Caso de teste 03: Selecionar um produto na aba de categorias e adiciona-lo ao carrinho
  Clicar em Games no sub menu todos os departamentos
  Selecionar um produto e clicar em comprar
  Conferir se o produto está no carrinho "PRODUTO ADICIONADO NO CARRINHO"
#
# *** keywords ***
