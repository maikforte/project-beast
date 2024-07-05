// Init functions
controls_setup();

// Moving
move_direction = 0;
move_speed = 5;
x_speed = 0;
y_speed = 0;

// Jumping
weight = .275;
terminal_velocity = 4;
jump_speed = -3.15;
max_jump_count = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames = 18;
is_on_ground = true;

// Keypressed init
right_key = false;
left_key = false;
is_jump_key_pressed = false;