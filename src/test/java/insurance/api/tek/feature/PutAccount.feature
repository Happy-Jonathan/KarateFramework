Feature: TEK Insurance Put Account API

  Background:
    Given url appURL
    * def tokenGenerator = call read('generateToken.feature@GenerateToken')
    * def getTokenValue = tokenGenerator.response.token
    * header Authorization = 'Bearer ' + getTokenValue


    Scenario: Put Primary Person Account Phone
      * path '/api/accounts/update-account-phone'
      * def primaryPersonIdValue = read('file:./target/createdAccount.json')
      * param primaryPersonId = primaryPersonIdValue.id
      * def phoneIdExtraction = call read('PostAccount.feature@postPhone')
      * def phoneIdValue = phoneIdExtraction.phoneId
      * print phoneIdValue
      * request
      """
{
  "id": #(phoneIdValue),
  "phoneNumber": "1002003000",
  "phoneExtension": "400",
  "phoneTime": "Afternoon",
  "phoneType": "Cell Phone"
}
      """
      * method put
      * status 200
      * print response