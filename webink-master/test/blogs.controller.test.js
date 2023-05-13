const sinon = require('sinon');
const blogsController = require('../blogs/blogs.controller');
const blogsService = require('../blogs/blogs.service');

describe('Test CRUD operations with blogs controller', () => {
    it('should save blogs and return saved blog object', (done) => {
        const saveBlog = sinon.stub(blogsService, 'saveBlog');
        let blog = {
            blogTitle: 'Test Blog',
            description: 'Test Blog Description',
            user: {
                userId: 'james-m',
                firstName: 'james',
                lastName: 'mathews',
                gender: 'male',
                domain: 'art of living',
                about: 'coach guide mentor',
                userRatings: 5,
                email: 'jammie@gmail.com',
            }
        };

        const doneCallback = (err, results) => results;

        const successCallback = (err, blog) => doneCallback(null, blog);
        saveBlog.withArgs(successCallback).returns(doneCallback(null, blog));
        blogsController.saveBlog(blog, doneCallback);

        saveBlog.restore();

        sinon.assert.calledOnceWithMatch(saveBlog, blog, (err, savedProduct) => { 
            sinon.assert.match(saveBlog(successCallback), blog);
            done(); 
        }); 
    });

    it('should return all blogs', (done) => {
        let blogs = [{
            blogTitle: 'Test Blog',
            description: 'Test Blog Description',
            user: {
                userId: 'james-m',
                firstName: 'james',
                lastName: 'mathews',
                gender: 'male',
                domain: 'art of living',
                about: 'coach guide mentor',
                userRatings: 5,
                email: 'jammie@gmail.com',
            }
        }];
        var findBlogs = sinon.stub(blogsService, 'findBlogs');
        const doneCallback = (err, results) => results;

        const successCallback = (err, blog) => doneCallback(null, blog);
        findBlogs.withArgs(successCallback).returns(doneCallback(null, blogs));
        blogsController.findBlogs((err, results) => { });

        findBlogs.restore();

        sinon.assert.calledOnceWithMatch(findBlogs, (err, savedProduct) => { 
            sinon.assert.match(findBlogs(successCallback), blogs);
            done(); 
        }); 
    });

    // it('should return blogs given the blogs id', (done) => {
    //     var findById = sinon.stub(blogsService, 'findById');
    //     blogsController.findOne((err, results) => { });
    //     sinon.assert.calledOnce(findById);
    //     done();
    // });

    // it('should update blogs given the blogs id', (done) => {
    //     var updateById = sinon.stub(blogsService, 'updateById');
    //     let upblogs = {
    //         "blogs_id": 1,
    //         "blogs_title": "Agile Meeting updated",
    //         "blogs_content": "Get documents ready for meeting",
    //         "blogs_status":"Yet to start",
    //         "blogs_creation_date": "2022-03-12",
    //         "category_id":1,
    //         "reminder_id":2
    //     };
    //     blogsController.update(upblogs.blogs_id,upblogs,(err, results) => { });
    //     sinon.assert.calledOnceWithMatch(updateById, upblogs.blogs_id,upblogs);
    //     done();
    // });

    // it('should delete blogs given the blogs id', (done) => {
    //     const blogs_id=1;
    //     var remove = sinon.stub(blogsService, 'remove');
    //     blogsController.delete(blogs_id,(err, results) => { });
    //     sinon.assert.calledOnceWithMatch(remove,blogs_id);
    //     done();
    // });

    // it('should delete all categories', (done) => {
    //     var removeAll = sinon.stub(blogsService, 'removeAll');
    //     blogsController.deleteAll((err, results) => { });
    //     sinon.assert.calledOnce(removeAll);
    //     done();
    // });
})

