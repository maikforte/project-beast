function set_on_ground(_val = true) {
	if (_val) {
		is_on_ground = true;
		coyote_hang_timer = coyote_hang_frames;
	} else {
		is_on_ground = false;
		coyote_hang_timer = 0;
	}
}

// Init functions
	controls_setup();
	
// Sprites
	mask_sprite = spr_dummy_maria_idle;
	idle_sprite = spr_dummy_maria_idle;
	walk_sprite = spr_dummy_maria_walk;
	run_sprite = spr_dummy_maria_run;
	jump_sprite = spr_dummy_maria_jump;

// Moving
	facing_direction = 1;
	move_direction = 0;
	move_speed = 5;
	x_speed = 0;
	y_speed = 0;

// Jumping
	weight = .5;
	terminal_velocity = 5;
	max_jump_count = 2;
	is_on_ground = true;

// Double Jump Setup
	jump_count = 0; 
	jump_hold_timer = 0;
	jump_speed[0] = -5; // 1st jump
	jump_speed[1] = -4.85; // 2nd jump
	jump_hold_frames[0] = 12;
	jump_hold_frames[1] = 5;

// Coyote Time
	coyote_hang_frames = 2;
	coyote_hang_timer = 0;
	coyote_jump_frames = 5;
	coyote_jump_timer = 0;

// Keypressed init
	right_key = false;
	left_key = false;
	is_jump_key_pressed = false;