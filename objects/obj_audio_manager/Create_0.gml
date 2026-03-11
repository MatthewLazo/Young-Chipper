function play_sound(sound, pitch)
{
	audio_play_sound(sound, 1, false, 1,0, pitch)
}
function play_sound_at(sound, place_x, place_y, pitch)
{
	audio_play_sound_at(sound, place_x, place_y, 0, 1, 10,5,false,1,1,0,pitch)
}
