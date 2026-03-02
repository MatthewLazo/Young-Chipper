first_interaction = ["That old buck gon' taste my wrath!", "Don't jump the old guy?", "Ok! Why didn't anybody say so?"]
end_interaction = ["I won't kill him okay? Jeez stop asking."]
function return_text()
{
	
	if (global.spoken_to_evil == true) return end_interaction
	else return first_interaction
}

function dialogue_end(dialogue)
{
	if (dialogue == first_interaction)
	{
		global.spoken_to_evil=true
	}
	else if (dialogue == end_interaction)
	{
		
	}
}