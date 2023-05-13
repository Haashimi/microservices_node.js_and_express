const express = require('express');
const app = express();
const blogRouter = require("./blogs");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Mount point for the apis starting with /users
app.use("/api/v1/blogs", blogRouter);

app.listen(3000, () => {
  console.log(`App listening on port 3000`);
});

// catch 404 and forward to error handler
app.use((req, res) => {
  console.error(`Requested resource ${req.method} ${req.url} not found..!`);
  res.status(404).send("Resource not found..!");
});
