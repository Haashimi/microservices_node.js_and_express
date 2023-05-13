## Practice Exercise :: WebInk (75 mins)

### Introduction

WebInk is an online blogging site that allows its users to publish blogs. The website allows its registered users to publish blogs on various subjects. The blogs by default are published with public access. However, there are premium users who can mark their blogs as private. The access to private blogs is available only to the other premium users or the users to whom the blog owner has provided the access.

The WebInk website provides access to its resources to the third party news apps, social media apps and online shopping apps.

Recently the statistics indicates growing popularity of this website among all section of users.
The backend development team has to handle the responsibility of monitoring the performance of WebInk APIs and database access. In case if any dip is found in the performance, the alternative techniques have to be explored and performance consistency should be maintained.

### Challenges Faced With Existing Solution

Recent user statistics indicate overall a huge growth in usage of WebInk website.

Not only the number of users have increased, the blogs posted have also increased manifolds. One of the reasons for this increased popularity is due to its integration with external applications. This feature has allowed user to add blogs on any news article, social media post or shopping site product viewed.

However, due to this increase growth, WebInk blogs have hit a huge scalability and performance issue lately.

The backend team has been asked to investigate the issues and analyze the existing system to find the root cause for handling the concern to maintain the popularity status.

### The Analysis

The backend development team has completed the investigation and have gathered the following findings:
1. The backend solution of WebInk is developed using 
  1. Node.js for building REST APIs
  2. MySQL database for storing data
2. REST APIs use JSON format for data interchange
3. MySQL databases is a relational database that stores data in tables.
4. The data is stored across multiple tables and hence join queries are written to fetch details
5. Being a SQL database, MySQL database does not provide flexibility in altering the data structures

### The Solution Suggested

- Based on analysis it can be concluded that:
  - The REST layer and database system have different data formats
  - The related data in database is distributed due to normalized design
  - The structure of data cannot be modified due to strict schema
- The solution therefore suggested is to migrate from MySQL database to MongoDB , which is a NoSQL Document Database
- MongoDB database helps to resolve the challenges faced since
  - It stores data in JSON format, similar to what the REST layer uses
  - It allows related information to be stored in a single document
  - MongoDB is flexible with regards to data structure as it is a schema less database

### Overcoming The Challenges

The backend development team require your help to ship all the data from the existing database to MongoDB. 

For a quick support they have shared some data in CSV File. 

You need to:
  1. Insert data from CSV files to MongoDB
    1. Create data model by referring to the data structures in CSV files
    2. Write Node.js scripts to insert data in MongoDB
      *Use appropriate libraries available in npm to read and convert data*
  2. Build REST API using Node.js and MongoDB to post and get blogs data along with user details.

You are required to test and validate if things working fine within the database. 

The validation can be done by executing the following suggested queries.

**Queries**
1. Get all the blogs created by user with id 17.
2. Update User ratings for user with id 10 to 5.
3. Remove all the documents created by user 80, since he has deleted his account.
4. Add a new column to all the documents for status as "ACTIVE" as default value for all.
5. Get all users with rating above and equal to 4.
6. Get all users with rating lesser to 4.
7. Update users with ratings more than 4 with tags as new field and value array of ["master", "created", "blogs"]
8. Find users have tags value "created" and "blogs"

**Requisites**

- For modeling data, the data should be analyzed to check for creating any impedance mismatch.
- Consider using embedded documents for minimizing impedance mismatch
- You may use `papaparse` library to read csv and convert to JSON. `npm i papaparse`.

```js
const papaparse = require("papaparse")
const fs = require("fs");
const file = fs.readFileSync(<pathfile>,"utf-8");

papaparse.parse(file, {
  header: true,
  complete: (results) => {
    console.log(results)
  }
});
```

### Instructions

1. Unzip the boilerplate file downloaded to extract the boilerplate code.
2. Install the necessary node packages for:
  1. Parsing CSV data into JSON format
  2. Installing MongoDB Node driver for connectivity.
2. The solution to load blogs and users data should be provided in `loadblogs.js` file
  1. Use MongoDB Node Driver for establishing connectivity
  2. Validate the user and blog data insertion using MongoDB shell commands
  3. The solutions to queries should be provided in `script.sh` file
3. Build REST API using Node.js to manage user and blog data with MongoDB
  1. The solution to send and retrieve data from database should be provided in `blogs.dao.js` file.
  2. Ensure the solution provides responses to following Blog APIs
    - GET api/v1/blogs :: to get all blogs details with respective user data
    - POST api/v1/blogs :: to post all blogs details with respective user data
  
4. Test the solution locally to checks the correctness and completeness for stated requirements. 
5. Refactor the solution to ensure all test cases are passing.  
6. DO NOT MODIFY THE PROVIDED CODE, ELSE THIS MAY IMPACT THE TEST CODE EXECUTION.
7. Zip the solution code by selecting all the files and folders **excluding the node_modules folder** and give the same name as assignment name to the zipped file.
8. Upload the zipped solution for submission.

#### Run Code

1. Run the command `node loadblogs.js` to test the code to insert blogs and users data in MongoDB
2. Run the command `node app.js` to execute the Node.js APIs
3. Use VSCode Extension Thunder Client or Postman or any other GUI tool to test the APIs.

#### Test Code

1. Test the solution locally by running the command `npm run test`. 

