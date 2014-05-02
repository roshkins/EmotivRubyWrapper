EmotivRubyWrapper
=================

This is a wrapper for the Emotiv sdk. It's very basic at the moment.


The file you're looking for is "EmotivSDK.rb". Download it and put it in a directory. You don't need the other files.
You'll still need the shared library file from the sdk, named "libedk.so" and you need to make a folder relative to the ruby file named "ext" that contains the "libedk.so" file. 

You should end up with two files:

1. ./EmotivSDK.rb
2. ./ext/libedk.so

Now run the EmoComposer software.

now run "ruby ./EmotivSDK.rb" in the command line.

Press "Start" a few times in EmoComposer.

You should see a response in the command line. Play around with it, then check the source for the code.


Code
====

The code is very simple currently. You make a new instance of EmotivSDK::Engine by passing it a boolean, true if using EmoComposer, false if using a device directly. You also pass it a block accepting one parameter.

This block will run everytime there is a new event. It returns an event object. Return false from the block to properly quit the application.


API
===

It currently supports just the basics of the api. It does not currently allow the program to train automatically. It's possible to do this in the future, but I wanted to get the core features done for the hackathon.

`event.blinked?` `event.left_winked?` `event.right_winked?` `event.looked_left?` `event.looked_right?`

