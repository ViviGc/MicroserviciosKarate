
Feature: Customer

  # Background:

  @Microservicios
  Scenario:  SubscriptionBusinessAccounts POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business/' + capturarVariablesubscriptionBusiness + '/accounts'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    When request { "accountType": #(variableRandom), "accountNumber": #(variableRandom), "accountName": "Cuenta Ejemplo 11111", "accountCode": "9999", "financialInstitutionCode": "8723", "expirationDatetime": "2023-03-01T20:00:00"}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Subscription Business Account created, success."
    And print capturarVariablecustomerId
    And print capturarVariablesubscriptionId
    And def capturarVariablesubscriptionBusinessAccounts = $.data.account.accountId
    And print capturarVariablesubscriptionBusiness
    And print capturarVariablesubscriptionBusinessAccounts


  Scenario:  SubscriptionBusinessAccounts GET

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business/' + capturarVariablesubscriptionBusiness + '/accounts'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Subscription Business Accounts exists, success."

  Scenario:  SubscriptionBusinessAccounts GETID {BusinessId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business_Accounts.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business/' + capturarVariablesubscriptionBusiness + '/accounts/' + capturarVariablesubscriptionBusinessAccounts
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts exists."

  Scenario:  SubscriptionBusinessAccounts PUT {BusinessId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business_Accounts.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business/' + capturarVariablesubscriptionBusiness + '/accounts/' + capturarVariablesubscriptionBusinessAccounts
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "accountStatus": "ACTIVE", "approvalState": "YES", "expirationDatetime": "2023-03-01T20:00:00" }
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated."

  Scenario:  SubscriptionBusinessAccounts DellID {BusinessId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Subscriptions_Business_Accounts.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/business/' + capturarVariablesubscriptionBusiness + '/accounts/' + capturarVariablesubscriptionBusinessAccounts
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method DELETE
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated."


