Feature: Generate Access Token for TEK Insurance Application

  #url: pass base url
  #path: pass endpoint of service
  #request: pass json body POST and PUT methods
  #method: pass HTTP/HTTPS method Type (GET, POST, PUT, DElETE)
  #status: validates the response status code
  #print: used for printing the response or variable into console
  #response: prints API Reponse

  Background:
    Given url 'https://qa.insurance-api.tekschool-students.com'

  @GenerateToken
  Scenario: Generate Token
    * path '/api/token'
    * request {"username":"supervisor","password":"tek_supervisor"}
    * method post
    * status 200
    * print response
    * def tokenValue = response.token
    * print tokenValue

  Scenario: Verify Token
    * path '/api/token/verify'
    * def tokenGenerator = call read('generateToken.feature@GenerateToken')
    * def userValue = tokenGenerator.response.username
    * def getTokenValue = tokenGenerator.response.token
    * param username = userValue
    * param token = getTokenValue
    * method get
    * status 200
    * print response


