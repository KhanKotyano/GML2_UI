enum boxtype {
	regular   = 0,
	custom	  = 1,
	book      = 2,
	button    = 3,
	streched  = 4,
	container = 5,
	linked	  = 6,
	minibox	  = 7
	
}

function StandartTriggersGUI(_boxtype, _add_begining = [], _add_end = []){
	var _array = array_create(0);
	if(!is_array( _add_begining) ){
		_add_begining = [_add_begining];
	}
	if(!is_array( _add_end) ){
		_add_end = [_add_end];
	}
	for(var i = 0;i < array_length(_add_begining);i++){
		array_push(_array, _add_begining[i])
	}
	switch(_boxtype){
		case boxtype.regular :{
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(DrawSelf) ]) );
		}break;
		
		case boxtype.custom :{
			
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(DrawSelf) ]) );
		}break;
		
		case boxtype.book :{
			
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(DrawSelf) ]) );
			//array_push(_array, 
			//			new TriggerConstructor(Always, [new ActionConstructor(DrawCustomText, [fontID.regular]) ]) );
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(ProssesBookText, [text_prosses_mode._scribble]) ]) );
		}break;
		
		case boxtype.container  :{
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(GeneralStrech) ]) );
			array_push(_array, 
						new TriggerConstructor(OnHover, [new ActionConstructor(SetAlphaTemp, [1]) ]) );
			array_push(_array, 
						new TriggerConstructor(Always, 
							[new ActionConstructor(ProssesMiniboxes, [item_prosses_mode.dynamic]) 
							,new ActionConstructor(DrawSelf) ]) );
			array_push(_array, 
						new TriggerConstructor(IsItemDragged, [new ActionConstructor(DrawDraggedItem , [c_white, 1]) ]) );
		
		}break;
		
		case boxtype.linked :{
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(DrawSelf) ]) );
		}break;
		
		case boxtype.button :{
			array_push(_array, 
						new TriggerConstructor(OnClick, [new ActionConstructor(BoxTypeSleep, boxtype.container) ]) );
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(DrawSelf) ]) );
			
		}break;
		
		case boxtype.streched :{
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(DrawSelf) ]) );
		}break;
		
		case boxtype.minibox :{
			array_push(_array, 
						new TriggerConstructor(Always, 
							[new ActionConstructor(DrawMinibox), new ActionConstructor(DrawItem) ]) );
			
		}break;
		
	}
	for(var i = 0;i <	array_length( _add_end);i++){
		array_push(_array, _add_end[i])
	}
	return _array;
}

function StandartTriggers(_boxtype, _add_begining = [], _add_end = []){
	var _array = array_create(0);
	if(!is_array( _add_begining) ){
		_add_begining = [_add_begining];
	}
	if(!is_array( _add_end) ){
		_add_end = [_add_end];
	}
	for(var i = 0;i < array_length(_add_begining);i++){
		array_push(_array, _add_begining[i])
	}
	switch(_boxtype){
		case boxtype.regular :{
			
		}break;
		case boxtype.custom :{
			
		}break;
		case boxtype.book :{
			
		}break;
		case boxtype.container :{
			array_push(_array, 
						new TriggerConstructor(Always, [new ActionConstructor(GeneralStrech) ]) );
		}break;
		case boxtype.linked :{
			
		}break;
		case boxtype.button :{
			
		}break;
		case boxtype.streched :{
			
		}break;
		case boxtype.minibox :{
			
		}break;
	}
	for(var i = 0;i < array_length(_add_end);i++){
		array_push(_array, _add_end[i])
	}
	return _array;
	
}
	
function StandartCustomProps(_struct, _boxtype) constructor {
	switch(_boxtype){
		case boxtype.regular :{
			
		}break;
		case boxtype.custom :{
			
		}break;
		case boxtype.book:{
			CreateStructValue(_struct, "linked_text", "some random text");
		}break;
		case boxtype.container :{
			CreateStructValue(_struct, "w", 5);
			CreateStructValue(_struct, "h", 5);
			CreateStructValue(_struct, "items", noone);
			CreateStructValue(_struct, "prosses_mode", item_prosses_mode.fit);
			if(!struct_exists(_struct, "minibox")) {
				struct_set(_struct, "minibox", MINIBOX_REGULAR);
				//TODO: Сделать инкапсулированные итемы
				_struct.minibox.custom_properties._items = _struct.items;
				_struct.minibox.custom_properties._item_draw_mode = _struct.prosses_mode;
				//_struct.minibox.custom_properties._daddy_box = _struct.minibox;
				_struct.minibox.custom_properties._border_x = GUI_WIDHT *  _struct.minibox.border_x;
				_struct.minibox.custom_properties._border_y = GUI_HEIGHT * _struct.minibox.border_y;
				_struct.minibox.custom_properties._width = GUI_WIDHT *  _struct.minibox.Gui_Width_percentage;
				_struct.minibox.custom_properties._height = GUI_HEIGHT *  _struct.minibox.Gui_Height_percentage;
				
			};
			CreateStructValue(_struct, "prosses_offset", 0);
		}break;
		case boxtype.linked :{
			CreateStructValue(_struct, "link_with");
			
		}break;
		case boxtype.button :{
			
		}break;
		case boxtype.streched :{
			
		}break;
		case boxtype.minibox :{
			
		}break;
	}
	
}