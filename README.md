# SimpleSyncedTrapRobbery
Help This Broke Dev Out - https://www.buymeacoffee.com/yamieboi
 
 
This a simple robbery kind of script, It's synced with all the players.

Usage:-
1. Anyone can start the robbery by just pressing E (you can add some minigames if you want to)
2. A global notification is triggered, So everyone knows DUH!
3. 600 Sec Timer 
4. After the timer is over whoever presses E  takes the money
5. Recently Robbed Cooldown

*It Does Not Call The Cops Separately* 

Add More Spots:-

1. Head to shared.lua (in the script not the core -_-)
2. Paste This Under The 'SPOTS' Table (Make Sure Add a ',' on the last one tho -_-)

 

        
        { 
        ['name'] = 'Name It Something',
        
        ['use'] = 'Take Money [E]',
        
        ['coords'] = vector3(x,y,z), -- where do you want it?
        
        ['label'] = 'Name It Something' [E]',
        
        ['started'] = false, -- dont touch
        
        ['money'] = 10000, -- how much money huhhhhhh
       
        ['moneytaken'] = false,-- dont touch
        
        ['time'] = 600,-- dont touch
        
        ['recently_roobed'] = false,-- dont touch 
        }
        
  

Open source script so contribute if you want to :D
