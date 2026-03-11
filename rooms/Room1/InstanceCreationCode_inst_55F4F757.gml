
cutscene1 = [["talk", ["BeanBoy: Oh hey Chipper."]],["move", "man", 1, 79, 133, true], ["talk", ["Rock: ...", "BeanBoy: Uhh.", "Rock: (shakes)", "Rock: ..."]], ["play_anim", self, spr_beanboy_shocked], ["play_sound", gunshot], ["move", self, 1, 1, 1, true], ["talk", ["Rock: What's his problem?"]],["change_flag", global.flags.lvl1.main, "rock_arguement", 1], ["destroy", self], ["end"]]
function cutscene_check()
{
	current_cutscene = cutscene1
}

function begin_cutscene()
{
	cutscene_check()
	resume_as_normal=false
	obj_cutscene_creator.start_cutscene(current_cutscene)
}