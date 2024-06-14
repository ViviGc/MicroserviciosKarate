
Feature: Customer

  # Background:

    @Microservicios
  Scenario:  CustomersID Domains POST

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }


    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/domains'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    * def variableRandom = generarData.generarNumero(16)
    When request { "domains": [{"domain": #(variableRandom),"status": "ACTIVE"}]}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "The Customer Domains was created successfully to the Customer " + capturarVariablecustomerId


  Scenario:  CustomersID Domains GET

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/domains'
    And params { pageSize: 10, pageNumber: 1,domainName:colombia }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "The Customer Domains were obtained successfully to the Customer " + capturarVariablecustomerId


  Scenario:  CustomersID Domains PUT

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/domains'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request {"domains": [{"customerDomainId": #(capturarVariablecustomerDomainId) ,"customerDomain": "CAMPOS1234COMPAÑU12BOGOTARESULTA123COLOMBIAPRUEBAS","status": "ACTIVE"}]}
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Parameter Subscription values Updated Successfully"
    And print capturarVariablecustomerId
    And print capturarVariablecustomerDomainId


  Scenario:  CustomersID Domains GET {domains}

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/domains/' + capturarVariablecustomerDomainId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Customer Domain Exists"















