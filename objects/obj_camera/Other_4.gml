if (!instance_exists(obj_dummy_char)) {
	exit;
}

// Get camera size
var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);

// Get camera target coordinates
var _cam_x = obj_dummy_char.x - _cam_width/2;
var _cam_y = obj_dummy_char.y - _cam_height/2;

// Constraint cam to room size
_cam_x = clamp(_cam_x, 0, room_width - _cam_width);
_cam_y = clamp(_cam_y, 0, room_height - _cam_height);

// Set camera Coordinates at start
final_cam_x = _cam_x;
final_cam_y = _cam_y;