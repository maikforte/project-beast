function controls_setup() {
	buffer_time = 3;
	
	is_jump_key_buffered = false;
	jump_key_buffer_timer = 0;
}

function get_controls() {
	// Directional
	right_key = keyboard_check(vk_right) + gamepad_button_check(0, gp_padr);
	right_key = clamp(right_key, 0, 1);
	
	left_key = keyboard_check(vk_left) + gamepad_button_check(0, gp_padl);
	left_key = clamp(left_key, 0, 1);
	
	// Jump Inputs
	jump_key_pressed = gamepad_button_check_pressed(0, gp_face1) + keyboard_check_pressed(vk_space);
	jump_key_pressed = clamp(jump_key_pressed, 0, 1);
	
	jump_key = keyboard_check(vk_space) + gamepad_button_check(0, gp_face1);
	jump_key = clamp(jump_key, 0, 1);
	
	// Jump Buffering
	if (jump_key_pressed) {
		jump_key_buffer_timer = buffer_time;
	}
	
	if (jump_key_buffer_timer > 0) {
		is_jump_key_buffered = true;
		jump_key_buffer_timer --;
	} else {
		is_jump_key_buffered = false;
	}
}