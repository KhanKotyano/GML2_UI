_struct = GetJcon(working_directory + name + "_" + string(GUI_WIDHT) + "_" + string(GUI_HEIGHT) + ".json");
Gui_x = _struct.cluster_gui_x;
Gui_y = _struct.cluster_gui_y;
var _num_of_boxes = array_length(_struct.linked_boxes);
for(var i = 0;i < _num_of_boxes;i++){
	var _cur_box = _struct.linked_boxes[i];
	
	_cur_box.drawing_x = (_struct.cluster_gui_x - _cur_box.position_disparity_x)  ; //* global.gui_size_w
	_cur_box.drawing_y = (_struct.cluster_gui_y -_cur_box.position_disparity_y ) ; // * global.gui_size_h
	_cur_box.Width = (GUI_WIDHT * _cur_box.Gui_Width_percentage) ;
	_cur_box.Height = (GUI_HEIGHT * _cur_box.Gui_Height_percentage) ;

		
}
_struct.cluster_gui_x = _struct.cluster_gui_x * global.gui_size_w;
_struct.cluster_gui_y = _struct.cluster_gui_y * global.gui_size_h;
hide_main_box = true;
#region Temp values
temp_sprite = 0;
temp_ID = 0;
temp_alpha = 1;
temp_gui_x = 0;
temp_gui_y = 0;
//temp_disp_x = 0;
//temp_disp_y = 0;
temp_color = c_white;
temp_w = 0;
temp_h = 0;
#endregion