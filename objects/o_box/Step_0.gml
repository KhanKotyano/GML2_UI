if(selected){
	if(mouse_check_button_pressed(mb_left)){
		Gui_x =  Room_x_to_gui_x(mouse_x, view_camera[CAMERA]);
		Gui_y =  Room_y_to_gui_y(mouse_y, view_camera[CAMERA]);
		drawing_x = Gui_x * global.gui_size_w;
		drawing_y = Gui_y * global.gui_size_h;
	}
	if(keyboard_check(vk_up)){	
		Gui_Height_percentage -= 0.005;
		Height = GUI_HEIGHT * Gui_Height_percentage;
	}
	if(keyboard_check(vk_down)){	
		Gui_Height_percentage += 0.005;
		Height = GUI_HEIGHT * Gui_Height_percentage;
	}
	if(keyboard_check(vk_right)){
		Gui_Width_percentage += 0.005;	
		Width = GUI_WIDHT * Gui_Width_percentage;
	}
	if(keyboard_check(vk_left)){
		Gui_Width_percentage -= 0.005;	
		Width = GUI_WIDHT * Gui_Width_percentage;
	}
}