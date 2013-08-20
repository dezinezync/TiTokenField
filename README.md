TiTokenField
============

Titanium Module for NSTokens like interface leveraging JSTokenField viz. Email.app and Messages.app
  
  
![screenshot](screenshot.png)

INSTALL THE MODULE
--------------------

1. Run `build.py` which creates your distribution
2. cd to `/Library/Application Support/Titanium`
3. copy this zip file into the folder of your Titanium SDK

REGISTER THE MODULE
---------------------

Register your module with your application by editing `tiapp.xml` and adding your module.
Example:

<modules>
	<module version="0.1">com.dezinezync.tokenfield</module>
</modules>

When you run your project, the compiler will know automatically compile in your module
dependencies and copy appropriate image assets into the application.

USING THE MODULE IN CODE
-------------------------
Include the module in your app, preferrably in the app.js file so you can access it from anywhere in your app.

~~~~
var TiTokenField = require('com.dezinezync.tokenfield');
~~~~

Create an instance of TiTokenField and add it to the current window or a view like so

~~~~
var myWin = Ti.UI.createWindow({…});
var myView = Ti.UI.createView({…});

var tf = TiTokenField.createView({
	top:0,
	height: 40,
	width: Ti.UI.FILL
});

myWin.add(tf);
//or
myView.add(tf); myWin.add(myView);
~~~~

### Parameters  
TiTokenField accepts the following parameters  

~~~~
top:  //int
left:  //int
right:  //int
bottom: //int

width: //int or Ti defined constants. Default: Full width of the parent
height: //int or Ti defined constants. Default: 30 points

label: //string ("To: " in the above screenshot). Default: empty string

backgroundColor: //string. Default: grey

color: //string (color for the InputField's text). Default: Black
~~~~

###ToDo
- Allow for setting of the Font for the input field from the Ti app
- Allow for setting of the color and Font for the individual tokens

###License
Please refer to the LICENSE file included in the repo for details.

### Feel free to Contribute
Fork it, upgrade or improve it, send a PR this repo's way! It loves you, too!