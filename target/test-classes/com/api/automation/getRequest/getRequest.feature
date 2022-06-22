@getRequest
Feature: To test the get end point of the Books API
 Background: Setup the Base path
  Given url baseUrl
  
  Scenario: To get all the books API data in JSON format 
  	And path '/books'
  	When method GET
  	Then status 200
  
  Scenario: To get all the Books API data in JSON Format with path variable
  	And path '/books/11'
  	When method GET
  	Then status 200
  	
  Scenario: To get all the Books API data in JSON format with query parameter
  	And path '/books'
  	And param page = '1'
  	When method GET
  	Then status 200
  	
  Scenario: To get error when the book is not available
  	And path '/books/13'
  	When method GET
  	Then status 404
	
  Scenario: To get all the characters API data in JSON format
  	And path '/characters'
  	When method GET
  	Then status 200
  	
  Scenario: To get all the character API data in JSON Format with path variable
  	And path '/characters/11'
  	When method GET
  	Then status 200
  	
  Scenario: To get all the character API data in JSON format with query parameter
  	And path '/characters'
  	And param page = '1'
  	When method GET
  	Then status 200
 
  Scenario: To get all the Houses API data in JSON format
  	And path '/houses'
  	When method GET
  	Then status 200
  	
  Scenario: To get all the houses API data in JSON Format with path variable
  	And path '/houses/200'
  	When method GET
  	Then status 200
  	
  Scenario: To get all the houses API data in JSON format with query parameter
  	And path '/houses'
  	And param page = '1'
  	When method GET
  	Then status 200
  
  
