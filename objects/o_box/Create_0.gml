show_debug_message(Gui_x);
show_debug_message(Gui_y);
Width = GUI_WIDHT * Gui_Width_percentage;
Height = GUI_HEIGHT * Gui_Height_percentage;
if(alling_to_screen){
	drawing_x = 0;
	drawing_y = 0;
} else {
	drawing_x = Gui_x;
	drawing_y = Gui_y;
}
selected = true;