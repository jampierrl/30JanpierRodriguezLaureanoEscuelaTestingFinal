@regresion
Feature: Automatizar Users - Pet Store

  Background:
    * url apiPetStore
    * def jsonCrearUser = read('classpath:examples/jsonData/users/crearUser.json')
    * def jsonActualizarUser = read('classpath:examples/jsonData/users/actualizarUser.json')

  @TEST-1 @happypath
  Scenario: Crear usuario correctamente
    Given path 'user'
    And request jsonCrearUser
    When method post
    Then status 200

  @TEST-2 @happypath
  Scenario: Buscar usuario existente
    Given path 'user', 'jampierTest'
    When method get
    Then status 200
    And match response.username == 'jampierTest'

  @TEST-3 @happypath
  Scenario: Actualizar usuario existente
    Given path 'user', 'jampierTest'
    And request jsonActualizarUser
    When method put
    Then status 200

  @TEST-4 @happypath
  Scenario: Login correcto
    Given path 'user/login'
    And param username = 'jampierTest'
    And param password = 'Test123!'
    When method get
    Then status 200

  @TEST-5 @happypath
  Scenario: Logout correcto
    Given path 'user/logout'
    When method get
    Then status 200

  @TEST-6 @happypath
  Scenario: Eliminar usuario existente
    Given path 'user', 'jampierTest'
    When method delete
    Then status 200

  @TEST-7 @unhappypath
  Scenario: Buscar usuario inexistente
    Given path 'user', 'usuarioFake999'
    When method get
    Then status 404

  @TEST-8 @unhappypath
  Scenario: Login con credenciales incorrectas
    Given path 'user/login'
    And param username = 'fakeUser'
    And param password = 'wrongPass'
    When method get
    Then status 400