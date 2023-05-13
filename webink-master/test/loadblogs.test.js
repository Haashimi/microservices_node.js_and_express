const chai = require('chai');
const expect = chai.expect; 
var insertBlogsData = require('../loadblogs');

describe('Load Blogs ', () => {
    
    it('should contain insertBlogsData() function to insert blogs with users data', function () {
        expect(typeof(insertBlogsData)).to.be.equal("function");
    });
});