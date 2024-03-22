randomize();
enum linked_to {
	display   = 0,
	place	  = 1,
	instance  = 2
}


show_debug_log(true);
//show_debug_overlay(true);
global.inventory = array_create(25, new Item(SetSprite(s_box2143)))
repeat(12){
	global.inventory[irandom(24)] = noone;
	global.inventory[irandom(24)] = new Item(SetSprite(s_box1));
}

display_set_gui_size(1280, 720);
display_set_gui_maximize(1, 1);
global.assept_button_pressed = false;
global.mouse_pressed = false;
global.mouse_hold = false;
global.mouse_released = false;

global.mouse_position_x = 0;
global.mouse_position_y = 0;
global.display_width = display_get_gui_width();
global.display_height = display_get_gui_height();

global.update_gui_size = false;
global.current_camera = 1;

global.gui_size_w = global.display_width  / 1280 ;
global.gui_size_h =global.display_height / 720   ;

global.text = "[fn_regular]some test text";

global.test_inventory_prosses_mode = item_prosses_mode.fit;
global.box_disp = 720 / 1280 ;
#macro ACCEPT_BUTTON global.assept_button_pressed
#macro MOUSE_PRESSED global.mouse_pressed
#macro MOUSE_RELEASED global.mouse_released
#macro MOUSE_HOLD global.mouse_hold

#macro GUI_MOUSE_X global.mouse_position_x 
#macro GUI_MOUSE_Y global.mouse_position_y
#macro CAMERA 1
#macro GUI_FLAG global.update_gui_size
#macro GUI_WIDHT global.display_width
#macro GUI_HEIGHT global.display_height
#macro WIDTH_RECT_MOD global.box_disp

#macro ON_HOVER new TriggerConstructor(OnHoverItem, [new ActionConstructor(SetAlphaTemp, [1]) ])
#macro DRAGGING_ITEM new TriggerConstructor(DraggingItem, [new ActionConstructor(SetAlphaTemp, [0.4]) ])
#macro DROPPING_ITEM new TriggerConstructor(DroppingItem, [new ActionConstructor(ItemLanded) ])

#macro BOX_REGULAR new BoxConstructor( 0.10, 0.10, boxsprite.def, boxtype.regular)
#macro MINIBOX_REGULAR FastNewBox()
function FastNewBox(){
	var _new_box = new BoxConstructor( 0.10,  0.10 * WIDTH_RECT_MOD ,
							boxsprite.def, boxtype.minibox, 0.01* WIDTH_RECT_MOD ,  0.01 );
	
	_new_box.custom_triggers = [ON_HOVER, DRAGGING_ITEM, DROPPING_ITEM];
	_new_box.custom_properties = {
		_items : 0,//temp_ID.custom_properties.items,
		//_daddy_box : 0,//temp_ID.custom_properties.minibox,
		_sprite : 0,
		_alpha : 1,//temp_alpha,
		_color : c_white,//temp_color,
		_border_x :  0,//GUI_WIDHT *  temp_ID.custom_properties.minibox.border_x,
		_border_y : 0,// GUI_HEIGHT * temp_ID.custom_properties.minibox.border_y,
		_gui_x : 0,//(temp_gui_x + (GUI_WIDHT *  temp_ID.custom_properties.minibox.border_x) * 2),
		_gui_y : 0,//(temp_gui_y + (GUI_HEIGHT * temp_ID.custom_properties.minibox.border_y) * 2),
		_width :  0,// GUI_WIDHT *  temp_ID.custom_properties.minibox.Gui_Width_percentage,
		_height :  0,//GUI_HEIGHT *  temp_ID.custom_properties.minibox.Gui_Height_percentage,
		_inventory_count : 0,
		_inventory_lng : 0,//array_length(temp_ID.custom_properties.items),
		_ivent_width : 0,//temp_ID.custom_properties.w,
		_ivent_height : 0,//temp_ID.custom_properties.h,
		_number : 0
	}
	return _new_box
}


















