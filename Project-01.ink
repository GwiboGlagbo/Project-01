/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR health = 100
VAR loc_name = ""

-> start_adv

==start_adv ==
You are an archaeologist in the heart of the Burbian Rainforest. Your mission is to discover the priceless Amnolian Artifact. The Amnolians were an ancient race of humans that were supposedly more technologiclaly advanced than we are now. The artifact could reveal unknown information regarding this civilization. Where to, adventurer? North or West?  {not machete_pickup:There is a rusted machete lodged into a nearby tree and you have {health} health}
*[WALK NORTH] -> north_a
+[WALK WEST] -> west_a
*[PICK UP THE MACHETE] ->machete_pickup

===machete_pickup===
Your hand grips the frayed handle and you pull the machete from the tree.
*[GO BACK] -> start_adv

==north_a==
The vegetation is way too thick over here. You cannot come through without removing some of it.
*{machete_pickup} [CUT DOWN PLANTS] -> north_b
*[GO BACK] -> start_adv
->END

==west_a==
Ah, the west. What a place to be! You walk until you come across a rocky overhang with a pool of water below it. The overhang reminds you of a vacation you've been on. You cannot remember for the life of you where it was. Where was it?
* [DEATH VALLEY]
~ loc_name = "Death Valley" 
-> west_b
* [THE GRAND CANYON]
~ loc_name = "The Grand Canyon"
-> west_b
* [MIAMI]
~ loc_name = "Miami"
-> west_special
->END

==west_b==
Ah! {loc_name}, that's right. What a vacation that one was. As you are taking in the view, you hear a piercing scream and look down at the bottom to see a cloaked figure trying to fend off a mountain lion. The only way down is by attempting to jump into the water and hoping that it isn't shallow enough to break your legs.
*[REFLECT AND MUSTER UP THE COURAGE]
-> death_1
*[JUMP!]
->savior_u
-> END

==north_b==
Your machete slices through the plants with ease and you have fun slicing them too. You continue cutting through plants until you come across an especially thick branch.
*[CUT THROUGH IT]-> machete_loop
+[BACK OFF] -> start_adv
-> END

==west_special==
Miami? No, thats not right. Nice try though!
You suddenly have a heart attack and convulse helplessly on the ground.
-> health_amt
-> END

==death_1==
You take a step back and sit down and think of saving this person. Is it really worth it? What if it's the president of Burbia and he will endorse you with millions of  their local currency? Or if he lets you marry his daughter? What if it's not even a person and it's a speaker under the cloak and the mountain lion is just trying to lure you down? OR What if... and before you could think of more possibilities you hear a roar from behind you and a different mountain lion pounces on you and bites into your neck killing you instantly. -> health_amt

==health_amt==
~health = health- 100
 You have {health} health left. GAME OVER
-> END

==savior_u==
You jump from the overhang and aim for the water. 
close
close
closer
UH OH
(LOUD CRACK NOISE)
your legs are shattered upon impact and you land within 5 feet to the cloaked figure the loud noise sends the mountain lion scampering off. ->health_amt2 
->END

==health_amt2==
~health = health- 90
You have {health} health left.
->tech_bomb
->END

==tech_bomb==
The cloaked figure turns to look at you and you look in horror to find a metal face behind the cloak. The machine's hydraulics hiss as it steps towards you and pulls something from behind the cloak. A silver, blue metallic ball flashes in it's hand as it throws the object at you. The object bounces off of your chest and then begins to spin on the rocky floor in front of you. The machine's hydraulics hiss as it begins to walk the other way. You scream at it as the object continues to spin in front of you. The object is flashing brighter and brighter and spins faster and faster with every rotation. The object moves so fast that it looks completely still and next thing you know your skin is liquified and you perish. ->health_amt
->END

==machete_loop==
You wind your arm back to begin bludgeoning the vine. Hit After Hit After Hit 
You can feel the branch weakening. 
Just a little more!
->machete_loop2
->END

==machete_loop2==
Hit After Hit After Hit After Hit
Just a little more!
+[KEEP HITTING THE BRANCH] ->machete_loop3
->END
==machete_loop3==
Hit After Hit After Hit After Hit
Just a little more!
+[KEEP HITTING THE BRANCH] ->machete_loop2
