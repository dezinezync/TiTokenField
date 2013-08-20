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
	width: Ti.UI.FILL,
	label: "To: ",
	backgroundColor: "#e0e0e0"
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

win.addEventListener("open", function() {

	//Blur and focus events
	/*setTimeout(function() {
		tf.focus();
	},2000);

	setTimeout(function() {
		tf.blur();
	}, 5000);*/
	
	//Adding & Removing a token programatically
	tf.addToken("tag1");
	tf.addToken("tag2");
	tf.addToken("tag3");
	tf.addToken("tag4");

	setTimeout(function() {
		tf.removeToken("tag2");
	},2500);

	setTimeout(function() {
		tf.removeAllTokens();
	}, 5000);

});

win.open(); // open our window