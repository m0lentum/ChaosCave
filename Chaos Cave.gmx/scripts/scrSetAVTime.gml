time = argument0;

with(objAVcontroller)
{
    timer = other.time;
}

if (time > 1100) with (objBigRock) { image_xscale = 1; image_yscale = 1; }

audio_sound_set_track_position(global.currentMusic, time / 50.0);

with(objAttack)
{
    if (endTime <= other.time) instance_destroy();
    else if (startTime <= other.time)
    {
        running = true;
        counter = other.time - startTime;
    }
    else
    {
        running = false;
        counter = 0;
    }
}
