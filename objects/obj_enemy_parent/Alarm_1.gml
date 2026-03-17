

image_blend=c_white
	
var random_state = choose(enem_state.running, enem_state.shooting)
	
state = random_state
if (state == enem_state.running) {
	alarm[3] = 300
	begin_sprint() 
	return
}
else alarm[1] = state_time



