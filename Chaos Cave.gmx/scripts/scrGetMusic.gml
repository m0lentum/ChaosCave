///gets which song is supposed to be playing for the current room and plays it

var roomSong;

switch (room)                       //determines which song to play
{                                 //make sure to always put a break after setting the song
    default:                        //default option in case the room does not have a song set
        roomSong = -1;
        break;
}

if (room == rMenu || room == rOptions || room == rLevelSelect || room == r1_01 || room == r1_02 
    || room == r1_03 || room == r1_04 || room == r1_05 || room == r1_06 || room == r1_07)
    roomSong = musTyphonSystem;
else if (room == rf_01 || room == rf_02 || room == rf_03 || room == rf_04
    || room == rf_05 || room == rf_06 || room == rf_07)
    roomSong = musBossMode;

    
if (roomSong != -2)
    scrPlayMusic(roomSong,true); //play the song for the current room
