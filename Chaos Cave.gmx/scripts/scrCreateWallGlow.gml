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
if (argument_count > 1) glow.lifetime = argument1;
