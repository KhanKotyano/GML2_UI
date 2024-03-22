function TextboxConstructor(_Height, _Width, 
							_line_y_sep, _sep_borders_x, _sep_borders_y, 
							_font, _sprite) constructor{
	Height = _Height;
	Width = _Width;
	line_y_sep = _line_y_sep;
	sep_borders_x = _sep_borders_x;
	sep_borders_y = _sep_borders_y;
	font = _font;
	sprite = _sprite;
}

function BoxConstructor(_Height_percent, _Width_percent,  
						_sprite, _boxtype , 
						_border_x = 0.01, _border_y = 0.01,
						_special_props = {}, _custrom_GUI_triggers = [],
						_custom_gui_tiggers_end = []) constructor{
	static number = 0;
	Gui_Height_percentage = _Height_percent;
	Gui_Width_percentage = _Width_percent;
	border_x = _border_x;
	border_y = _border_y;
	sprite_ID = _sprite;
	position_disparity_x = 0;
	position_disparity_y = 0;
	Height = 0;
	Width = 0;
	drawing_x = 0;
	drawing_y = 0;
	box_type = _boxtype;
	custom_properties = noone;
	//custom_triggers = noone;
	custom_GUI_triggers = noone;
	ID = number;
	sleep = false;
	boxname = "box" + string(ID);
	switch(_boxtype){
		case boxtype.regular :{
			custom_GUI_triggers = StandartTriggersGUI(_boxtype);
			custom_properties = noone;
			//custom_triggers = noone;
		}break;
		case boxtype.custom :{
			custom_GUI_triggers = _custrom_GUI_triggers;
			custom_properties = _special_props;
			//custom_triggers = _custom_triggers;
		}break;
		case boxtype.container :{
			border_x = 0;
			border_y = 0;
			custom_GUI_triggers = StandartTriggersGUI(_boxtype);
			custom_properties = _special_props;
			StandartCustomProps(custom_properties, _boxtype);
			//custom_triggers = StandartTriggers(_boxtype);
		}break;
		case boxtype.book :{
			//border_x = 0;
			//border_y = 0;
			custom_GUI_triggers = StandartTriggersGUI(_boxtype);
			custom_properties = _special_props;
			StandartCustomProps(custom_properties, _boxtype);
			//custom_triggers = StandartTriggers(_boxtype);
		}break;
		case boxtype.linked :{
			custom_properties = _special_props;
			StandartCustomProps(custom_properties, _boxtype);
			custom_GUI_triggers = StandartTriggersGUI(_boxtype);
			//custom_triggers = [];
		}break;
		case boxtype.button :{
			custom_GUI_triggers = StandartTriggersGUI(_boxtype);
			custom_properties = _special_props;
			//custom_triggers = [
			//	new TriggerConstructor(OnHover, [new ActionConstructor(SetAlphaTemp, [1]) ]),
			//	new TriggerConstructor(OnClick)
			//];
		}break;
		case boxtype.streched :{
			custom_GUI_triggers = StandartTriggersGUI(_boxtype);
			custom_properties = _special_props;
			//custom_triggers = _custom_triggers;
		}break;
		case boxtype.minibox :{
			custom_GUI_triggers = StandartTriggersGUI(_boxtype);
			custom_properties = _special_props;
			//custom_triggers = _custom_triggers;
		}break;
	}
	number++;
}

function Minibox(_Height_percentage, _Width_percentage, _sprite, _boxtype, _border) :
		 BoxConstructor(_Height_percentage, _Width_percentage, _sprite, _boxtype)	constructor {
	border = _border;

}

function TriggerConstructor(_trigger, _actions = [] , _trigger_additional_arg = []) constructor {
	trigger = SetMethod (_trigger);
	trigger_arg = array_create(1, 0);
	if(!is_array( _trigger_additional_arg) ){
		_trigger_additional_arg = [_trigger_additional_arg];
	}
	
	if(array_length(_trigger_additional_arg)){
		for(var i = 0; i < array_length(_trigger_additional_arg);i++) {
			array_push(trigger_arg, _trigger_additional_arg[i]);
		}
	}
	
	if(!is_array(_actions)){
		action = [_actions];
	} else {
		action = _actions;
	}
	
}
function ActionConstructor(_function, _arguments = []) constructor{
	Method  = SetMethod (_function);
	if(!is_array(_arguments)){
		arguments = [_arguments];
	} else {
		arguments = _arguments;
	}
}

function BoxtypeTextbox(_sep_borders_x, _sep_borders_y) constructor{
	sep_borders_x = _sep_borders_x;	
	sep_borders_y = _sep_borders_y;
}


function ClusterConstructor(_id, _x, _y, _type) constructor{
	main_scene = _id;
	text_obj = noone;
	textbox_obj = noone;
	name_text_obj = noone;
	name_textbox_obj = noone;
	options_obj = noone;
	X = _x;
	Y = _y;
	type = _type;
	ID = 0;
}


function Item(_sprite_id) constructor {
	sprite = _sprite_id;
	
}