// Inherit the parent event
event_inherited();

cutscene1 = [["talk", ["Balloon Boy: Hello!"]], ["end"]]

function upon_death()
{
	
}

function cutscene_check()
{
	if (state == npc_state.dead) current_cutscene=dead_cutscene
	else current_cutscene=cutscene1
}