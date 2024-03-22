if(!_struct.sleep){


/*for(var iv = 0;iv < _num_of_boxes;iv++){
	var _cur_box = _struct.linked_boxes[iv];
	temp_sprite = GetSprite(_cur_box.sprite_ID);
	temp_ID = _cur_box;
	temp_gui_x = _cur_box.drawing_x;
	temp_gui_y = _cur_box.drawing_y;
	temp_w = _cur_box.Width;
	temp_h = _cur_box.Height;
	//temp_disp_x = 0;
	//temp_disp_y = 0;
	
	if(ArrayFindValue(selected_boxes, iv) && !main_selected_flag){
		temp_alpha = blink_alpha;
	} else {temp_alpha = 1}
	
	for(var v = 0; v < array_length(_cur_box.custom_triggers); v++){
		var _check_method = GetMethod(_cur_box.custom_triggers[v].trigger );
		var _trigger_args = _cur_box.custom_triggers[v].trigger_arg;
		_trigger_args[0] = _cur_box;
		if(method_call (_check_method, _trigger_args )){
			for(var vi = 0;vi < array_length(_cur_box.custom_triggers[v].action);vi++){
				var _action_method = GetMethod(_cur_box.custom_triggers[v].action[vi].Method)
				method_call(
					_action_method,
					_cur_box.custom_triggers[v].action[vi].arguments);
			}
		}
	}
}*/


#region selected


if(active){
	if(blink_alpha >= 1.3){
		blink_direction = -blink_speed;
	
	} 
	if(blink_alpha <= 0.05){
		blink_direction = blink_speed;
	}
	blink_alpha += blink_direction;
	if(keyboard_check(vk_shift)){ 
		resizing_speed = base_rez_speed + add_rez_speed; 
	} 
	else {resizing_speed = base_rez_speed;}
	if(keyboard_check_pressed(vk_f1)){
		main_selected_flag = !main_selected_flag;
	}

	if(main_selected_flag ){
		if(keyboard_check(vk_control)){
		if(mouse_check_button_pressed(mb_left)){
			_struct.cluster_gui_x =  GUI_MOUSE_X;
			_struct.cluster_gui_y =  GUI_MOUSE_Y;
			_struct.position_change_flag = true;
		}
		if(keyboard_check(vk_up)){	
			_struct.main_box.Gui_Height_percentage -= resizing_speed;
			_struct.main_box.Height = GUI_HEIGHT * _struct.main_box.Gui_Height_percentage;
		}
		if(keyboard_check(vk_down)){	
			_struct.main_box.Gui_Height_percentage += resizing_speed;
			_struct.main_box.Height = GUI_HEIGHT * _struct.main_box.Gui_Height_percentage;
		}
		if(keyboard_check(vk_right)){
			_struct.main_box.Gui_Width_percentage += resizing_speed;	
			_struct.main_box.Width = GUI_WIDHT * _struct.main_box.Gui_Width_percentage;
		}
		if(keyboard_check(vk_left)){
			_struct.main_box.Gui_Width_percentage -= resizing_speed;	
			_struct.main_box.Width = GUI_WIDHT * _struct.main_box.Gui_Width_percentage;
		}
		}
	} 
	else {
		//main_selected_flag = false;
		if( (keyboard_check(vk_anykey) || mouse_check_button(mb_any)) && (keyboard_check(vk_control)) ){
			
			blink_alpha = 1.8;
		
			for(var ii = 0; ii < array_length(selected_boxes); ii++){
				var _cur_box = _struct.linked_boxes[selected_boxes[ii]];
				if(!keyboard_check(vk_alt)){
					if(struct_exists(_cur_box.custom_properties, "minibox")){
						var _minibox = _cur_box.custom_properties.minibox;
					}
					if(mouse_check_button_pressed(mb_left)){
						_cur_box.drawing_x = GUI_MOUSE_X;
						_cur_box.drawing_y = GUI_MOUSE_Y;
						_cur_box.position_disparity_x = _struct.cluster_gui_x -_cur_box.drawing_x;
						_cur_box.position_disparity_y = _struct.cluster_gui_y - _cur_box.drawing_y;
						
						//_struct.position_change_flag = true;
					}
					if(keyboard_check(vk_up)){	
						_cur_box.Gui_Height_percentage -= resizing_speed;
						_cur_box.Height = GUI_HEIGHT * _cur_box.Gui_Height_percentage;
						if(struct_exists(_cur_box.custom_properties, "minibox")){
							_minibox.Gui_Height_percentage -= resizing_speed;
							//_minibox.border -= resizing_speed;
						}
					}
					if(keyboard_check(vk_down)){	
						_cur_box.Gui_Height_percentage += resizing_speed;
						_cur_box.Height = GUI_HEIGHT * _cur_box.Gui_Height_percentage;
						if(struct_exists(_cur_box.custom_properties, "minibox")){
							_minibox.Gui_Height_percentage += resizing_speed;
							//_minibox.border += resizing_speed;
						}
					}
					if(keyboard_check(vk_right)){
						_cur_box.Gui_Width_percentage += resizing_speed;	
						_cur_box.Width = GUI_WIDHT * _cur_box.Gui_Width_percentage;
						if(struct_exists(_cur_box.custom_properties, "minibox")){
							_minibox.Gui_Width_percentage  += resizing_speed;
							//_minibox.border += resizing_speed;
						}
					}
					if(keyboard_check(vk_left)){
						_cur_box.Gui_Width_percentage -= resizing_speed;	
						_cur_box.Width = GUI_WIDHT * _cur_box.Gui_Width_percentage;
						if(struct_exists(_cur_box.custom_properties, "minibox")){
							_minibox.Gui_Width_percentage -= resizing_speed;
							//_minibox.border -= resizing_speed;
						}
					}
				}
				else {
					if(keyboard_check(vk_up)){	
						_cur_box.drawing_y -= 1;
						_cur_box.position_disparity_y = _struct.cluster_gui_y -_cur_box.drawing_y;
					}
					if(keyboard_check(vk_down)){	
						_cur_box.drawing_y += 1;
						_cur_box.position_disparity_y = _struct.cluster_gui_y -_cur_box.drawing_y;
					}
					if(keyboard_check(vk_right)){
						_cur_box.drawing_x += 1;
						_cur_box.position_disparity_x = _struct.cluster_gui_x -_cur_box.drawing_x;
					}
					if(keyboard_check(vk_left)){
						_cur_box.drawing_x -= 1;
						_cur_box.position_disparity_x = _struct.cluster_gui_x -_cur_box.drawing_x;
					}
				
				}
			}
			if(array_length(selected_boxes)){
			if(keyboard_check_pressed(ord("X"))){
				if(array_length(selected_boxes)){
					var _dest = real(selected_boxes[0])+1;
					if!(_dest >= array_length(_struct.linked_boxes)){
						ArraySwap(_struct.linked_boxes, selected_boxes[0], _dest);
						selected_boxes[0] = _dest;
					} 
				}
		
			}
			if(keyboard_check_pressed(ord("Z"))){
				
				var _dest = real(selected_boxes[0])-1;
				if!(_dest < 0){
					ArraySwap(_struct.linked_boxes, selected_boxes[0], _dest);
					selected_boxes[0] = _dest;
				} 
		
		
			}
			if(keyboard_check_pressed(ord("Q"))){
				array_delete(selected_boxes, 0, _num_of_boxes);
				for(var iii = 0;iii < _num_of_boxes;iii++){
					array_push(selected_boxes, iii);
				}
			}
			if(keyboard_check_pressed(ord("F"))){
				array_delete(selected_boxes, 0, _num_of_boxes);
				array_push(selected_boxes, 0);
			}
			if(keyboard_check_pressed(ord("N"))){
				if(array_length(selected_boxes) < 1){
					array_delete(selected_boxes, 1, _num_of_boxes);
				}
				selected_boxes[0] = selected_boxes[0]+1;
				if(selected_boxes[0] >= array_length(_struct.linked_boxes)){
					selected_boxes[0] = 0;
				}
			}
		}
	}
	}
}
	#endregion

}