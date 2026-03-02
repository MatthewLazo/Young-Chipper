beginning_text = ["Hey you wouldn't mind helping a poor old folk out right?", "A guy over there is planning to do harm against me.", "Go speak to him would ya?"]
end_text = ["Thank you partner.", "I'll never forget this."]

function return_text()
{
	
	if (global.spoken_to_evil == true) return end_text
	else return beginning_text
}

function dialogue_end(dialogue)
{
	if (dialogue == beginning_text)
	{
		
	}
	else if (dialogue == end_text)
	{
		
	}
}