
Feature: Customer

  # Background:

    @Microservicios
  Scenario:  CustomersID Owners POST

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }


    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/owners'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    * def variableRandom = generarData.generarNumero(16)
    When request {"customerOwners": [{"name": "Juanito Perez","documentType": "CC","documentNumber": "12345687","relation": "REPRESENTANTE_LEGAL","pep": "SI"}]}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "The Customer Domains was created successfully to the Customer " + capturarVariablecustomerId


  Scenario:  CustomersID Owners GET

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/owners'
    And params { pageSize: 10, pageNumber: 1}
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "The Customer Domains were obtained successfully to the Customer " + capturarVariablecustomerId


  Scenario:  CustomersID Owners PUT

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/owners'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request {"customerOwners": [{"customerOwnerId": #(capturarVariablecustomerOwnerId),"name": "Juan higuera","documentType": "CC","documentNumber": "123456","relation": "REPRESENTANTE_LEGAL","pep": "SI"}]}
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Customer Owner Updated Successfully"
    And print capturarVariablecustomerId
    And print capturarVariablecustomerDomainId
    And print capturarVariablecustomerOwnerId


  Scenario:  CustomersID Owners GET {ownerID}

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/owners/' + capturarVariablecustomerOwnerId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Customer Owner Exists"

  Scenario:  CustomersID Owners DEL {ownerID}

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/owners/' + capturarVariablecustomerOwnerId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method DELETE
    Then status 200
    And match $.messageResponse.responseDetails == "Customer Owner Exists"















