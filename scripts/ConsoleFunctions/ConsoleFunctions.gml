function FullScreen(){
	if(!window_get_fullscreen()){
		window_set_fullscreen(true);
		camera_set_view_size(view_camera[CAMERA], 1280, 720 );
		GUI_FLAG = UpdateGUI(1280, 720, 1280, 720); //  1920 1080
	} else {
		window_set_fullscreen(false);
		camera_set_view_size(view_camera[CAMERA], 1280, 720);
		GUI_FLAG = UpdateGUI(1280, 720, 1280, 720);
	}
}

function AddTrigger(_name ,_trigger){
	var _actions = [];
	if(argument_count > 2){
		for(var i = 2; i < argument_count; i++){
			var _arg = argument[i];
			if(is_string( _arg) ){
				_arg = GetArgumentByString(argument[i])
			}
			
			array_push(_actions, _arg);
		}
	} else {
		
	}
	with(o_cluster_test){
		if(TestName == _name){
		if(array_length(_struct.linked_boxes)){
			array_push( _struct.linked_boxes[selected_boxes[0]].custom_triggers,
						new TriggerConstructor( _trigger, _actions));
		}
		}
	}
}

function AddAction(_name, _trigger, _action){
	var _trigger_id = SetMethod(_trigger);
	with(o_cluster_test){
		if(TestName == _name){
		if(array_length(_struct.linked_boxes)){
			var _custom_triggers = _struct.linked_boxes[selected_boxes[0]].custom_triggers;
			
		}
		}
	}
}

#region Cluster Commands
function ClearClusters(){
	instance_destroy(o_cluster_test);
	instance_destroy(o_cluster);
}
function ClearTestClusters(){
	instance_destroy(o_cluster_test);
	//instance_destroy(o_cluster);
}
function HideMainBox(){
	with(o_cluster_test){
		hide_main_box = true;
	}
}
function ShowMainBox(){
	with(o_cluster_test){
		hide_main_box = false;
	}
}
function CloneSelected(_name){
	with(o_cluster_test){
		if(array_length(selected_boxes) and TestName == _name){
			var _temp = variable_clone(_struct.linked_boxes[selected_boxes[0]] );
			array_push(_struct.linked_boxes, _temp);
			if(array_length(selected_boxes ) == 1){
				_num_of_boxes = array_length(_struct.linked_boxes);
				selected_boxes[0] = _num_of_boxes-1;
			} else {
				array_push(selected_boxes, _num_of_boxes-1);
			}
			for(var i = 0;i < _num_of_boxes;i++){
				var _cur_box = _struct.linked_boxes[i];
				_cur_box.drawing_x = (_struct.cluster_gui_x - _cur_box.position_disparity_x) ; // * global.gui_size_w
				_cur_box.drawing_y = (_struct.cluster_gui_y -_cur_box.position_disparity_y ) ; // * global.gui_size_h
				_cur_box.Width = (GUI_WIDHT * _cur_box.Gui_Width_percentage) ;
				_cur_box.Height = (GUI_HEIGHT * _cur_box.Gui_Height_percentage) ;
		
			}
		}
	}
	
}

function CreateTCluster(_name, _type = 0){
	instance_create_depth(mouse_x, mouse_y, 0, o_cluster_test, {
		TestName : _name,
		Type : _type
	
	});
}

function LoadTCluster(_name){
	instance_create_depth(mouse_x, mouse_y, 0, o_cluster_test, {TestName : _name});
	
}

function LoadCluster(_name){
	instance_create_depth(mouse_x, mouse_y, 0, o_cluster, {name : _name});
	
}

function SaveClusters(){
	with(o_cluster_test){
		SaveJson(_struct, 
				 working_directory + _struct.cluster_name + "_" + string(GUI_WIDHT) + "_" + string(GUI_HEIGHT) + ".json");
	}
}


function ClusterDisable(){
	with(o_cluster_test){
		active = false;
	}
}
function ClusterEnable(){
	with(o_cluster_test){
		active = true;
	}
}
function ClusterSleep(){
	with(o_cluster_test){
		_struct.sleep = true;
	}
}
function ClusterUnsleep(){
	with(o_cluster_test){
		_struct.sleep = true;
	}
}

function ClusterAddBox( _name , _sprite = 0 , _type = 0, _border_x = 6, border_y = 6,
						_special_props = {}, _custom_actions = [],
						_custom_GUI_actions = []){
	with(o_cluster_test){
		if(TestName == _name){
			array_push(_struct.linked_boxes, 
						new BoxConstructor(0.10, 0.10, _sprite, _type, _border_x, border_y,
											_special_props, _custom_actions, _custom_GUI_actions));
			selected_boxes[0] = array_length(_struct.linked_boxes)-1;
			_struct.position_change_flag = true;
		}
	}
}

function ChangeCustomVar(_name , _variable_name, _val){
	with(o_cluster_test){
		if(TestName == _name){
			if(struct_exists(_struct.linked_boxes[selected_boxes[0]].custom_properties, _variable_name)){
				struct_set(_struct.linked_boxes[selected_boxes[0]].custom_properties, _variable_name, _val);
			} 
			else {
				show_debug_message("Custom variable [" + string(_variable_name) + "] does not exist")
			}
		}
	}
}
function ChangeProperty(_name , _variable_name, _val){
	with(o_cluster_test){
		if(TestName == _name){
			if(struct_exists(_struct.linked_boxes[selected_boxes[0]], _variable_name)){
				struct_set(_struct.linked_boxes[selected_boxes[0]], _variable_name, _val);
			} 
			else {
				show_debug_message("Custom variable [" + string(_name) + "] does not exist")
			}
		}
	}
}
#endregion



#region Inventory command
function InventoryRespawn(){
	repeat(12){
		global.inventory[irandom(24)] = noone;
		global.inventory[irandom(24)] = new Item(SetSprite(s_box1));
		global.inventory[irandom(24)] = new Item(SetSprite(s_box2143));
	}
}
//ChangeCustomVar "name" "w" 4
function InventoryResize(_size){
	var _array_lng = array_length(global.inventory);
	array_resize(global.inventory, _size);
	if(_size > _array_lng){
		for(var i = _array_lng;i < _size;i++){
			global.inventory[i] = noone;
		}
	}
}

function InventoryFit(){
	var _empty = function (_element, _index){
		return (_element != noone);
	}
	for(var i = 0;i < array_length(global.inventory);i++){
		if(global.inventory[i] == noone){
			var _not_empty_index = array_find_index(global.inventory,_empty, i);
			if(_not_empty_index != -1){
				global.inventory[i] = global.inventory[_not_empty_index];
				global.inventory[_not_empty_index] = noone;
			} else {
				return 1;
			}
		}
	}
}
#endregion










