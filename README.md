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

Example in the ./EmotivSDK.rb file.


API
===

It currently supports just the basics of the api. It does not currently allow the program to train automatically, as well as many other omitted features. It's possible to do this in the future, but I wanted to get the core features done for the hackathon.

`event.blinked?` `event.left_winked?` `event.right_winked?` `event.looked_left?` `event.looked_right?`

These are all part of the Expressiv suite and return true if the action happened during this event and false if it didn't happen.

The possible face actions are:
    `:EXP_NEUTRAL,`    
    `:EXP_BLINK,`      
    `:EXP_WINK_LEFT,`  
    `:EXP_WINK_RIGHT, `
    `:EXP_HORIEYE,`
    `:EXP_EYEBROW, `   
    `:EXP_FURROW,   `  
    `:EXP_SMILE,  `
    `:EXP_CLENCH, `
    `:EXP_LAUGH,     ` 
    `:EXP_SMIRK_LEFT, `
    `:EXP_SMIRK_RIGHT`

`event.upper_face_action`
This returns either nil or a symbol representing one of the possible upper face actions (part of the face actions listed above). 

`event.lower_face_action`
This returns either nil or a symbol representing one of the possible lower face actions (part of the face actions listed above). 

`event.upper_face_action_power`
This returns the power level of the upper face action.

`event.lower_face_action_power`
This returns the power level of the lower face action.

`event.excitement_short_term_score`
This returns the excitement short term score.

`event.excitement_long_term_score`
This returns the excitement long term score.

`event.engagement_boredom_score`
This returns the boredom score.

Cognitiv Actions:
`:COG_NEUTRAL,`   
`:COG_PUSH,`      
`:COG_PULL,`      
`:COG_LIFT,`         
`:COG_DROP	,`       
`:COG_LEFT, `       
`:COG_RIGHT,`       
`:COG_ROTATE_LEFT,`
`:COG_ROTATE_RIGHT,` 
`:COG_ROTATE_CLOCKWISE,` 
`:COG_ROTATE_COUNTER_CLOCKWISE,`
`:COG_ROTATE_FORWARDS,`  
`:COG_ROTATE_REVERSE,`   
`:COG_DISAPPEAR,`    

`event.cognitiv_action`
This returns one of the above Cognitiv actions.

`event.cognitiv_action_power`
This returns the power level of the cognitiv action.


EmotivNative
============
This has all the C bindings in it. You may use them by calling individual functions from the module. They have the same name as their correspondence from the C headers.

#Warning, you will have to do your own garbage collection for some of the functions. 
