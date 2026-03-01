var body_in_zone = instance_place(x,y,obj_player)

if (body_in_zone && not cover_is_full)
{
	cover_is_full = true
	body_ref = body_in_zone
	body_in_zone.in_cover = true;
}
else if (not body_in_zone && cover_is_full)
{
	cover_is_full = false
	if (instance_exists(body_ref))
	{
		body_ref.in_cover = false;
		body_ref = noone
	}
}