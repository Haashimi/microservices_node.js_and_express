const blogsDAO = require("./blogs.dao");

const saveBlog = function (blog, done) {
  blogsDAO.saveBlog(blog, (err, results) => {
    if (err) {
      // EXITING
      return done({ "STATUS": "DATA_ERROR", "error": "Encountered data error in saving blog..!" });
    }

    // EXITING with results
    return done(null, results);
  });
}

const findBlogs = function (done) {
  blogsDAO.findBlogs((err, results) => {
    if (err) {
      // EXITING
      return done({ "STATUS": "DATA_ERROR", "error": "Encountered data error in fetching blogs..!" });
    }

    // EXITING with results
    return done(null, results);
  });
}

module.exports = {
  saveBlog,
  findBlogs
}