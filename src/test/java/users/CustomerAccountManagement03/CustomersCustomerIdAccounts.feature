
Feature: Customer

  # Background:

    @Microservicios
  Scenario:  Customers accounts POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../CustomerManagement01/Customers.feature@Microservicios")


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


  Scenario:  Customers accounts GET

    * call read("../CustomerAccountManagement03/CustomersCustomerIdAccounts.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/accounts'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts exists, success."

  Scenario:  Customers accounts GET {accountId}

    * call read("../CustomerAccountManagement03/CustomersCustomerIdAccounts.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/accounts/' + capturarVariableaccountId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts exists."

  Scenario:  Customers accounts PUT {accountId}

    * call read("../CustomerAccountManagement03/CustomersCustomerIdAccounts.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/accounts/' + capturarVariableaccountId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request { "accountStatus": "ACTIVE", "approvalState": "PENDING", "expirationDatetime": "2023-03-01T20:00:00"}
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated."

  Scenario:  Customers accounts delete {accountId}

    * call read("../CustomerAccountManagement03/CustomersCustomerIdAccounts.feature@Microservicios")
    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/accounts/' + capturarVariableaccountId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method delete
    Then status 200
    And match $.messageResponse.responseDetails == "Accounts updated."