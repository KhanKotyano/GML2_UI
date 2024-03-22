

ACCEPT_BUTTON = mouse_check_button_pressed(mb_left);
MOUSE_HOLD = mouse_check_button(mb_left);
MOUSE_RELEASED = mouse_check_button_released(mb_left);
MOUSE_PRESSED = mouse_check_button_pressed(mb_left);


GUI_MOUSE_X =  Room_x_to_gui_x(mouse_x, view_camera[CAMERA]);
GUI_MOUSE_Y =  Room_y_to_gui_y(mouse_y, view_camera[CAMERA]);
