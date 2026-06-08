class_name TextPrompt

extends Resource

@export var potential_args: Array
@export var text_prompt_dict: Dictionary
var display_text: String

func process_input(text):
	display_text = text_prompt_dict[text]['display_text']
	print(display_text)
