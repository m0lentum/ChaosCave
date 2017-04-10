#define scrCreateWallGlow
var iy = argument0 mod 84;
while (iy < 0) iy += 84;
var ix = 0;
var rotation = 0;
var isCorner = (iy == 0 || iy == 18 || iy == 42 || iy == 60);
//wrap around the edges to determine where we actually are
if (iy >= 18)
{
    ix += iy - 18;
    iy = 18;
    rotation = 90;
    if (ix >= 24)
    {
        iy -= ix - 24;
        ix = 24;
        rotation = 180;
        if (iy <= 0)
        {
            ix += iy;
            iy = 0;
            rotation = 270;
        }
    }
}

var glow = instance_create(ix*32 + 16, iy*32 + 16, objBlockGlow);
glow.image_angle = rotation;
if (isCorner) glow.image_index = 1;

return glow;

#define scrWallGlowAt
var ix = argument0;
var iy = argument1;
var index;

if (ix == 0) index = iy;
else if (iy == 18) index = 18 + ix;
else if (ix == 24) index = 60 - iy;
else if (iy == 0) index = 84 - ix;
else
{
    show_debug_message("Tried to create glow somewhere not in a wall: "+string(ix)+", "+string(iy));
    exit;
}

return scrCreateWallGlow(index);