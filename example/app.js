//create a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

var TiTokenField = require('com.dezinezync.tokenfield');
Ti.API.info("module is => " + TiTokenField);

var tokens = []; // We'll store the tokens in here for reference.

var tf = TiTokenField.createView({
	top:0,
	height: 40,
	width: Ti.UI.FILL
});

tf.addEventListener('add', function(e){
	tokens.push(e.token);
	console.log("Added token " + e.token + "\n Tokens: " + tokens);
});

tf.addEventListener('delete', function(e){
	// Loop through tokens, match the deleted token, then remove it
	for(i in tokens) {
		if(tokens[i] == e.token) {
			tokens.splice(i, 1);
		}
	}

	console.log("Deleted token " + e.token + "\n Tokens: " + tokens);
});

win.add(tf); //

win.open(); // open our window