var _num_of_boxes = array_length(_struct.linked_boxes);
temp_alpha = 1;
if (main_selected_flag){
	temp_alpha = blink_alpha;
} else {temp_alpha = 1}

if(!_struct.sleep){

if(!hide_main_box){
draw_sprite_stretched_ext(GetSprite(_struct.main_box.sprite_ID), 0, 
						  _struct.cluster_gui_x, _struct.cluster_gui_y, 
						  _struct.main_box.Width, _struct.main_box.Height, c_white, 1);
}

for(var iv = 0;iv < _num_of_boxes;iv++){
	var _cur_box = _struct.linked_boxes[iv];	
	temp_ID = _cur_box;
	temp_sprite = GetSprite(_cur_box.sprite_ID);
	temp_ID = _cur_box;
	temp_gui_x = _cur_box.drawing_x;
	temp_gui_y = _cur_box.drawing_y;
	temp_w = _cur_box.Width;
	temp_h = _cur_box.Height;
	for(var v = 0; v < array_length(_cur_box.custom_GUI_triggers); v++){
		var _check_method = GetMethod(_cur_box.custom_GUI_triggers[v].trigger );
		var _trigger_args = _cur_box.custom_GUI_triggers[v].trigger_arg;
		_trigger_args[0] = _cur_box;
		if(!_cur_box.sleep && method_call (_check_method, _trigger_args )){
			for(var vi = 0;vi < array_length(_cur_box.custom_GUI_triggers[v].action);vi++){
				var _action_method = GetMethod(_cur_box.custom_GUI_triggers[v].action[vi].Method)
				method_call(
					_action_method,
					_cur_box.custom_GUI_triggers[v].action[vi].arguments);
			}
		}
	}
}
}