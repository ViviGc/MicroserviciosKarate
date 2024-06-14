
Feature: CustomerTypeManagement

  # Background:

    @Microservicios
  Scenario:  CustomerTypeManagement POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }


    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customerTypes'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    * def variableRandom = generarData.generarNumero(50)
    When request { "customerTypeValue": #(variableRandom), "customerTypeLabel": "CAMPOS1234COMPAÑU12BOGOTARESULTA121COLOMBIAPRUEBAS"}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Customer Type Created Successfully"
    And def capturarVariablecustomerTypeId = $.data.customerType.customerTypeId
    And def capturarVariablecustomerTypeId1 = $.data.customerType.customerTypeId
    And print capturarVariablecustomerTypeId
    And print capturarVariablecustomerTypeId1


  Scenario:  CustomerTypeManagement PUT {customerTypeId}

    * call read("../Customer_TypeManagement00/CustomerTypeManagement.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customerTypes/' + capturarVariablecustomerTypeId1
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "customerTypeValue": #(variableRandom) , "customerTypeLabel": "CAMPOS1234COMPAÑU12BOGOTARESULTA121COLOMBIAPRUEBAS" }
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "CustomerType was Updated Successfully"


  Scenario:  CustomerTypeManagement GET {customerTypeId}

    * call read("../Customer_TypeManagement00/CustomerTypeManagement.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customerTypes/' + capturarVariablecustomerTypeId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Success Get a CustomerType Transaction"

  Scenario:  CustomerTypeManagement GET

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customerTypes'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Obtained the CustomerTypes successfully"








