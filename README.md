# API documentation

## SUT (system or subject under test)
Json Server repository: https://github.com/typicode/json-server
Data Model:

```
{
    "posts": [
        { "id": 1, "title": "json-server", "author": "typicode" }
    ],
    "comments": [
        { "id": 1, "body": "some comment", "postId": 1 }
    ],
    "profiles": [{"id": 1, "name": "typicode" }]
}
```

## Main Use Cases
1. As a user, I want to create new user profile
    - Method: POST 
    - Url: http://localhost:3000/profiles
    - Body: 
        ```{"id": {id}, "name": "typicode" }```

2. As a user, I want to post new content
    - Method: POST 
    - Url: http://localhost:3000/posts
    - Body: 
        ```{"postId": {id}, "author": "author name" }```
3. As a user, I want to comment on post of someone else
   - Method: POST 
   - Url: http://localhost:3000/comments
   - Body: 
       ```{"postId": {id}, "body": "comment content" }```
4. As a user, I want to see my post by post id
   - Method: GET
   - Url: http://localhost:3000/posts/{ID}

5. As a user, I want to see the comments on my post by post id
   - Method: GET
   - Url: http://localhost:3000/comments?postId={postID}

6. As a manager, I want to be able to search profiles by name in order to validate if they exist
   - Method: GET
   - Url: http://localhost:3000/profiles?name={username}

7. As a user, I want to delete my profile
    - Method: DELETE 
    - Url: http://localhost:3000/profiles/{id}

8. As a user, I want to delete my post
    - Method: DELETE 
    - Url: http://localhost:3000/posts/{id}

9. As a user, I want to delete my comment
    - Method: DELETE 
    - Url: http://localhost:3000/comments/{id}

## Execution process
1. Install python 3.9 from https://www.python.org/downloads/
2. Install robotframework with command "pip install robotframework"
3. Install robotframework resquests library for API calls with command "pip install robotframework-requests"
4. Install Node.js from https://nodejs.org/en/download/
5. Install json-server globally with command "npm install -g json-server"
6. In the project directory run " json-server db.json" to run json server
7. open a new terminal and execute robot framework suite with command "robot api_tests.robot"
8. Finally test results can be referred in terminal output and log.html after execution is finished

![img.png](img.png)
