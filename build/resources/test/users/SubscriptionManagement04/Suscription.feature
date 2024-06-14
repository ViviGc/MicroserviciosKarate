
Feature: Customer

  # Background:

  @Microservicios
  Scenario:  Customers POST

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../CustomerManagement01/Customers.feature@Microservicios")

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

  Scenario:  Customers GET

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../CustomerManagement01/Customers.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions'
    And params { pageSize: 10, pageNumber: 1 }
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Subscription state consult Successfully"

  Scenario:  Products PUT {productId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Suscription.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    When request {"subscriptionName": "90012399990998","status": "ACTIVE","customerDocumentNumber": "customerDocumentNumber","customerName": "customerName","customerCode": "customerCode", "customerDocumentType": "customerDocumentType", "contacts": [{"subscriptionContactId": "0a9133bb-8ccc-1e3e-818c-da50fd020047","subscriptionId": "0a9133bb-8ccc-1e3e-818c-d13929b40000","name": "Maria","email": "jj@gmail.com","telephoneNumber": "1121212121","contactType": "AB"}]}
    And method PUT
    Then status 200
    And match $.messageResponse.responseDetails == "Subscription was updated successfully"

  Scenario:  Products GETID {productId}

    * def generarData = Java.type('Utilidades.generarData')
    * configure ssl = { trustAll: true }
    * call read("../SubscriptionManagement04/Suscription.feature@Microservicios")

    Given url 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customers/' + capturarVariablecustomerId + '/subscriptions/' + capturarVariablesubscriptionId
    * header message-uuid = 'acxff62e-6f12-42de-9012-1e7304418abd'
    * header request-app-id = 'c4e6bd04-5149-11e7-b114-a2f933d5fe66'
    * header Content-Type = 'application/json'
    And method GET
    Then status 200
    And match $.messageResponse.responseDetails == "Subscription was consulted successfully"
