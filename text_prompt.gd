class_name TextPrompt

extends Resource

var player_input = "attack"
var display_text: String
@export var potential_args: Array
@export var text_outcomes: Dictionary


func _ready():
	if player_input in potential_args:
		process_input(player_input)

func process_input(text):
	display_text = text_outcomes[text]['display_text']
	print(display_text)
