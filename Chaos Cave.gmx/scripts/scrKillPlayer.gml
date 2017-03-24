//kills the player

if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    if (objPlayer.iframes <= 0) 
    {
        hp--;
        global.deathSound = audio_play_sound(sndDeath,0,false);
        if (hp < 1)
        {
            if (global.gameStarted) //normal death
            {
                if (!global.muteMusic)  //play death music
                {
                    if (global.deathMusicMode == 1) //instantly pause the current music
                    {
                        audio_pause_sound(global.currentMusic);
                        
                        global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
                    }
                    else if (global.deathMusicMode == 2)    //fade out the current music
                    {                
                        with (objWorld)
                            event_user(0);  //fades out and stops the current music
                        
                        global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
                    }
                }
                
                with (objPlayer)
                {
                    instance_create(x,y,objBloodEmitter);
                    instance_destroy();
                }
                
                instance_create(0,0,objGameOver);
                
                global.death += 1; //increment deaths
                    
                scrSaveGame(false); //save death/time
            }
            else    //death in the difficulty select room, restart the room
            {
                with(objPlayer)
                    instance_destroy();
                    
                room_restart();
            }
        }
        else
        {
            //show heart graphic and start I frames
            with (objPlayer)
            {
                var spawnX = x - (maxhp div 2)*9;
                if (maxhp mod 2 == 0) spawnX += 4;
                for (var i = 0; i < maxhp; i++)
                {
                    var heart = instance_create(spawnX + i*9, y - 30, objHeart);
                    if (i >= hp) heart.image_index = 1;
                }
                
                iframes = 50;
            }
        }
    }
}
