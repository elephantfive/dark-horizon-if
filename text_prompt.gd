class_name TextPrompt

extends Node

@onready var line_edit = $LineEdit
@onready var label = $Label

var display_text: String
var args = {}
var prev_args = args

func _on_line_edit_text_submitted(new_text):
	for key in args.keys():
		if new_text in key:
			label.text = args[key]['new_display']
			if args[key]['new_args'] != 0:
				args = args[key]['new_args']
			else:
				print('End of the line.')


func update_label():
	label.text = display_text
