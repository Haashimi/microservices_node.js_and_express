const insertBlogsData = require('./loadblogs');


insertBlogsData().then(console.log).catch(console.error);