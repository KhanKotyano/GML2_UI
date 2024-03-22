

#region get/set structs
enum valID {
	/*1: Get global */
	inventory = 10,	
	/*2: Get file */
	
	/*3: Get plain text */
	test_text = 11,
}
function SetValue(_struct){
	switch(_struct){
	case global.inventory:{
		return valID.inventory;
	}break;
	case global.text:{
		return valID.test_text;
	}break;
	}//end
	
}
function GetValue(_structID){
	switch(_structID){
	case valID.inventory:{
		return global.inventory;
	}break;
	case valID.test_text:{
		return  global.text;
	}break;
	}//end
	
}

#endregion
#region get/set font
enum fontID {
	regular = 0,
}
function SetFont(_font){
	switch(_font){
	case fn_regular:{
		return fontID.regular;
	}break;
	
	}//end
}
function GetFont(_font_ID){
	switch(_font_ID){
	case fontID.regular:{
		return fn_regular;
	}break;
	
	}//end
}

#endregion
#region Set/Get sprite 
enum boxsprite {
	def = 0,
	def_white = 1,
	evil = 2,
	heart = 3,
	gay_heart = 4 ,
	evil_box = 5 ,
}

function SetSprite(_sprite){
	switch (_sprite) {
	case s_box2143:{
	    return boxsprite.heart;
	}break;
	case s_box_evil2:{
	    return boxsprite.evil_box;
	}break;
	case s_box1:{
	    return boxsprite.gay_heart;
	}break;
	case s_box2:{
	    return boxsprite.def_white;
	}break;
	case s_box3:{
	        return boxsprite.def;
	}break;
	case s_box5:{
	    return  boxsprite.evil;
	}break;
	default:{
	    return boxsprite.def;
	}break;
	}
}

function GetSprite(_sprite_id){
	switch (_sprite_id) {
	case boxsprite.heart:{
	    return s_box2143;
	}break;
	case boxsprite.gay_heart:{
	    return  s_box1;
	}break;
	case boxsprite.def:{
	    return s_box3;
	}break;
	case boxsprite.def_white:{
		return s_box2;
	}break;
	case boxsprite.evil:{
	    return s_box5;
	}break;
	case  boxsprite.evil_box:{
	    return s_box_evil2;
	}break;
	default:{
	    return s_box2;
	}break;
	}
}

function GetSpriteByString(_s_name){
	switch (_s_name) {
	case "s_def":{
	    return s_box3;
	}break;
	case "s_def_white":{
		return s_box2;
	}break;
	case "s_evil":{
	    return s_box5;
	}break;
	default:{
	    return s_box2;
	}break;
	}
}
#endregion

enum methodref {
	//undefined
	_undef = 0,
	//triggers
	_on_hover = 10,
	_on_click = 11,
	_always = 12,
	_custom_exist = 13,
	_dragging = 14,
	_dropping = 15,
	_inst_exist = 16,
	_on_hover_EXT = 17,
	
	//actions
	_change_sprite = 20,
	_change_sprite_temp = 21,
	_change_room = 22,
	_set_alpha_t = 23,
	_follow_mouse = 24,
	_draw_minibox = 25,
	_strach = 26,
	_is_item_dragged = 27,
	_my_cluster_sleep = 28,
	_my_cluster_destroy = 29,
	_boxtype_sleep = 200,
	//GUI actions
	_draw_self = 30,
	_draw_text = 31,
	_draw_items = 32,
	_draw_item = 33,
	_draw_item_at_place = 34,
	_draw_item_at_mouse = 35,
	_draw_dragged_item = 36,
	_draw_custom_text = 37,
	_prosses_book_text = 38,
	//SPECIALS
	_execute_int = 40,
	_prosses_minibox = 41,
	_dragging_item = 42,
	_dropping_item = 43,
	_on_hover_any_item = 44,
	_item_landed = 54,	
}
#region Set/Get Method 
function SetMethod(_method){
	switch (_method) {
	case Always:{
	    return methodref._always;
	}break;
	
	case ProssesBookText:{
		return methodref._prosses_book_text;
	}break;
	
	case DrawCustomText:{
	    return methodref._draw_custom_text;
	}break;
	
	case MyClusterSleep:{
	    return methodref._my_cluster_sleep;
	}break;
	case MyClusterDestroy:{
	    return methodref._my_cluster_destroy;
	}break;
	case BoxTypeSleep:{
	    return methodref._boxtype_sleep;
	}break;
	
	case IsItemDragged:{
	    return methodref._is_item_dragged;
	}break;
	case DrawDraggedItem:{
	    return methodref._draw_dragged_item;
	}break;
	
	case DrawItemAtMouse:{
	    return methodref._draw_item_at_mouse;
	}break;
	case DrawItemAtPlace :{
	    return  methodref._draw_item_at_place;
	}break;	
	
	case OnHoverAnyItem:{
	    return methodref._on_hover_any_item;
	}break;
	case DraggingItem:{
	    return methodref._dragging_item;
	}break;
	case DroppingItem:{
	    return methodref._dropping_item;
	}break;
	case ItemLanded:{
	    return methodref._item_landed;
	}break;
	
	
	case OnHoverItem:{
	    return methodref._on_hover_EXT;
	}break;
	case ProssesMiniboxes:{
	    return methodref._prosses_minibox;
	}break;
	case DrawItems:{
	    return methodref._draw_items;
	}break;
	case DrawItem:{
	    return methodref._draw_item;
	}break;
	case ExecuteUsingInst:{
	    return methodref._execute_int;
	}break;
	case DrawTextRegular:{
	    return methodref._draw_text;
	}break;
	case DrawSelf:{
	    return methodref._draw_self;
	}break;
	case instance_exists:{
	    return methodref._inst_exist;
	}break;
	case GeneralStrech:{
	    return methodref._strach;
	}break;
	case DrawMinibox:{
	    return methodref._draw_minibox;
	}break;
	case Dragging:{
	    return methodref._dragging;
	}break;
	case Dropping:{
	    return methodref._dropping;
	}break;
	case FollowMouse:{
	    return methodref._follow_mouse;
	}break;
	
	case CustromPropertyExist:{
	    return methodref._custom_exist;
	}break;
	case OnHover:{
	    return methodref._on_hover;
	}break;
	case OnClick:{
	    return methodref._on_click;
	}break;
	case ChangeSprite:{
	    return  methodref._change_sprite;
	}break;
	case ChangeSpriteTemp:{
	    return  methodref._change_sprite_temp;
	}break;
	case ChangeRoom:{
	    return  methodref._change_room;
	}break;
	case SetAlphaTemp:{
	    return  methodref._set_alpha_t;
	}break;
	default:{
	    return methodref._undef;
	}break;
	}
}

function GetMethod(_method_id){
	switch (_method_id) {
	case methodref._prosses_book_text:{
		return  ProssesBookText;
	}break;
	case methodref._draw_custom_text:{
	    return  DrawCustomText;
	}break;
	
	case methodref._my_cluster_sleep:{
	    return  MyClusterSleep;
	}break;
	case methodref._my_cluster_destroy:{
	    return  MyClusterDestroy;
	}break;
	case  methodref._boxtype_sleep:{
	    return BoxTypeSleep;
	}break;	
		
	
	case  methodref._is_item_dragged:{
	    return IsItemDragged;
	}break;
	case  methodref._draw_dragged_item:{
	    return DrawDraggedItem;
	}break;
		
	case  methodref._draw_item_at_place:{
	    return DrawItemAtPlace;
	}break;	
	case  methodref._draw_item_at_mouse:{
	    return DrawItemAtMouse;
	}break;
	case methodref._on_hover_any_item:{
	    return  OnHoverAnyItem;
	}break;
	case  methodref._dragging_item:{
	    return DraggingItem;
	}break;
	case  methodref._dropping_item :{
	    return DroppingItem;
	}break;
	case  methodref._item_landed:{
	    return ItemLanded;
	}break;	
	
		
	case  methodref._on_hover_EXT:{
	    return OnHoverItem;
	}break;
	case methodref._prosses_minibox:{
	    return ProssesMiniboxes;
	}break;
	case methodref._draw_items:{
	    return  DrawItems;
	}break;
	case methodref._draw_item:{
	    return  DrawItem;
	}break;
	case methodref._execute_int:{
	    return  ExecuteUsingInst;
	}break;
	case methodref._draw_text:{
	    return  DrawTextRegular;
	}break;
	case methodref._draw_self:{
	    return DrawSelf;
	}break;
	case methodref._inst_exist:{
	    return instance_exists;
	}break;
	case  methodref._draw_minibox:{
	    return DrawMinibox;
	}break;
	case methodref._strach:{
	    return  GeneralStrech;
	}break;
	case methodref._dragging:{
	    return Dragging;
	}break;
	case methodref._dropping:{
	    return  Dropping;
	}break;
	case methodref._follow_mouse:{
	    return  FollowMouse;
	}break;
	case methodref._always:{
	    return Always;
	}break;
	case methodref._custom_exist:{
	    return CustromPropertyExist;
	}break;
	case methodref._on_click:{
	    return OnClick;
	}break;
	case methodref._on_hover:{
		return OnHover;
	}break;
	case methodref._change_sprite:{
	    return ChangeSprite;
	}break;
	case methodref._change_sprite_temp:{
	    return ChangeSpriteTemp;
	}break
	case methodref._change_room:{
	    return ChangeRoom;
	}break
	case methodref._set_alpha_t :{
	    return  SetAlphaTemp;
	}break;
	default:{
	    return UnexpectedFunction;
	}break;
	}
}

function GetArgumentByString(_arg = ""){
	_arg = StringCommandReader(_arg);
	switch(_arg[0]){
	case "s_change_t":{
		var _action = new ActionConstructor(ChangeSpriteTemp, [ SetSprite (GetSpriteByString(_arg[1]) ) ] );
		return _action;	
	}break;
	case "s_change":{
		var _action = new ActionConstructor(ChangeSprite, [ SetSprite (GetSpriteByString(_arg[1]) ) ] );
		return _action;	
	}break;
	case "change_room":{
		var _action = new ActionConstructor(ChangeRoom, [ Room1 ] );
		return _action;	
	}break;
	}//end
	
}

#endregion











