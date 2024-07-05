//////////// Get Inputs ////////////
	get_controls();

//////////// X movement ////////////
	move_direction = right_key - left_key;
	
	if (move_direction != 0) {
		facing_direction = move_direction;
	}

	// Get xspeed
	x_speed = move_direction * move_speed;

	// X Collision
	if place_meeting(x + x_speed, y, obj_dummy_wall) {
		var _sub_pixel = .5;
		// Wall precision check
		var _pixel_check = _sub_pixel * sign(x_speed);
		while !place_meeting(x + _pixel_check, y, obj_dummy_wall) {
			x += _pixel_check;
		}

		// Set to zero if collided to a wall
		x_speed = 0;
	}

	x += x_speed;

//////////// Y movement ////////////
	// Gravity
	if (coyote_hang_timer > 0) {
		coyote_hang_timer --;
	} else {
		y_speed += weight;
		set_on_ground(false);
	}
	
	
	// Reset jump count
	if (is_on_ground) {
		jump_count = 0;
		jump_hold_timer = 0;
		coyote_jump_timer = coyote_jump_frames;
	} else {
		// If play is in the air, don't do double jump
		coyote_jump_timer --;
		if (jump_count == 0 && coyote_jump_timer <= 0) {
			jump_count = 1;
		}
	}
	
	// Jump
	if (is_jump_key_buffered && jump_count < max_jump_count) {
		// Reset Buffer
		is_jump_key_buffered = false;
		jump_key_buffer_timer = 0;
		
		// Increase jump counter for double jump
		jump_count ++;

		// Set jump hold timer
		jump_hold_timer = jump_hold_frames[jump_count - 1];
		set_on_ground(false);
	}
	
	// Cut off jump if key is released
	if (!jump_key) {
		jump_hold_timer = 0;
	}
	
	// Jump based on timer
	if (jump_hold_timer > 0) {
		y_speed = jump_speed[jump_count - 1];
		
		jump_hold_timer --;
	}
	
	// Falling Speed
	if (y_speed > terminal_velocity) {
		y_speed = terminal_velocity;
	}

	// Y collision
	if place_meeting(x, y + y_speed, obj_dummy_wall) {
		var _sub_pixel = .5;
		// Floor precision check
		var _pixel_check = _sub_pixel * sign(y_speed);
		while !place_meeting(x, y + _pixel_check, obj_dummy_wall) {
			y += _pixel_check;
		}
		
		// Set to zero if collided to a floor
		y_speed = 0;
	}
	
	// Check if on ground
	if (y_speed >= 0 && place_meeting(x, y+1, obj_dummy_wall)) {
		set_on_ground(true);
	}

	// Set y speed
	y += y_speed;
	
//////////// Sprite Control ////////////

	// Walking
	if (abs(x_speed) > 0) {
		sprite_index = walk_sprite
	}
	
	if x_speed == 0 {
		sprite_index = idle_sprite;
	}
	
	if (!is_on_ground) {
		sprite_index = jump_sprite;
	}
	
	mask_index = mask_sprite;