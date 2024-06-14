
Feature: Customer

  # Background:

    @Microservicios

  Scenario:  Customers GET Products By CustomerID

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-aws-prb-alb-back-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/products'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Consult of the products of a Customer successful"


  Scenario:  Customers GET ProductByID

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-aws-prb-alb-back-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/0a91337e-8c88-1ce7-818c-b2785f9f00c3/products/0a9134fb-8ccc-1191-818c-d138bfa10000'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == ""


