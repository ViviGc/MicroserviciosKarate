
Feature: Customer

  # Background:

  @Microservicios
  Scenario:  SubscriptionBusiness POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Suscription.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    When request { "customerDocumentNumber": #(variableRandom), "customerDocumentType": "CC", "customerName": "Luis Lopez", "businessName": "Zapatos11345", "status": "ACTIVE", "businessType": "Local", "address": "Avenida 19 98-76", "city": "Bogta", "department": "Cundinamarca", "email": "email@gmail.com", "telephone": "30018181811", "principalCiiuCode": "2491", "secondaryCiiuCode": "1109", "commerCode": "2345" }
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Account added to the Subscription successfully"
    And print capturarVariablecustomerId
    And print capturarVariablesubscriptionId
    And def capturarVariablesubscriptionBusiness = $.data.business.subscriptionBusinessId
    And print capturarVariablesubscriptionBusiness


  Scenario:  SubscriptionBusiness GET

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Suscription.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "The request of Accounts list was successful"

  Scenario:  SubscriptionBusiness GETID {BusinessId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business/' + capturarVariablesubscriptionBusiness
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated on the Subscription successfully"

  Scenario:  SubscriptionBusiness PUT {BusinessId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "business": [ { "id": "0a9133a6-8f4e-17ca-818f-ba8988500055", "customerDocumentNumber": "123456789212", "customerDocumentType": "CC", "customerName": "Luis Lopez2121212", "businessName": "Pets Shop2", "status": "ACTIVE", "businessType": "Local1", "address": "Avenida 19 98-761", "city": "Bogota", "department": "Cundinamarca1", "email": "email@gmail.com", "telephone": "30018181812", "principalCiiuCode": "2492", "secondaryCiiuCode": "11091", "commerCode": "2346" } ] }
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated on the Subscription successfully"


