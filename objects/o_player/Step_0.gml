move_up = keyboard_check(ord("W"));
move_down =  keyboard_check(ord("S"));
move_left = keyboard_check(ord("A"));
move_right = keyboard_check(ord("D"));

y += (move_down - move_up) * movespeed;
x +=  (move_right - move_left) * movespeed;