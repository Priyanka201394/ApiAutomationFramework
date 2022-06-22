@validateResponse
Feature: To validate the response of the API 
 Background: Setup the Base path
  Given url baseUrl
  
  Scenario: To validate if the character from a book has that book.
  	And path '/books/1'
  	When method GET
  	* def bookresponse = response
  	* def charInBook = bookresponse.characters
  	* def charInBook1 = charInBook[0]
  	When url charInBook1
  	And method GET
  	Then status 200
  	* def charresponse = response
  	* def bookChar = charresponse.books
  	* def bookInCharResponse = bookChar[0]
  	When url bookInCharResponse
  	And method GET
  	* def charBookResponse = response
  	And match bookresponse == charBookResponse
  	
  Scenario: To validate if the povCharcter from books have povBooks
  	And path '/books/1'
  	When method GET
  	* def povCharInBook = response.povCharacters
  	* def povCharInBook1 = povCharInBook[0]
  	When url povCharInBook1
  	And method GET
  	Then status 200
  	* def povBooks = response.povBooks
  	* def povBook1 = povBooks[0]
  	When url povBook1
  	And method GET
  	Then status 200
  	
  Scenario: To validate if the allegiances from a character has that character
  	And path '/characters/2'
  	When method GET
  	Then status 200
  	* def charresponse = response
  	* def charAllegiances = charresponse.allegiances
  	* def charAlleg1 = charAllegiances[0]
  	When url charAlleg1
  	And method GET
  	Then status 200
  	* def allResponse = response
  	* def allegChar = allResponse.swornMembers
  	* def allegChar1 = allegChar[0]
  	When url allegChar1
  	And method GET
  	Then status 200
  	* def charInAll = response
  	And match charInAll == charresponse
  	
  Scenario: To get the Book API data only for version =1
  	And path '/books'
  	And header Accept = 'application/vnd.anapioficeandfire+json; version=1'
  	When method GET
  	Then status 200
  	
  Scenario: To get 'Bad Request' when the Book API data version is not 1
    And path '/books'
  	And header Accept = 'application/vnd.anapioficeandfire+json; version=2'
  	When method GET
  	Then status 400
  	
 
  Scenario: To validate the response of the API against the Json file
  	And path '/books/1'
  	When method GET
  	Then status 200
  	* def apiResponse = response
  	* print apiResponse
  	* def jsonData = call read ('data.json')
  	* def actualResponse = jsonData
  	* print actualResponse
  	And match apiResponse == actualResponse

  
  	