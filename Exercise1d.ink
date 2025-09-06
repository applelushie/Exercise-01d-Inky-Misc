/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR time = -1 //  0 Morning, 1 Noon, 2 Night
VAR hydration = 100 //  100 full, 60, thirsty, 20 close to death

-> seashore

== seashore ==
You are standing on the beach. 

It is { advance_time() }

You feel { advance_hydration() }

+ [Kick the beach ball] -> beach_ball
+ [Stroll down the beach] -> beach2
-> DONE

== beach2 ==
This is further down the beach. {not sand_castle: Someone left their sand castle building utensils | You see a little crab inside of your sand castle}

It is { advance_time() }

You feel { advance_hydration() }

* [Build a sand castle] -> sand_castle
* { time == 1} [Pick up some seashells] -> shells
* { hydration == 60} [Drink a handful of water] -> drink
* { hydration == 50} [Drink a handful of water] -> drink
* { hydration == 40} [Drink a handful of water] -> drink
* { hydration == 30} [Drink a handful of water] -> drink
* { hydration == 20} [Drink a handful of water] -> drink
* { hydration == 10} [Drink a handful of water] -> drink
+ [Stroll back up the beach] -> seashore

== shells ==
You pick up the shells
-> beach2

== drink ==
~ hydration = hydration + 60
You drank some water feeling { advance_hydration() } after.
-> beach2

== sand_castle ==
You build a sand castle that a crab could call home.
-> beach2

== beach_ball ==
You kick the ball farther down the shore.
~ hydration = hydration -10
-> seashore


== function advance_time ==
    ~ time = time + 1
    {
        - time > 2:
            ~ time = 0
    }    
    {    
        - time == 0:
            ~ return "Morning"
        - time == 1:
            ~ return "Noon"
        - time == 2:
            ~ return "Night"
    }
    ~ return time

== function advance_hydration ==
    ~ hydration = hydration -10
    {
        - hydration > 100:
            ~ hydration = 100
    }
    {
        - hydration < 0:
            ~ hydration = 10
    }
    {
        - hydration == 100:
            ~ return "Hydrated"
        - hydration == 90:
            ~ return "Hydrated"
        - hydration == 80:
            ~ return "Hydrated"
        - hydration == 70:
            ~ return "Hydrated"
        - hydration == 60:
            ~ return "Thirsty"
        - hydration == 50:
            ~ return "Thirsty"
        - hydration == 40:
            ~ return "Thirsty"
        - hydration == 30:
            ~ return "Thirsty"
        - hydration == 20:
            ~ return "Dehydrated"
        - hydration == 10:
            ~ return "Dehydrated"
        - hydration == 0:
            ~ return "You feel yourself fainting from dehydration."
    }
    ~ return hydration
