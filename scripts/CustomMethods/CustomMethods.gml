function UnexpectedFunction(){
	
	show_debug_message("Unexpected Custom Function!");
}

#region triggers
function CustromPropertyExist(_struct, miniboxes){
	
	return variable_struct_exists(_struct.custom_properties, miniboxes);
}

function Always(_struct){
	return true;
}
function OnHoverAnyItem(  ){
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	for(var i = 0;i < (  _temp_struct._ivent_width * _temp_struct._ivent_height);i++){
		var _cur_h = floor(i/ _temp_struct._ivent_width);
		var _cur_w = i - (_cur_h * _temp_struct._ivent_width);
		var _xx = _temp_struct._gui_x + ((_temp_struct._width + _temp_struct._border_x) * (_cur_w));
		var _yy = _temp_struct. _gui_y + ((_temp_struct._height + _temp_struct._border_y) * (_cur_h));
		var _hh  = _temp_struct._height;
		var _ww  = _temp_struct._width;
		var _ret = point_in_rectangle(GUI_MOUSE_X, GUI_MOUSE_Y,
								  _xx, _yy, _xx+_ww, _yy+_hh);
		if(_ret){
			return i;
		}
	}
	return -1;
}

function OnHoverItem(  ){
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	var _cur_h = floor(_temp_struct._number / _temp_struct._ivent_width);
	var _cur_w = _temp_struct._number - (_cur_h * _temp_struct._ivent_width);
	var _xx = _temp_struct._gui_x + ((_temp_struct._width + _temp_struct._border_x) * (_cur_w));
	var _yy = _temp_struct. _gui_y + ((_temp_struct._height + _temp_struct._border_y) * (_cur_h));
	var _hh  = _temp_struct._height;
	var _ww  = _temp_struct._width;
	var _ret = point_in_rectangle(GUI_MOUSE_X, GUI_MOUSE_Y,
								  _xx, _yy, _xx+_ww, _yy+_hh);
	return _ret;
}
function DraggingItem(  ){
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	static _dragging = false;
	static _dragged_item = noone;
	static _dragged_item_number = noone;
	static _dragged_items_storage = noone;
	if(_dragged_item_number == _temp_struct._number){
		return true;
	} 
	
	if(!_dragging 
	&& MOUSE_HOLD
	&& GetItemValue(_temp_struct._items, _temp_struct._number) != noone
	&& OnHoverItem( )){
		
		_dragging = true;
		_dragged_item = GetItemValue(_temp_struct._items, _temp_struct._number);
		_dragged_item_number = _temp_struct._number;
		_dragged_items_storage = _temp_struct._items;
		return _dragging;
	}
	
		
		
	
	return false;
}
DraggingItem._dragging = false;
DraggingItem._dragged_item = noone;
DraggingItem._dragged_item_number = noone;
DraggingItem._dragged_items_storage = noone;

function IsItemDragged(){
	
	return DraggingItem._dragging;
}
function DroppingItem(  ){	
	//static _dragging = false;
	if(DraggingItem._dragging && (MOUSE_RELEASED )){
		DraggingItem._dragging = false;
		return true;
	}
	return false;
}
 
function OnHover(_struct){
	var _x, _y, _w, _h;
	 _x = temp_gui_x;
	 _y = temp_gui_y ;
	 _w = temp_w ;
	 _h = temp_h ;
	 
	var _ret = point_in_rectangle(GUI_MOUSE_X, GUI_MOUSE_Y,
								  _x, _y, _x+_w, _y+_h);
	return _ret;
}
function OnHoverOriginal(_struct){
	var _x, _y, _w, _h;
	 _x = _struct.drawing_x ;
	 _y = _struct.drawing_y;
	 _w = _struct.Width;
	 _h = _struct.Height ;
	 
	var _ret = point_in_rectangle(GUI_MOUSE_X, GUI_MOUSE_Y,
								  _x, _y, _x+_w, _y+_h);
	return _ret;
}
function OnClick(_struct){
	return ACCEPT_BUTTON && OnHover(_struct);
}
function Dragging(_struct){
	static _dragging = false;
	if(!_dragging && MOUSE_HOLD && OnHover(_struct)){
		_dragging = true;
		return _dragging;
	}
	
	return _dragging;
}
function Dropping(_struct){
	
	//static _dragging = false;
	if(Dragging._dragging && (MOUSE_RELEASED )){
		Dragging._dragging = false;
		return true;
	}
	return false;
}

#endregion

#region Actions
///@desc You call function, using in with values inside of instance or a struct.
///	You can also provide additional arguments not realited to instance, and specify order of your
/// aguments. Order specification starts with 1.
///@arg {Function} _method 
///@arg {Id.Instance , struct} _inst
///@arg {struct.Any , string , array : string} _val
///@arg {Any , array} _additional_args
///@arg {Real, Array} _order
function ExecuteUsingInst(_method, _inst , _val , _additional_args = [], _order = []){
	var _args = array_create(0);
	if(!is_array( _additional_args) ){
		_additional_args  = [_additional_args]
	}
	if(!is_array( _val) ){
		_val  = [_val]
	}
	
	if(is_struct(_inst)){
		for(var i = 0; i < array_length(_val); i++){
			if(variable_struct_exists( _inst, _val[i] ) ){
				array_push(_args, variable_struct_get(_inst, _val[i]) );
			} else {
				show_debug_message("VARIBALE DOES NOT EXIST");
			}
		
		}
	} else if(instance_exists(_inst)){
		for(var i = 0; i < array_length(_val); i++){
			if(variable_instance_exists( _inst, _val[i] ) ){
				array_push(_args, variable_instance_get(_inst, _val[i]) );
			} else {
				show_debug_message("VARIBALE DOES NOT EXIST");
			}
		
		}
	}
	for(var ii = 0; ii < array_length(_additional_args); ii++){
		array_push(_args, _additional_args[ii] );
	}
	if(array_length(_order)){
		_args = ArrayNewOrder(_args, _order);
	}
	
	method_call(_method, _args);
}

function DrawSelf(){
	draw_sprite_stretched_ext(temp_sprite, 0, temp_gui_x, temp_gui_y , 
							  temp_w, temp_h, c_white, temp_alpha);
}
function DrawTextRegular(_font){
	var _temp_font = draw_get_font();
	draw_set_font(GetFont(_font) );
	var _string = "";
	for(var i = 1; i < argument_count; i++){
		_string += string(argument[i]);
	}
	
	draw_text_transformed(temp_gui_x + temp_ID.border_x, temp_gui_y + temp_ID.border_y, _string, 
						  temp_ID.Gui_Width_percentage * 5, temp_ID.Gui_Height_percentage * 5, 0);
	draw_set_font(_temp_font);
}
function DrawCustomText(_font){
	var _temp_font = draw_get_font();
	draw_set_font(GetFont(_font) );
	
	
	var _text = GetValue(temp_ID.custom_properties.linked_text);
	
	draw_text_transformed(temp_gui_x + temp_ID.border_x, temp_gui_y + temp_ID.border_y, _text, 
						  temp_ID.Gui_Width_percentage * 5, temp_ID.Gui_Height_percentage * 5, 0);
	
	draw_set_font(_temp_font)
}

enum text_prosses_mode {
	_scribble = 1
}
function ProssesBookText(_text_prosses_mode){
	var _text = GetValue(temp_ID.custom_properties.linked_text);
	switch(_text_prosses_mode){
	case text_prosses_mode._scribble:{
		draw_text_scribble_ext(temp_gui_x + temp_ID.border_x, temp_gui_y + temp_ID.border_y,
								_text, temp_w - (temp_ID.border_x *2));
	}break;
	
	}//end of switch
}

function ChangeSpriteTemp(_sprite_id){
	temp_sprite = GetSprite(_sprite_id);
}
function SetAlphaTemp(_new_alpha){
	temp_alpha = _new_alpha;
}
function ChangeSprite( _sprite_id){
	temp_ID.sprite_ID = _sprite_id;
}
function ChangeRoom(_room){
	room_goto(_room);
}
function FollowMouse(){
	temp_gui_x = GUI_MOUSE_X - temp_w/2;
	temp_gui_y = GUI_MOUSE_Y - temp_h/2;
}
function DrawMiniboxes(){
	var _daddy_box = temp_ID.custom_properties.minibox;
	var _sprite = GetSprite(_daddy_box.sprite_ID);
	var _border_x =  GUI_WIDHT *_daddy_box.border_x;
	var _border_y =  GUI_HEIGHT *_daddy_box.border_y;
	var _gui_x = (temp_gui_x + _border_x * 2);
	var _gui_y = (temp_gui_y + _border_y * 2);
	var _width =   GUI_WIDHT * _daddy_box.Gui_Width_percentage;
	var _height =  GUI_HEIGHT * _daddy_box.Gui_Height_percentage;
	var _alpha = temp_alpha;
	for(var i = 0;i < temp_ID.custom_properties.w;i++){
		for(var ii = 0;ii < temp_ID.custom_properties.h;ii++){
			draw_sprite_stretched_ext(_sprite, 0, _gui_x + ((_width + _border_x) * (i)) , 
									  _gui_y + ((_height + _border_y) * (ii)), 
									  _width , _height , c_white, _alpha);
		}
	}
}
function DrawMinibox( ){
	//draw_sprite(s_box3, 0, 600, 600)
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	var _sprite = GetSprite(temp_ID.custom_properties.minibox.sprite_ID);
	var _cur_h = floor(_temp_struct._number / _temp_struct._ivent_width);
	var _cur_w = _temp_struct._number - (_cur_h * _temp_struct._ivent_width);
	var _xx = _temp_struct._gui_x + ((_temp_struct._width + _temp_struct._border_x) * (_cur_w));
	var _yy = _temp_struct. _gui_y + ((_temp_struct._height + _temp_struct._border_y) * (_cur_h));
	var _hh  = _temp_struct._height;
	var _ww  = _temp_struct._width;
			
	draw_sprite_stretched_ext(_sprite, 0, _xx ,  _yy, 
							  _ww , _hh , _temp_struct._color, _temp_struct._alpha);
	
}

function ItemLanded(_struct){	
	//static _dragging = false;
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	if(OnHover( _struct )){
		var _item_number = OnHoverAnyItem();
		if(_item_number >= 0){
			var _item_val = GetItemValue(_temp_struct._items, _item_number);
			if( _item_val == noone){ //true
				SetItemValue(_temp_struct._items, _item_number, DraggingItem._dragged_item);
				
				SetItemValue(DraggingItem._dragged_items_storage, 
							 DraggingItem._dragged_item_number, _item_val);
			}
		}
	}
	DraggingItem._dragged_item_number = noone;
	DraggingItem._dragged_items_storage = noone;
	DraggingItem._dragged_item = noone;
}

function SetItemValue(_items, _item_number, _val){
	
	array_set(_items, _item_number, _val);
}

enum item_prosses_mode {
	fit = 1,
	natural = 2,
	dynamic = 3
}


function DrawItems(){
	var _items = GetValue(temp_ID.custom_properties.items);
	if(is_array(_items)){
		var _item_draw_mode = temp_ID.custom_properties.prosses_mode;
		var _daddy_box = temp_ID.custom_properties.minibox;
		var _sprite = 0;
		var _border_x =  GUI_WIDHT *_daddy_box.border_x;
		var _border_y =  GUI_HEIGHT *_daddy_box.border_y;
		var _gui_x = (temp_gui_x + _border_x * 2);
		var _gui_y = (temp_gui_y + _border_y * 2);
		var _width =   GUI_WIDHT * _daddy_box.Gui_Width_percentage;
		var _height =  GUI_HEIGHT * _daddy_box.Gui_Height_percentage;
		var _alpha = temp_alpha;
		var _inventory_count = 0;
		var _inventory_lng = array_length(_items);
		var _ivent_width = temp_ID.custom_properties.w
		var _ivent_height = temp_ID.custom_properties.h
	
	
		switch(_item_draw_mode){
		case item_prosses_mode.fit:{
			for(var i = 0;i < _inventory_lng ;i++){
				var _cur_h = floor(_inventory_count / _ivent_width);
				var _cur_w = _inventory_count - (_cur_h * _ivent_width);
				if(_items[i] != noone ){
					_sprite = GetSprite(_items[i].sprite);
					draw_sprite_stretched_ext(_sprite, 0, _gui_x + ((_width + _border_x) * (_cur_w)) , 
										  _gui_y + ((_height + _border_y) * (_cur_h)), 
										  _width , _height , c_white, _alpha);
					 _inventory_count++;
				}
		
			}
		}break;
		case item_prosses_mode.natural:{
			for(var i = 0;i < _inventory_lng ;i++){
				var _cur_h = floor(i / _ivent_width);
				var _cur_w = i - (_cur_h * _ivent_width);
				if(_items[i] != noone ){
					_sprite = GetSprite(_items[i].sprite);
					draw_sprite_stretched_ext(_sprite, 0, _gui_x + ((_width + _border_x) * (_cur_w)) , 
										  _gui_y + ((_height + _border_y) * (_cur_h)), 
										  _width , _height , c_white, _alpha);
					 _inventory_count++;
				}
		
			}
		}break;
		}//end
	}
	
}

function DrawItem(){
	//static item_count = 0;
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	if( _temp_struct._number < _temp_struct._inventory_lng
		&&is_struct( GetItemValue(_temp_struct._items, _temp_struct._number) ) ){
		//show_debug_message("draing item")
		var _sprite = GetSprite(_temp_struct._items[_temp_struct._number].sprite);
		var _cur_h = floor(_temp_struct._number / _temp_struct._ivent_width);
		var _cur_w = _temp_struct._number - (_cur_h * _temp_struct._ivent_width);
		var _xx = _temp_struct._gui_x + ((_temp_struct._width + _temp_struct._border_x) * (_cur_w));
		var _yy = _temp_struct. _gui_y + ((_temp_struct._height + _temp_struct._border_y) * (_cur_h));
		var _hh  = _temp_struct._height;
		var _ww  = _temp_struct._width;
			
		draw_sprite_stretched_ext(_sprite, 0, _xx ,  _yy, 
								  _ww , _hh , _temp_struct._color, _temp_struct._alpha);
		draw_text(_xx, _yy, _temp_struct._number+1);
	}
}
function DrawItemAtPlace(_xx , _yy){
	//static item_count = 0;
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	if( _temp_struct._number < _temp_struct._inventory_lng
		&& is_struct( GetItemValue(_temp_struct._items, _temp_struct._number) ) ){
		var _hh  = _temp_struct._height;
		var _ww  = _temp_struct._width;
		var _sprite = GetSprite(_temp_struct._items[_temp_struct._number].sprite);
		draw_sprite_stretched_ext(_sprite, 0, _xx ,  _yy, 
								  _ww , _hh , _temp_struct._color, _temp_struct._alpha);
	}
}
function DrawItemAtMouse(){
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	if( _temp_struct._number < _temp_struct._inventory_lng
		&& GetItemValue(_temp_struct._items, _temp_struct._number) != noone){
		
		var _hh  = _temp_struct._height;
		var _ww  = _temp_struct._width;
		var _xx  = GUI_MOUSE_X - _ww/2;
		var _yy  = GUI_MOUSE_Y - _hh/2;
		var _sprite = GetSprite(_temp_struct._items[_temp_struct._number].sprite);
		draw_sprite_stretched_ext(_sprite, 0, _xx ,  _yy, 
								  _ww , _hh , _temp_struct._color, _temp_struct._alpha);
		
	}
	
}
function DrawDraggedItem(_color, _alpha){
	var _temp_struct = temp_ID.custom_properties.minibox.custom_properties;
	if(DraggingItem._dragging){
		if( DraggingItem._dragged_item_number < _temp_struct._inventory_lng
			&& is_struct( GetItemValue(DraggingItem._dragged_items_storage, DraggingItem._dragged_item_number) )){
		
			var _hh  = _temp_struct._height;
			var _ww  = _temp_struct._width;
			var _xx  = GUI_MOUSE_X - _ww/2;
			var _yy  = GUI_MOUSE_Y - _hh/2;
			var _sprite = GetSprite(GetItemValue(DraggingItem._dragged_items_storage, DraggingItem._dragged_item_number).sprite);
			draw_sprite_stretched_ext(_sprite, 0, _xx ,  _yy, 
									  _ww , _hh , _color, _alpha);
		
		}
	}
}
function GetItemsLng(_items){
	return array_length(_items);
}
function GetItemValue(_items, _number){
	if(_number < GetItemsLng(_items)  ){
		return array_get(_items, _number);
	} else {
		return noone;	
	}
}

function ProssesMiniboxes(_prosses_mode){
	var _temp_temp_alpha = temp_alpha;
	var	_temp_temp_color = temp_color;
	var _temp_struct =  temp_ID.custom_properties.minibox.custom_properties;
	var _daddy_box = temp_ID.custom_properties.minibox;
	_temp_struct._border_x = GUI_WIDHT *  _daddy_box.border_x;
	_temp_struct._border_y = GUI_HEIGHT * _daddy_box.border_y;
	_temp_struct._gui_x = temp_gui_x + _temp_struct._border_x * 2;
	_temp_struct._gui_y = temp_gui_y + _temp_struct._border_y * 2;
	_temp_struct._items = GetValue(temp_ID.custom_properties.items);
	_temp_struct._inventory_lng = GetItemsLng( _temp_struct._items );
	_temp_struct._width = GUI_WIDHT *  temp_ID.custom_properties.minibox.Gui_Width_percentage;
	_temp_struct._height =   GUI_HEIGHT *  temp_ID.custom_properties.minibox.Gui_Height_percentage;
	_temp_struct._number = 0;

	_temp_struct._ivent_width = temp_ID.custom_properties.w;
	_temp_struct._ivent_height = temp_ID.custom_properties.h;
	var _prosses_lng = 0;
	switch(_prosses_mode){
	case item_prosses_mode.fit:{
		_prosses_lng = _temp_struct._ivent_width * _temp_struct._ivent_height
		
	}break;
	case item_prosses_mode.natural:{
		_prosses_lng = _temp_struct._inventory_lng;
		
	}break;
	case item_prosses_mode.dynamic:{
		_prosses_lng = min(_temp_struct._inventory_lng, _temp_struct._ivent_width * _temp_struct._ivent_height);
		
	}break;
	}
	for(var i = 0;i < ( _prosses_lng ) ;i++){
		_temp_struct._number = i;
		for(var v = 0; v < array_length(_daddy_box.custom_triggers); v++){
			var _check_method = GetMethod(_daddy_box.custom_triggers[v].trigger );
			var _trigger_args = _daddy_box.custom_triggers[v].trigger_arg;
			_trigger_args[0] = _temp_struct;
			if(method_call (_check_method, _trigger_args )){
				for(var vi = 0;vi < array_length(_daddy_box.custom_triggers[v].action);vi++){
					var _action_method = GetMethod(_daddy_box.custom_triggers[v].action[vi].Method)
					method_call(
						_action_method,
						_daddy_box.custom_triggers[v].action[vi].arguments);
				}
			}
		}
		_temp_struct._alpha = temp_alpha;
		_temp_struct._color = temp_color;
			
		for(var v = 0; v < array_length(_daddy_box.custom_GUI_triggers); v++){
			var _check_method = GetMethod(_daddy_box.custom_GUI_triggers[v].trigger );
			var _trigger_args = _daddy_box.custom_GUI_triggers[v].trigger_arg;
			_trigger_args[0] = _temp_struct;
			if(method_call (_check_method, _trigger_args )){
				for(var vi = 0;vi < array_length(_daddy_box.custom_GUI_triggers[v].action);vi++){
					var _action_method = GetMethod(_daddy_box.custom_GUI_triggers[v].action[vi].Method)
					//var _action_args = _temp_struct._daddy_box.custom_GUI_triggers[v].action[vi].arguments;
						
					method_call(
						_action_method,
						_daddy_box.custom_GUI_triggers[v].action[vi].arguments);
				}
			}
		}
				
		temp_color = _temp_temp_color;	
		temp_alpha = _temp_temp_alpha;
	}
	temp_color = _temp_temp_color;
	temp_alpha = _temp_temp_alpha;
	_temp_struct= -1;
}
function MyClusterSleep(){
	_struct.sleep = !_struct.sleep;
}
function MyClusterDestroy(){
	instance_destroy(self);
}
function BoxTypeSleep(_boxtype){
	for(var i = 0;i < array_length(_struct.linked_boxes);i++){
		if(_struct.linked_boxes[i].box_type == _boxtype){
			_struct.linked_boxes[i].sleep = !_struct.linked_boxes[i].sleep;
		}
	}
}


function GeneralStrech(){
	var _minibox = temp_ID.custom_properties.minibox;
	temp_w = (GUI_WIDHT * (_minibox.border_x * 3)) + (GUI_WIDHT * (_minibox.Gui_Width_percentage + (_minibox.border_x ) ))  * (temp_ID.custom_properties.w);
	temp_h =  (GUI_HEIGHT * (_minibox.border_y * 3)) + (GUI_HEIGHT * (_minibox.Gui_Height_percentage + (_minibox.border_y ) ))  * (temp_ID.custom_properties.h);
}
#endregion






