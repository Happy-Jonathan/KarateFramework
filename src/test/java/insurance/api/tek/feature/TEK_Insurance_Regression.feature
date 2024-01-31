@Regression
Feature: TEK Insurance Regression Suite

  Background:
    Given url appURL
    * def tokenGenerator = callonce read('generateToken.feature@GenerateToken')
    * def tokenValue = tokenGenerator.response.token
    * header Authorization = 'Bearer ' + tokenValue
    * def generator = Java.type('insurance.api.tek.utility.DataGenerator')

    Scenario: Post Account
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def title = generator.getTitle()
    * def gender = generator.getGender()
    * def employmentStatus = generator.getEmploymentStatus()
    * def maritalStatus = generator.getMaritalStatus()
    * def dateOfBirth = generator.getDateOfBirth()
    * path '/api/accounts/add-primary-account'
    * request
      """
      {
  "id": 0,
  "email": "#(email)",
  "firstName": "#(firstName)",
  "lastName": "#(lastName)",
  "title": "#(title)",
  "gender": "#(gender)",
  "maritalStatus": "#(maritalStatus)",
  "employmentStatus": "#(employmentStatus)",
  "dateOfBirth": "#(dateOfBirth)",
  "new": true
}
      """
    * method post
    * status 201
    * print response
    * karate.write(response, 'RegressionCreatedAccount.json')

  Scenario: Post Car
    * def make = generator.getMake()
    * def model = generator.getModel()
    * def year = generator.getYear()
    * def licensePlate = generator.getLicensePlate()
    * path '/api/accounts/add-account-car'
    * def primaryPersonIdValue = read('file:./target/RegressionCreatedAccount.json')
    * param primaryPersonId = primaryPersonIdValue.id
    * request
    """
    {
  "make": "#(make)",
  "model": "#(model)",
  "year": "#(year)",
  "licensePlate": "#(licensePlate)"
}
    """
    * method post
    * status 201
    * print response
    * karate.write(response, 'RegressionPostCar.json')

    Scenario: Put Car
      * def make = generator.getMake()
      * def model = generator.getModel()
      * def year = generator.getYear()
      * def licensePlate = generator.getLicensePlate()
      * path '/api/accounts/update-account-car'
      * def extractCarId = read('file:./target/RegressionPostCar.json')
      * def carIdValue = extractCarId.id
      * def primaryPersonIdValue = read('file:./target/RegressionCreatedAccount.json')
      * param primaryPersonId = primaryPersonIdValue.id
      * request
      """
      {
  "id": #(carIdValue),
  "make": "#(make)",
  "model": "#(model)",
  "year": "#(year)",
  "licensePlate": "#(licensePlate)"
}
      """
      * method put
      * status 202
      * print response

  Scenario: Delete Car
    * path '/api/accounts/delete-car'
    * def extractCarId = read('file:./target/RegressionPostCar.json')
    * def carIdValue = extractCarId.id
    * param carId = carIdValue
    * method delete
    * status 202
    * print response
    * match response.message contains 'had been deleted'

    Scenario: Post Address
      * def addressType = generator.getAddressType()
      * def addressLine1 = generator.getAddressLine1()
      * def city = generator.getCity()
      * def state = generator.getState()
      * def postalCode = generator.getPostalCode()
      * def countryCode = generator.getCountryCode()
      * path 'api/accounts/add-account-address'
      * def primaryPersonIdValue = read('file:./target/RegressionCreatedAccount.json')
      * param primaryPersonId = primaryPersonIdValue.id
      * request
"""
{
  "addressType": "#(addressType)",
  "addressLine1": "#(addressLine1)",
  "city": "#(city)",
  "state": "#(state)",
  "postalCode": "#(postalCode)",
  "countryCode": "#(countryCode)",
  "current": true
}
"""
      * method post
      * status 201
      * print response
      * karate.write(response, 'RegressionPostAddress.json')

      Scenario: Put Address
        * def addressType = generator.getAddressType()
        * def addressLine1 = generator.getAddressLine1()
        * def city = generator.getCity()
        * def state = generator.getState()
        * def postalCode = generator.getPostalCode()
        * def countryCode = generator.getCountryCode()
        * path 'api/accounts/update-account-address'
        * def extractAddressId = read('file:./target/RegressionPostAddress.json')
        * def addressIdValue = extractAddressId.id
        * def primaryPersonIdValue = read('file:./target/RegressionCreatedAccount.json')
        * param primaryPersonId = primaryPersonIdValue.id
        * request
        """
{
  "id": #(addressIdValue),
  "addressType": "#(addressType)",
  "addressLine1": "#(addressLine1)",
  "city": "#(city)",
  "state": "#(state)",
  "postalCode": "#(postalCode)",
  "countryCode": "#(countryCode)",
  "current": true
}
        """
        * method put
        * status 202
        * print response

  Scenario: Delete Address
    * path '/api/accounts/delete-address'
    * def extractAddressId = read('file:./target/RegressionPostAddress.json')
    * def addressIdValue = extractAddressId.id
    * param addressId = addressIdValue
    * method delete
    * status 202
    * print response
    * match response.message contains 'had been deleted'