*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}        https://www.kabum.com.br/
${BROWSER}    chrome

*** Test Case ***
Cenário 01: Fazer a validação de usuário inválido
  Dado que estou na home do site
  Quando clicar no botão Login
  E preencher email e senha incorretos
  E clicar em Entrar
  Então a mensagem "Dados inválidos, tente novamente!" deve ser exibida
Cenário 02: Fazer a busca por iphone e validar a exibição dos produtos
  Dado que estou na home do site
  Quando Digitar "iphone" no campo pesquisar
  Então os produtos retornaram corretamente na busca
Cenário 03 de teste 03: Selecionar um produto na aba de categorias e adiciona-lo ao carrinho
  Dado que estou na home do site
  Quando clicar em "Games" no sub menu todos os departamentos
  E clicar em Comprar
  Então o produto deve ir para o carrinho

*** keywords ***
