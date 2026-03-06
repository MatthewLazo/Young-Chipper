current_dialogue = []

currently_talking = false

current_text = ""
current_text_index = 0
current_text_line = 0

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