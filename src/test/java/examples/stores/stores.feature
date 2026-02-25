@regresion
Feature: Automatizar Store - Pet Store

  Background:
    * url apiPetStore
    * def jsonOrder = read('classpath:examples/jsonData/store/crearOrder.json')


  @TEST-1 @happypath @crearOrder
  Scenario: Crear una orden correctamente
    Given path 'store/order'
    And request jsonOrder
    When method post
    Then status 200
    And match response.status == 'placed'

  @TEST-2 @happypath @buscarOrder
  Scenario: Buscar orden por ID existente
    Given path 'store/order', 1010
    When method get
    Then status 200
    And match response.id == 1010

  @TEST-3 @happypath @eliminarOrder
  Scenario: Eliminar orden existente
    Given path 'store/order', 1010
    When method delete
    Then status 200

  @TEST-4 @unhappypath
  Scenario: Buscar orden inexistente
    Given path 'store/order', 99999999
    When method get
    Then status 404

  @TEST-5 @unhappypath
  Scenario: Eliminar orden inexistente
    Given path 'store/order', 99999999
    When method delete
    Then status 404