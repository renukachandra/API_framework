*** Settings ***
Library          RequestsLibrary
Library     Collections

*** Variables ***
${profiles_URL}    http://localhost:3000/profiles
${posts_URL}    http://localhost:3000/posts
${comments_URL}    http://localhost:3000/comments

*** Test Cases ***
GET profiles URL should be working fine
    ${response}=    GET  ${profiles_URL}

POST User should be able to create new profile
    ${number}=  generate random number
    set suite variable  ${number}
    &{data}=    Create dictionary  id=${number}  name=test name
    ${response}=    POST  ${profiles_URL}  json=${data}  expected_status=201

POST User should not be able to create profile with duplicate ID
    &{data}=    Create dictionary  id=${number}  name=test name
    ${response}=    POST  ${profiles_URL}  json=${data}  expected_status=anything
    Should Be Equal As Strings  Internal Server Error  ${response.reason}

GET User should be able to search profile by name
    ${name}=  set variable  test name
    ${response}=    GET  ${profiles_URL}  params=name=${name}  expected_status=200

GET User should get an error if searching profile by an id that does not exist
    ${response}=    GET  ${profiles_URL}/344  expected_status=404

DELETE User should be able to delete a profile by id
    ${response}=    DELETE  ${profiles_URL}/${number}  expected_status=200

DELETE User should get error if trying to delete a profile by non-existent id
    ${response}=    DELETE  ${profiles_URL}/${number}  expected_status=404

GET posts URL should be working fine
    ${response}=    GET  ${posts_URL}

POST User should be able to add a new post
    &{data}=    Create dictionary  title=my first post  author=test user
    ${response}=    POST  ${posts_URL}  json=${data}  expected_status=201

GET User should be able to see post by id
    ${response}=    GET  ${posts_URL}/2  expected_status=200

GET User should get an error if searching post by an id that does not exist
    ${response}=    GET  ${posts_URL}/344  expected_status=404

DELETE User should be able to delete post by id
    ${response}=    DELETE  ${posts_URL}/2  expected_status=200

DELETE User should get error if trying to delete post by non-existent id
    ${response}=    DELETE  ${posts_URL}/2  expected_status=404

GET comments URL should be working fine
    ${response}=    GET  ${comments_URL}

POST User should be able to post a new comment
    ${number}=  generate random number
    set suite variable  ${number}
    &{data}=    Create dictionary  postId=${number}  body=Test comment
    ${response}=    POST  ${comments_URL}  json=${data}  expected_status=201

GET User should be able to get the comments on post by post id
    ${response}=    GET  ${comments_URL}  params=postId=${number}  expected_status=200

GET User should be able to see comment by id
    ${response}=    GET  ${comments_URL}/2  expected_status=200

GET User should get an error if searching comment by an id that does not exist
    ${response}=    GET  ${comments_URL}/344  expected_status=404

DELETE User should be able to delete a comment by id
    ${response}=    DELETE  ${comments_URL}/2  expected_status=200

DELETE User should get error if trying to delete a comment by non-existent id
    ${response}=    DELETE  ${comments_URL}/2  expected_status=404

*** Keywords ***
generate random number
    ${random} =	Evaluate	random.randint(0, 100)
    [Return]  ${random}