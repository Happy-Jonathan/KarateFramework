Feature: TEK Insurance Post Account API

  Background:
    Given url appURL
    * def tokenGenerator = call read('generateToken.feature@GenerateToken')
    * def getTokenValue = tokenGenerator.response.token
    * header Authorization = 'Bearer ' + getTokenValue
    * def generator = Java.type('insurance.api.tek.utility.DataGenerator')

    Scenario: Post Primary Person Account
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

      # this will store JSON response into JSON file for reusability
      * karate.write(response, 'createdAccount.json')

      * match response.email == email
      * match response.firstName == firstName
      * match response.lastName == lastName

    @postPhone
    Scenario: Post Primary Person Account Phone
      * def phoneNumber = generator.getPhoneNumber()
      * def phoneExtension = generator.getPhoneExtension()
      * def phoneTime = generator.getPhoneTime()
      * def phoneType = generator.getPhoneType()
      * path 'api/accounts/add-account-phone'
      * def primaryPersonIdValue = read('file:./target/createdAccount.json')
      * param primaryPersonId = primaryPersonIdValue.id
      * request
      """
{
  "phoneNumber": "#(phoneNumber)",
  "phoneExtension": "#(phoneExtension)",
  "phoneTime": "#(phoneTime)",
  "phoneType": "#(phoneType)"
}
      """
      * method post
      * status 201
      * print response
      * match response.phoneNumber == phoneNumber
      * def phoneId = response.id
      * print phoneId


  Scenario: Post Primary Person Car
    * def make = generator.getMake()
    * def model = generator.getModel()
    * def year = generator.getYear()
    * def licensePlate = generator.getLicensePlate()
    * path 'api/accounts/add-account-car'
    * def primaryPersonIdValue = read('file:./target/createdAccount.json')
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


  Scenario: Post Primary Person Address
    * def addressType = generator.getAddressType()
    * def addressLine1 = generator.getAddressLine1()
    * def city = generator.getCity()
    * def state = generator.getState()
    * def postalCode = generator.getPostalCode()
    * def countryCode = generator.getCountryCode()
    * path 'api/accounts/add-account-address'
    * def primaryPersonIdValue = read('file:./target/createdAccount.json')
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
