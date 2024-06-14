
Feature: Customer

  # Background:

  @Microservicios
  Scenario:  Customers POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }


    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/commons/products'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    * def variableRandom = generarData.generarNumero(16)
    When request {"name": #(variableRandom),"businessLine": "TX","productCode": "11111", "description": "Producto Nuevo para realizar pruebas900123999999434543543543543590012399999943454354354900123999999434543543543543590012399999943499999943454354354900123999999434543543543543590012399999943454354354","logo":"900123999999434543543543543590012399999943454354354900123999999434543543543543590012399999943454354354900123999999434543543543543590012399999943454354354","supportedCustomerTypes": [ {"customerTypeId": "0a91335c-8c6e-1435-818c-7da122e4003f"}]}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Account created, success."
    * def data = $.data
    * def product = data.product
    * def productId = product.productId
    * print productId
    And def capturarVariableproductId = productId


  Scenario:  Customers GET

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/commons/products'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Product exists."

  Scenario:  Customers GET {customerId}

    * call read("../ProductManager02/CustomersCommonsProducts.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/commons/products/' + capturarVariableproductId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Product exists."

  Scenario:  Products PUT {productId}

    * call read("../ProductManager02/CustomersCommonsProducts.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/commons/products/' + capturarVariableproductId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "name": "string", "logo": "BORw0KGgoAAAANSUhEUgAAAc4A", "description": "product for PSE", "productCode": "918111", "supportedCustomerTypes": [{"customerTypeId": "0a91335c-8c6e-1435-818c-7da122e4003f"}]}
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Update success."

  Scenario:  Products delete {productId}

    * call read("../ProductManager02/CustomersCommonsProducts.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/commons/products/' + capturarVariableproductId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method delete
    Then status 200
    And match $.messageResponse.responseDetails == "Delete success."
