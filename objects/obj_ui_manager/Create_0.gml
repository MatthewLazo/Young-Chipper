current_dialogue = []

currently_talking = false

current_text = ""
current_text_index = 0
current_text_line = 0

enum fade_state {
	fade_in,
	idle,
	fade_out
}

state = fade_state.fade_out

fade_alpha = 1
fade_color = c_black
fade_speed = 0.05

function fade_in(color, speed_)
{
	fade_alpha = 0
	fade_color=color
	fade_speed=speed_
	state =fade_state.fade_in
}
function fade_out(color, speed_)
{
	fade_alpha = 1
	fade_color=color
	fade_speed=speed_
	state =fade_state.fade_out
}

function start_dialogue(with_)
{
	if (array_length(with_) > 0)
	{
		if (currently_talking)
		{
			if (current_text_line < array_length(current_dialogue) - 1)
			{
				current_text_line++;
				current_text=current_dialogue[current_text_line]
				current_text_index=0;
			}
			else
			{
				current_dialogue=[]
				currently_talking=false
				current_text_index=0
			}
		}
		else
			{
			
			current_dialogue=with_
		
			currently_talking=true
			current_text_line=0
			current_text_index=0
		
			current_text=current_dialogue[0]
			}
	}
}

function continue_dialogue()
{
	if (current_text_line < array_length(current_dialogue) - 1)
		{
			current_text_line++;
			current_text=current_dialogue[current_text_line]
			current_text_index=0;
		}
		else
		{
			current_dialogue=[]
			currently_talking=false
			current_text_index=0
		}
}