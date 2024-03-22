///@desc 
///@arg  _struct 
///@arg  _val_name
///@arg { Any } _value
function CreateStructValue(_struct, _val_name, _value = noone){
	if(!struct_exists(_struct, _val_name)) {
		struct_set(_struct, _val_name, _value);
	}
}

function Room_x_to_gui_x(_x, _camera) {
    var p = _x - camera_get_view_x(_camera);
    p /= camera_get_view_width(_camera);
	return p * display_get_gui_width();
}

function Gui_x_to_room_x(_x, _camera) {
    var p = _x / display_get_gui_width();
    p *= camera_get_view_width(_camera);
    return p + camera_get_view_x(_camera);
}

function Room_y_to_gui_y(_y, _camera) {
    var p = _y - camera_get_view_y(_camera);
    p /= camera_get_view_height(_camera);
	return p * display_get_gui_height();
}

function Gui_y_to_room_y(_y, _camera) {
    var p = _y / display_get_gui_height();
    p *= camera_get_view_height(_camera);
    return p + camera_get_view_y(_camera);
}

function SaveJson(_struct, _path){
	var _json_str = json_stringify(_struct, true);
	var _room_file;
	_room_file = file_text_open_write(_path);
	file_text_write_string(_room_file , _json_str);
	file_text_close(_room_file);
	show_debug_message("File saved at the path:" + _path);
}
function GetJcon(_path){
	var _return_struct = noone;
	if(file_exists(_path)){
		var json = "";
	
		var file = file_text_open_read(_path);
		while(file_text_eof(file) == false){	
			json += file_text_readln(file);
		}
		file_text_close(file);
		var pre_scene = json_parse(json);
		_return_struct = pre_scene;
	} 
	else {
		show_debug_message("File not found : " + string(_path))
		return -4;
	}
	return _return_struct;
}

function ArrayFindValue(_array, _val){
	for(var i = 0; i < array_length(_array); i++){
		if(_array[i] == _val){return true}
	}
	return false;
}

function ArraySwap(_array,_index1, _index2){ 
	var _temp = _array[_index1];
	_array[_index1] = _array[_index2];
	_array[_index2] = _temp;
	
}
function ArrayZeroShift(_array){
	var _temp = _array[array_length(_array)-1];
	var _stack = ArrayIntoStack(_array);
	ds_stack_pop(_stack);
	ds_stack_push(_stack,_temp);
	_array = StackIntoArray(_stack);
	ds_stack_destroy(_stack);
	
}

function ArrayIntoStack(_array){
	var _alng = array_length(_array);
	var _stack = ds_stack_create();
	for(var i = 0;i > _alng; ++i){
		ds_stack_push(_stack, _array[i]);
	}
	return _stack;
}
function StackIntoArray(_stack){
	var _array = array_create(ds_stack_size(_stack));
	var i = 0;
	while(!ds_stack_empty(_stack)){
		_array[i] = ds_stack_pop(_stack);
		i++;
	}
	return _array;
}

function StringCommandReader(_timeline_head){
	var _argumet_array = array_create(0); 

	var _argumet_string = "";
	_timeline_head = string_lower(_timeline_head);

	for(var c = 1;c < string_length(_timeline_head)+1;c++){
		var _char_at = string_char_at(_timeline_head, c)
		if(_char_at == ":" or _char_at == ";"){
			array_push(_argumet_array, _argumet_string);
			_argumet_string = "";
		}else {
			_argumet_string += _char_at;
		}
	}
	return _argumet_array;
}

function ArrayNewOrder(_array, _array_order){
	var _temp_array = array_length(_array);
	for(var i = 0;i < array_length(_array);i++){
		_temp_array[i] =  _array[_array_order[i]-1];
	}
	return _temp_array;
}



















