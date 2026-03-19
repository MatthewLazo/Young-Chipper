// Inherit the parent event
event_inherited();

cutscene1 = [["talk", ["Maguire - Today we celebrate our great successes!", "What succeses? As I recall we lost everything.", "Maguire: Oh right... we'll my successes.", "Maguire: I got the house! But not Jeremy. She got him."]], ["end"]]

function upon_death()
{
	
}

function cutscene_check()
{
	if (state == npc_state.dead) current_cutscene=dead_cutscene
	else current_cutscene=cutscene1
}