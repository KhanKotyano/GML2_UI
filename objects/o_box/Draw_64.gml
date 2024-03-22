if(GUI_FLAG){
	drawing_x = Gui_x * global.gui_size_w;
	drawing_y = Gui_y * global.gui_size_h;
	Width = GUI_WIDHT * Gui_Width_percentage;
	Height = GUI_HEIGHT * Gui_Height_percentage;
	
}
draw_sprite_stretched_ext(sprite, 0, drawing_x, drawing_y, 
						  Width, Height, c_white, 1);

