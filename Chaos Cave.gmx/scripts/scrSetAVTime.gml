time = argument0;

if(!instance_exists(objAVcontroller)) exit;

global.avTimer = time;

if (time > 1100 && time <= 5900) with (objBigRock) { image_xscale = 2; image_yscale = 2; }

audio_sound_set_track_position(global.currentMusic, time / 50.0);

with(objAttack)
{
    if (endTime <= other.time) instance_destroy();
    else if (startTime <= other.time)
    {
        running = true;
    }
    else
    {
        running = false;
        counter = 0;
    }
}
