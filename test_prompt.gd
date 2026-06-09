extends Node

@onready var label = $"../Label"
@onready var line_edit = $"../LineEdit"

var args = {
	['attack', 'hit', 'punch', 'stab']:
		{'new_display':'this is the placeholder for attack',
		'new_args': 0},
}

var prev_args = args

var attack_args = {}


func _on_line_edit_text_submitted(new_text):
	for key in args.keys():
		if new_text in key:
			label.text = args[key]['new_display']
			if args[key]['new_args'] != 0:
				args = args[key]['new_args']
			else:
				print('End of the line.')
