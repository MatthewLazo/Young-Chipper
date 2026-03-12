
cutscene1 = [["talk", ["BeanBoy: Oh hey Chipper."]],["move", "man", 1, 79, 133, true], ["talk", ["Rock: ...", "BeanBoy: Uhh.", "Rock: (shakes)", "Rock: ..."]], ["move_camera", 0.001, 600, 600], ["wait", 2],["play_anim", self, spr_beanboy_shocked], ["play_sound", gunshot], ["move", self, 1, 1, 1, true], ["talk", ["Rock: What's his problem?"]],["change_flag", global.flags.lvl1.main, "rock_arguement", 1], ["destroy", self], ["fade_in", c_black], ["talk", ["The rock then proceeded to tell me its story and why it approached me."]],["fade_out", c_black], ["talk", ["Rock: Please I'm begging you.", "Rock: It only takes a wallop from anyone weak or strong to kill me.", "Rock: My family migrated underground for that very reason.", "Rock: Please find out where they are, you won't even have to escort me I promise!", "Rock: They were last seen near the Gold Mine", "Rock: Find my family sir."]], ["end"]]
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