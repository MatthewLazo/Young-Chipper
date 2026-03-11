spr_idle = spr_monument
spr_move = spr_monument
npc_id = "man"
cutscene1 = [["talk", ["Rock: I come in peace bro, don't worry about me."]], ["end"]]

function cutscene_check()
{
	current_cutscene=cutscene1
}

function begin_cutscene()
{
	cutscene_check()
	resume_as_normal=false
	obj_cutscene_creator.start_cutscene(current_cutscene)
}