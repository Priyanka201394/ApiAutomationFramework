@DatatypeMatch
Feature: To test the get end point of the Books API
 Background: Setup the Base path
  Given url baseUrl

 Scenario Outline: To validate if the book API data is present as per the requirement 
  	And path '/books/'+<No>
  	When method GET
  	Then status 200
  	And match $.name == '#string? _.length >= 1'
  	And match $.isbn == '#string? _.length >= 1'
  	And match $.numberOfPages == '#number? _ >= 1'
  	And match $.publisher == '#string'
  	And match $.country == '#string'   	
  	And match $.authors == '#array'
  	And match $.mediaType == '#string'

  	And match $.characters == '#array' 
  	And match $.povCharacters == '#array' 	
  	Examples: 
	|No|
	|1|
	|2|
	|3|
	|4|
	|5|
	|6|
	|7|
	|8|
	|9|
	|10|
	|11|
	|12|
	
 Scenario: To validate if the characters API dataType is present as per the requirement 
  	And path '/characters/2'
  	When method GET
  	Then status 200
  	And match $.name == '#string'
  	And match $.gender == '#string? _.length >= 1'
  	And match $.culture == '#string'
  	And match $.born == '#string'
  	And match $.died == '#string' 
  	And match $.titles == '#array'
  	And match $.aliases == '#array'
  	And match $.father == '#string'
  	And match $.mother == '#string'
  	And match $.spouse == '#string' 
  	And match $.allegiances == '#array'
  	And match $.books == '#array? _.length >= 0'
  	And match $.povBooks == '#array'
  	And match $.tvSeries == '#array'
  	And match $.playedBy == '#array'

 Scenario: To validate if the houses API dataType is present as per the requirement 
  	And path '/houses/1'
  	When method GET
  	Then status 200
  	And match $.name == '#string'
  	And match $.region == '#string'
  	And match $.coatOfArms == '#string'
  	And match $.words == '#string'
  	And match $.titles == '#array' 
  	And match $.seats == '#array'
  	And match $.currentLord == '#string'
  	And match $.heir == '#string'
  	And match $.overlord == '#string'
  	And match $.founded == '#string' 
  	And match $.founder == '#string'
  	And match $.diedOut == '#string'
  	And match $.ancestralWeapons == '#array'
  	And match $.cadetBranches == '#array'
  	And match $.swornMembers == '#array'
  	
  	
  	


	
	
