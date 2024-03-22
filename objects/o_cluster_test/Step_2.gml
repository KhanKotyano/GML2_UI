if(!_struct.sleep){
	var _num_of_boxes = array_length(_struct.linked_boxes);
	if(_struct.link_type == linked_to.instance){
		_struct.cluster_gui_x  = Room_x_to_gui_x(o_staticshit.x, view_camera[CAMERA]);
		_struct.cluster_gui_y  = Room_y_to_gui_y(o_staticshit.y, view_camera[CAMERA]);
		_struct.position_change_flag = true;
	}

	for(var v = 0;v < _num_of_boxes;v++){
		var _cur_box = _struct.linked_boxes[v];
		_cur_box.Height = GUI_HEIGHT * _cur_box.Gui_Height_percentage;
		_cur_box.Width = GUI_WIDHT * _cur_box.Gui_Width_percentage;
		_cur_box.drawing_x = (_struct.cluster_gui_x - _cur_box.position_disparity_x) ;
		_cur_box.drawing_y = (_struct.cluster_gui_y -_cur_box.position_disparity_y) ;
	}

}