const express = require('express');
const router = express.Router();
const blogsCtrl = require("./blogs.controller");

/**
 * API to save blog details
 * EFFECTIVE URL: POST /api/v1/blogs
 */
router.post("/", (req, res) => {
  try {
    let blog = {
      blogTitle: req.body.blogTitle,
      description: req.body.description,
      user: {
        userId: req.body.userId,
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        gender: req.body.gender,
        domain: req.body.domain,
        about: req.body.about,
        userRatings: req.body.userRatings,
        email: req.body.email,
      }
    }

    blogsCtrl.saveBlog(blog, (err, results) => {
      if (err) {
        // EXITING
        return res.status(400).send(err);
      }

      // EXITING
      return res.status(200).send({ STATUS: "OK", data: results });
    });

  } catch (error) {
    console.log("Unexpected error in saving blog..!", error);

    // EXITING
    return res.status(400).send({ STATUS: "UNEXPECTED_ERROR", error: "Unexpected error in saving blog, please try later..!" });
  }
});

/**
 * API to get all blogs
 * EFFECTIVE URL: GET /api/v1/blogs/
 */
router.get('/', (req, res) => {
  try {
    blogsCtrl.findBlogs((err, results) => {
      if (err) {
        // EXITING
        return res.status(400).send(err);
      }

      // EXITING
      return res.status(200).send({ STATUS: "OK", data: results });
    });
  } catch (error) {
    console.log("Unexpected error in fetching blogs..!", error);

    // EXITING
    return res.status(400).send({ STATUS: "UNEXPECTED_ERROR", error: "Unexpected error in fetching blogs, please try later..!" });
  }
});


module.exports = router;