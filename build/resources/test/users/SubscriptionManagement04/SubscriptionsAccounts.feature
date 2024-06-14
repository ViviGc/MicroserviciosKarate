
Feature: Customer

  # Background:

  @Microservicios
  Scenario:  SubscriptionAccounts POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../CustomerAccountManagement03/CustomersCustomerIdAccounts.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/accounts'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    * def variableRandom = generarData.generarNumero(16)
    When request {"accountType": #(variableRandom),"accountNumber": #(variableRandom),"accountName": #(variableRandom), "accountCode": "99939","financialInstitutionCode": "8730","expirationDatetime": "2023-03-01T20:00:00"}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Account created, success."
    * def data = $.data
    * def account = data.account
    * def accountId = account.accountId
    * print accountId
    And def capturarVariableaccountId = accountId

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    When request {"productId": "0a91331f-8cf9-19f2-818d-7a21423f00ad","customerTypeId": "7f000101-8adc-1104-818a-dc48239d0061","subscriptionName": "Para preubas de subscriptionPara ","customerDocumentNumber": "9001239999994","customerName": "Pedro Perez2232","customerCode": "ABC121","customerDocumentType": "TI","contacts": [{"name": "Maria","email": "jj@gmail.com","telephoneNumber": "1121212121","contactType": "AB"},{"name": "Jose","email": "jose@gmail.com","telephoneNumber": "121212123","contactType": "BE"}]}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Subscription created Successfully"
    And print capturarVariablecustomerId
    And def capturarVariablesubscriptionId = $.data.subscription.subscriptionId
    And print capturarVariablesubscriptionId


    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/accounts/'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    When request { "accountId": #(capturarVariableaccountId) }
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Account added to the Subscription successfully"
    And print capturarVariablecustomerId
    And def capturarVariablesubscriptionId = $.data.subscription.subscriptionId
    And print capturarVariablesubscriptionId
    And print capturarVariableaccountId


    Scenario:  SubscriptionAccounts PUT {SubscriptionAccountsId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../CustomerAccountManagement03/CustomersCustomerIdAccounts.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/accounts'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    * def variableRandom = generarData.generarNumero(16)
    When request {"accountType": #(variableRandom),"accountNumber": #(variableRandom),"accountName": #(variableRandom), "accountCode": "99939","financialInstitutionCode": "8730","expirationDatetime": "2023-03-01T20:00:00"}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Account created, success."
    * def data = $.data
    * def account = data.account
    * def accountId = account.accountId
    * print accountId
    And def capturarVariableaccountId = accountId

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header Content-Type = 'application/json'
    When request {"productId": "0a91331f-8cf9-19f2-818d-7a21423f00ad","customerTypeId": "7f000101-8adc-1104-818a-dc48239d0061","subscriptionName": "Para preubas de subscriptionPara ","customerDocumentNumber": "9001239999994","customerName": "Pedro Perez2232","customerCode": "ABC121","customerDocumentType": "TI","contacts": [{"name": "Maria","email": "jj@gmail.com","telephoneNumber": "1121212121","contactType": "AB"},{"name": "Jose","email": "jose@gmail.com","telephoneNumber": "121212123","contactType": "BE"}]}
    And method POST
    Then status 201
    And match $.messageResponse.responseDetails == "Subscription created Successfully"
    And print capturarVariablecustomerId
    And def capturarVariablesubscriptionId = $.data.subscription.subscriptionId
    And print capturarVariablesubscriptionId

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/accounts/'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "accounts": [ { "accountId": #(capturarVariableaccountId) } ] }
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated on the Subscription successfully"

  Scenario:  SubscriptionAccounts GET {SubscriptionAccountsId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    #Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/accounts'
    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/0a913355-8fcb-197f-818f-f4b5fd790311/subscriptions/0a9133a6-8f4e-17ca-818f-f4b6027a011a/accounts'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "The request of Accounts list was successful"


  Scenario:  SubscriptionAccounts GET {Id}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    #Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId + '/accounts/' + capturarVariableaccountId
    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/0a913355-8fcb-197f-818f-f4b5fd790311/subscriptions/0a9133a6-8f4e-17ca-818f-f4b6027a011a/accounts/10badc5a-7e68-48d1-bf52-b866746ab696'
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated on the Subscription successfully"




