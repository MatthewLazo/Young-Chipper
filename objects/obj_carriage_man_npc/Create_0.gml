// Inherit the parent event
event_inherited();

spr_idle=spr_carriage_man
spr_dead=spr_carriage_man_dead
cutscene1 = [["talk", ["Carriage Man: HELP ME!"]], ["end"]]
moveable=false

function upon_death()
{
	global.flags.lvl1.main.carriage_man=-1
}
function cutscene_check()
{
	if (global.flags.lvl1.main.carriage_man==-1) current_cutscene=dead_cutscene
	else current_cutscene=cutscene1
}
