if(follow_mode){
	target_x = follow_inst.x - (camera_get_view_width(current_camera) /2)+ (follow_inst.sprite_width/2);
	target_y = follow_inst.y - (camera_get_view_height(current_camera) /2) + (follow_inst.sprite_height/2);

	x = target_x;
	y = target_y;

	
	camera_set_view_pos(current_camera, x, y);
}
