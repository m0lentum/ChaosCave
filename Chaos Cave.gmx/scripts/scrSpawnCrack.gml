var posX = argument0;
var posY = argument1;
var dir = argument2;
var numForks = argument3;

var obj = instance_create(posX, posY, objCrack);
obj.image_angle = dir;

var nextX = posX + (dcos(dir) * obj.sprite_width);
var nextY = posY - (dsin(dir) * obj.sprite_width);

dir += random_range(-35, 35);

if (nextX > 0 && nextX < room_width && nextY > 0 && nextY < room_height)
{
    var r = irandom(2);
    if (numForks < 2 && r == 0)
    {
        numForks++;
        scrSpawnCrack(nextX, nextY, 
            dir + choose(random_range(-45, -20), random_range(20, 45)), numForks);
    }
    scrSpawnCrack(nextX, nextY, dir, numForks);
}
