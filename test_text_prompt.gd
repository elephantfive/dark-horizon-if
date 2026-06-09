extends TextPrompt

func _ready():
	display_text = "Yo!"
	update_label()
	
	args = {
		['attack', 'fight', 'hit', 'punch']:
			{'new_display':'placeholder',
			'new_args':0}
	}
