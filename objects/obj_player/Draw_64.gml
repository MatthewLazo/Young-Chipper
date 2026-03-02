if (currently_talking)
{
	// Dialogue
	var x1 = 0;
	var y1 = window_get_height() - 50;
	var x2 = window_get_width() + 150;
	var y2 = window_get_height() + 150;
	
	draw_set_colour(c_white)
	draw_rectangle(x1,y1,x2,y2, false)
	
	draw_set_colour(c_black)
	var text_x = x1 + 32;
	var text_y = y1 + 32;
	
	draw_text_ext(text_x,text_y,  string_copy(current_text, 1, current_text_index), 50, window_get_width() + 150)
	current_text_index++;
	
}
else
{
	// Ammo hud
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);

	var ammo_text_x = 150;
	var ammo_text_y = window_get_height();

	draw_text_transformed(ammo_text_x, ammo_text_y, string(total_ammo), 2, 2, 0);
	draw_sprite_stretched(spr_ui_bullet, -1, 50, window_get_height()-50, 100, 130);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// Menu
	if (menu_opened)
	{
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
	
		var menu_x1 = 120;
		var menu_y1 = 10;
		var menu_x2 = window_get_width + 400;
		var menu_y2 = 200;
	
		draw_set_colour(c_white)
		draw_rectangle(menu_x1,menu_y1,menu_x2,menu_y2, false)
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
	
	

}
