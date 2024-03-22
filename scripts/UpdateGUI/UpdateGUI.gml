function UpdateGUI(_new_width, _new_height, _old_width, _old_height){
	var _prev_w = display_get_gui_width();
	var _prev_h =display_get_gui_height();
	global.gui_size_w =   _old_width / _new_width;
	global.gui_size_h =  _old_height / _new_height ;
	display_set_gui_size(_new_width, _new_height);
	global.display_height = _new_height;
	global.display_width = _new_width;

	return true;
}