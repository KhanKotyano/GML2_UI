_struct = {
	position_change_flag : true,
	link_type : Type,
	cluster_gui_x : Gui_x,
	cluster_gui_y : Gui_y,
	main_box : new BoxConstructor(0.05, 0.05, 
								  SetSprite(s_box3), 
								  boxtype.regular),
	linked_boxes : array_create(0),
	cluster_name : TestName,
	sleep : false
}
active = true;
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

hide_main_box = false;
main_selected_flag = false;
blink_speed = 0.015;
blink_alpha = 1;
blink_direction = blink_speed;

selected_boxes = array_create(0);

ClusterAddBox("name", boxsprite.def, boxtype.book, 12, 12, {linked_text : SetValue(global.text)});
ClusterAddBox("name", boxsprite.def, boxtype.regular, 12, 12)
//ClusterAddBox("name", boxsprite.def, boxtype.container,6,6, {items : SetValue(global.inventory)});
//ClusterAddBox("name", boxsprite.def, boxtype.button);
selected_boxes[0] = 0;

//AddTrigger(TestName, OnHover, "s_change_t:s_def_white;" );
/*_struct.linked_boxes[0].custom_triggers = [ 
new TriggerConstructor(
	OnHover, 
	new ActionConstructor(ChangeSpriteTemp, [SetSprite(s_box2)])), 
new TriggerConstructor(
	OnClick, 
	new ActionConstructor(ChangeSprite, [ SetSprite(s_box5)]) )
];*/

//selected_boxes[0] = 0; CreateTCluster "asd" 0
base_rez_speed = 0.001;
resizing_speed = base_rez_speed;
add_rez_speed = 0.005;


var _num_of_boxes = array_length(_struct.linked_boxes);
for(var i = 0;i < _num_of_boxes;i++){
	var _cur_box = _struct.linked_boxes[i];
	
	if(_struct.position_change_flag){
		_cur_box.drawing_x = (_struct.cluster_gui_x - _cur_box.position_disparity_x) * global.gui_size_w;
		_cur_box.drawing_y = (_struct.cluster_gui_y -_cur_box.position_disparity_y) * global.gui_size_h;
		_cur_box.Width = (GUI_WIDHT * _cur_box.Gui_Width_percentage) ;
		_cur_box.Height = (GUI_HEIGHT * _cur_box.Gui_Height_percentage) ;
	}
}
if(_struct.position_change_flag){
	_struct.main_box.Width = (GUI_WIDHT * _struct.main_box.Gui_Width_percentage);
	_struct.main_box.Height = (GUI_HEIGHT * _struct.main_box.Gui_Height_percentage);
	_struct.position_change_flag = false;
}








//main_stack = ds_stack_create();
//message_stack = ds_stack_create();



/*array_push(_struct.linked_boxes, new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100, [
	new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100,[
		new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100, [
			new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100)
		]),
		new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100)
	]),
	new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100),
	new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100)
]) );
_struct.selected_boxes[0] = 0;
array_push(_struct.linked_boxes, new BoxConstructor(0.20, 0.50, 12, 12, s_box, 400, 400,[
	new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100),
	new BoxConstructor(0.20, 0.50, 12, 12, s_box, 100, 100)
]) );
array_push(_struct.linked_boxes, new BoxConstructor(0.20, 0.50, 12, 12, s_box, 300, 300) );




/*if(array_length(_struct.linked_boxes) == 0){
	array_push(_struct.linked_boxes, new BoxConstructor(0.20, 0.50, 12, 12, s_box, 0, 0) );
}

var _depth = 0;
var _count = 0;
var _move_count = 0;
var _current_box = noone;
var _condition = true;
 _path = ds_stack_create();
_path_number = ds_stack_create();
*repeat(array_length(_struct.linked_boxes)){
	//depth 0
	_current_box = _struct.linked_boxes[_count];
	ds_stack_push(main_stack, _current_box);
	show_debug_message(_current_box._number);
	//while(_condtition){
	var _depth_box_length = array_length(_current_box.linked_boxes);
	var d = 0;
	_condition = true;
	while(_condition){
		_depth_box_length = array_length(_current_box.linked_boxes);
		if(!(d < _depth_box_length)){
			//show_debug_message(_path);
			//show_debug_message(_path_number);
			if(ds_stack_empty(_path)){
				_condition = false;
				continue;
			} else {
				d = ds_stack_pop(_path_number)+1;
				_current_box = ds_stack_pop(_path);
				continue;
			}
		} 
		if(!_current_box.added_in_stack){
			show_debug_message(_current_box._number);
			ds_stack_push(main_stack, _current_box);
			_current_box.added_in_stack = true;
		}
		if(array_length(_current_box.linked_boxes[d].linked_boxes)){
			ds_stack_push(_path, _current_box);
			ds_stack_push(_path_number, d);
			_current_box = _current_box.linked_boxes[_move_count];
			
			continue;
		}
		d++;		
	} 
	//}
	
	
	_count++;
	_depth = 0;
	show_debug_message("Count: "+string(_count));
}
ds_stack_destroy(_path);
ds_stack_destroy(_path_number);




/*for(var i = 0;i < _num_of_boxes;i++){
	var _cur_box = _struct.linked_boxes[i];
	
	
	if(GUI_FLAG){
		_cur_box.drawing_x = (_struct.cluster_gui_x - _cur_box.position_disparity_x) ; // * global.gui_size_w
		_cur_box.drawing_y = (_struct.cluster_gui_y -_cur_box.position_disparity_y ) ; // * global.gui_size_h
		_cur_box.Width = (GUI_WIDHT * _cur_box.Gui_Width_percentage) ;
		_cur_box.Height = (GUI_HEIGHT * _cur_box.Gui_Height_percentage) ;
		
	}
}
if(GUI_FLAG ){
	_struct.cluster_gui_x = _struct.cluster_gui_x //* global.gui_size_w;
	_struct.cluster_gui_y = _struct.cluster_gui_y //* global.gui_size_h;
	
}

*/