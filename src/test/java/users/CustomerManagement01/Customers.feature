
Feature: Customer

  # Background:

    @Microservicios
  Scenario:  Customers POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }


    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    * def variableRandom = generarData.generarNumero(16)
    When request { "customerName": #(variableRandom),"businessName": #(variableRandom),"customerDocumentNumber": #(variableRandom),"customerDocumentType": "NT","customerCode": #(variableRandom),"regulatedSFC": #(variableRandom),"logo": "","incomes": "80","expenses": "40","assets": "4","passives": "3","equity": "1","customerDomain": [{"domain": "gufum","status": "ACTIVE"}],"customerTypes": [{"customerTypeId": "0a91337e-8c88-1ce7-818c-8d87e2d8003d"}],"customerAddressInformation": {"customerCountry": "CO","customerDepartment": "CUNDINAMARCA","customerProvince": "BOGOTA","customerCity": "BOGOTA","customerAddress": "calle falsa 123"},"customerPhone": {"phoneCode": "57","phoneNumber": "3161002233"},"customerEmail": "fudrayepsu@gufum.com","ciiuCode": {"activity": "Estudios de mercado.","ciiuCode": "7320"},"customerOwners": [{"name": "Juan higuera","documentType": "CC","documentNumber": "123456","relation": "REPRESENTANTE_LEGAL","pep": "SI"}],"termsAndConditionVersion": "","policyVersion": "","financialInstitutionCode": "","entityType": "PUBLIC","eanCode": "","compensationCode": "","limitUse": ""}
    And method POST
    Then status 200
    And match $.messageResponse.responseDetails == "Customer Created Successfully"
    And def capturarVariablecustomerId = $.data.customer.customerId
    And def capturarVariablecustomerTypeId1 = $.data.customerType.customerTypeId
    And def capturarVariablecustomerDomainId = $.data.customer.customerDomains[0].customerDomainId
    And def capturarVariablecustomerOwnerId = $.data.customer.customerOwners[0].customerOwnerId
   # And def capturarVariablevariableRandom = $.data.variableRandom
    And print capturarVariablecustomerId
    And print capturarVariablecustomerDomainId
    And print capturarVariablecustomerOwnerId



  Scenario:  Customers GET

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Customer exists"


  Scenario:  Customers GET {customerId}

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Customer already exists with id " + capturarVariablecustomerId


  Scenario:  Customers PATCH {customerId}

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "customerTypes": [{"customerTypeId": "0a91335c-8c6e-1435-818c-7da122e4003f","customerTypeValue": "COMPANY","customerTypeLabel": "EMPRESA"}],"customerAddressInformation": {"customerCountry": "CO","customerDepartment": "BOGOTA DC","customerProvince": "BOGOTA","customerCity": "BOGOTA","customerAddress": "calle falsa 123"},"customerPhone": {"phoneCode": "57","phoneNumber": "3161002233"},"customerEmail": "admin@clarocolombia.com","ciiuCode": {"activity": "Estudios de mercado.","ciiuCode": "7320"},"customerDomains": [{"customerDomainId": "a01f0aba-b22a-11ed-afa1-0242ac120002","customerDomain": "clarocolombia","status": "ACTIVE"}],"customerOwners": [{"customerOwnerId": "a01f0aba-b22a-11ed-afa1-0242ac120002","name": "Juanito Perez","documentType": "CC","documentNumber": "123456","relation": "REPRESENTANTE_LEGAL","pep": "SI"}],"termsAndConditionVersion": "R 1.2.1","policyVersion": "R 1.2.1","customerName": "Claro Colombia","entityType": "PUBLIC","eanCode": "123456789","logo": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUSEh","regulatedSFC": "987111","incomes": "872727222","expenses": "41717111","assets": "12211111","passives": "3901111","equity": "567890"}
    And method PATCH
    Then status 200
    And match $.messageResponse.responseDetails == "Customer Consulted Successfully"


  Scenario:  Customers PUT {customerId}

    * call read("../CustomerManagement01/Customers.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/status'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "customerStatus": "INACTIVE"}
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Customer State Updated Successfully"












