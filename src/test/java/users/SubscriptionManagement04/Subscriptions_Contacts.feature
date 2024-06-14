
Feature: Customer

  # Background:

  @Microservicios
  Scenario:  SubscriptionContacts POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/contacts'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    When request { "name": #(variableRandom), "email": "luis.lopez@mail.com", "telephoneNumber": "3003000000", "contactType": "Tipo de Contacto" }
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Account added to the Subscription successfully"
    And print capturarVariablecustomerId
    And print capturarVariablesubscriptionId
    And def capturarVariablesubscriptionContactId = $.data.contact.subscriptionContactId
    And print capturarVariablesubscriptionBusiness
    And print capturarVariablesubscriptionContactId


  Scenario:  SubscriptionContacts GET

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/contacts'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "The request of Accounts list was successful"

  Scenario:  SubscriptionContacts GETID {BusinessId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Contacts.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/contacts/' + capturarVariablesubscriptionContactId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated on the Subscription successfully"

  Scenario:  SubscriptionBusinessAccounts PUT {BusinessId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/contacts'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "contacts": [ { "id": "zz1f0asa-b22a-11ed-afa1-0242ac120f12", "name": "Luis Lopez 02", "email": "luis.lopez@mail.com", "telephoneNumber": "3003000000", "contactType": "Tipo de Contacto" } ] }
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated on the Subscription successfully"

