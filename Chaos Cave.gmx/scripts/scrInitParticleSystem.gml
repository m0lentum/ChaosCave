//create particle system for displaying sparks
global.particleSystem = part_system_create();
global.pSpark = part_type_create();
part_type_speed(global.pSpark, 0, 1, 0, 0.5);
part_type_direction(global.pSpark, 0, 359, 0, 3);
part_type_blend(global.pSpark, true);
part_type_alpha2(global.pSpark, 0.5, 0.1);
part_type_life(global.pSpark, 10, 15);

