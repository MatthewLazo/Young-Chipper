
global.cutscene_active = false

actions = []
action_index = 0

began_task = false

function start_cutscene(cutscene)
{
	actions = cutscene
	global.cutscene_active = true
}
function next_action()
{
	began_task=false
	action_index++;
}