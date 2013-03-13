var http = require('http'),
    redis = require('redis'),
    redisClient = redis.createClient(),
    Db = require('mongodb').Db,
    MongoClient = require('mongodb').MongoClient,
    Server = require('mongodb').Server,
    mongoclient = new MongoClient(new Server("localhost", 27017, {native_parser: true})),
    mongoStatus,
    redisStatus;

mongoclient.open(function(err, mongoclient) {
    if (err){
        console.log('uh oh, mongodb error: ' + err.message);
    } else {
	mongoStatus = 'MongoDB is connected!';
	console.log(mongoStatus);
	
	//remove this block to stop test collection update
        var db = mongoclient.db("test_db");
        db.collection('test_collection').update({a:1}, {b:1}, {upsert:true}, function(err, result) {
            if (err) {
                throw err;
            } else {
                if (result === 1){
                    console.log('Update to test_collection in mongo test_db was successful.');
                } else {
                    console.log('Problem updating test mongo collection.');
                }
            }
            mongoclient.close();
        });
    }
});

redisClient.on('connect', function (err) {
    if (err) {
        throw err;
    } else {
	redisStatus = 'Redis is connected!';
        console.log(redisStatus);

	//remove this block to stop test redis update
	redisClient.set('testkey', 'hello world', function(err, result) {
	    if (err) {
		console.log('Error: '+ error);
	    } else {
		console.log('Setting testkey value in Redis was successful.');
	    }
	});
    }
});

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World!\n' + mongoStatus + '\n' + redisStatus);
}).listen(3000);

console.log('Server running on port 3000');
