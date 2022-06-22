# API Automation using Karate Framework
## Table of Contents
  - Project
  - Why Karate
  - Setup
  - Assumptions
  - Framework Design
  - Test Features
  - Enhancements

### Project
  - Creation of API Test automation framework to automate the regression test cases for Ice and Fire API.
  
### Why Karate is used
   - It is Open source
   - BDD based testing framework
   - Perform Multi thread parallel execution
   - Perform API and UI Automation in single framework
   - Validate Performance of the API and UI

### Setup
  - Install Java using the [link](https://phoenixnap.com/kb/install-java-windows) and set the environment variables.
  - Download Eclipse 64 bit and place it in a new folder in the local drive.
  - Create a new Maven project in eclipse and add the below dependencies in the pom.xml file.
  ```
   <dependency>
      <groupId>com.intuit.karate</groupId>
      <artifactId>karate-apache</artifactId>
      <version>0.9.4</version>
      <scope>test</scope>       
   </dependency>
   <dependency>
      <groupId>com.intuit.karate</groupId>
      <artifactId>karate-junit4</artifactId>
      <version>0.9.4</version>
      <scope>test</scope>
   </dependency>
   <dependency>
       <groupId>net.masterthought</groupId>
       <artifactId>cucumber-reporting</artifactId>
       <version>3.8.0</version>
       <scope>test</scope>
  </dependency>

  ```
  - The above dependencies are added to get the features of Karate , JUnit and Cucumber report.
  - Use the dependencies that are stable and can be widely accepted in any platform.
  
 ### Assumptions
  - The project is automated in the assumption that only GET method call can be made for the test cases of the Ice and Fire API.
  - The project is automated in the assumption that only the regression test scenarios are automated.
  - This projected is automated in the assumption that the user should have basic understanding of API testing and BDD testing approach.

### Framework Design
  - This framework is designed with one java class and many features. 
  - Create a package in the Maven project with the following 
    - Create TestRunner.java class within the pacakge which consist of scripts to execute the features parallely and to generate the cucumber report.
    - Create features within the package which consist of
      - Features: Briefs about the test being peformed.
      - Background: Scripts within background in executed before each scenario.
      - Scenario outline(optional): For Data Driven testing , uses examples where scenario is executed for each example data.
      - Scenario: Test cases with test steps.
     ```mermaid
     graph TD;
       com.api.automation.getRequest-->TestRunner.java;
       com.api.automation.getRequest-->datatypeMatch.feature;
       com.api.automation.getRequest-->getRequest.feature;
       com.api.automation.getRequest-->validateIsbnuniqueness.feature;
       com.api.automation.getRequest-->validateResponse.feature;
     ```
   - The output can be viewed in the form of cucumber reports.
   - Refresh the project to view the reports that is available within the project (project -> target -> cucumber-html-reports -> Overview-features.html) after each execution. 
     
### Test Features
  - **Feature 1 - getRequest.feature**
    - To validate if the Books API response is successfull with status code 200.
    - To validate if the Characters API response is successfull with status code 200.
    - To validate if the Houses API response is successfull with status code 200.
    - To validate if the Books API response is successfull with status code 200 when path and query parameters are passed in the API.
    - To validate if the Characters API response is successfull with status code 200 when path and query parameters are passed in the API.
    - To validate if the Houses API response is successfull with status code 200 when path and query parameters are passed in the API.
    - Negative Test - To validate if the API response gives 'Data not found' error with status code 404 when invalid data is provided in the API.
  - **Feature 2 - datatypeMatch.feature**
    - To validate if the Book API response datatype is as per the requirement.
    - To validate if the Character API response datatype is as per the requirement.
    - To validate if the Houses API response datatype is as per the requirement.
  - **Feature 3 - validateResponse.feature**
    - To validate if a character from a book has that book in its response.
    - To validate if a PovCharacter from a book has that book in its response.
    - To validate if the allegiances from a character has that character in its response.
    - To validate if the API reponse is successfull with status code 200 when the 'version=1' in the header 'Accept'.
    - Negative Test - To validate if the API reponse returns 'Bad Request' with status code 400 when the 'version!=1' in the header 'Accept'.
    - To validate the response structure by comparing it with the Json file.
  - **Feature 4 - validateIsbnuniqueness.feature**
    - To validate if the Isbn values in the Books API have unique values.
    - Pagination is performed to get all the data available in all pages of the API.

### Enhancements
  - The frameowk can be extended to perform validations for all the methods such as POST , PUT , PATCH , DELETE.
  - This framework can be extended to validate the performance of the API.
  - This framework can be extended to perform E2E testing that leverages UI and API in a single framework.
  
