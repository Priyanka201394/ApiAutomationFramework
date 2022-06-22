@IsbnUnique
Feature: To test the get end point of the Books API
 Background: Setup the Base path
  Given url 'https://www.anapioficeandfire.com/api'

 Scenario: To validate if the Isbn value in the Books API has unique values 
 
  	And path '/books'
  	When method GET
  	Then status 200
  	* def responses = response
  	* def isbnPage1 = karate.jsonPath(responses,'$[*].isbn')
  	* def pageHeader = responseHeaders['Link'][0]
  	* def pages = pageHeader.split(",",3)
  	* def func =
  """
   function()
   {
    for(i=0 ; i<pages.length; i++)
    {
     if(pages[i].match("next"))
     {
      return pages[i]
     }
     else{
      return 0
     }
    }
   }
  """
  	* def pagenext = call func
	* def getNextLink = pagenext
  	* def nextLink = getNextLink.split(";",1)
  	* def nextPage = nextLink[0].slice(1,nextLink.length-2)

  	And url nextPage
  	When method GET
  	* def responses2 = response
  	* def isbnPage2 = karate.jsonPath(responses2,'$[*].isbn')
  	* def pageHeader = responseHeaders['Link'][0]
  	* def pages = pageHeader.split(",",3)
  	* def pagenext = call func
	* def getNextLink = pagenext
  	And match getNextLink.pagenext == 0 
  	* def totalisbn = karate.append(isbnPage1,isbnPage2)
  	
  	* def isbnFunc =
  	"""
  	function(){
  	var count =0
  	for(i=0; i<totalisbn.length-1; i++){
  	 	for(j=i+1; j<totalisbn.length; j++){
  	 		if(totalisbn[i]==totalisbn[j])
  	 			{
  	 			count++  
  	 			}
  	 	}
  	}
  	if(count>1)
  	{
  	return totalisbn[i]
  	}else
  	{
  	return "Isbn has unique values"
  	}
  	}
  	"""
  	* def uniqueIsbn = call isbnFunc
  	* print uniqueIsbn
  	