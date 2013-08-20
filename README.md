TiTokenField
============

Titanium Module for NSTokens like interface leveraging JSTokenField viz. Email.app and Messages.app

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
An example on using this module is included in the example folder.