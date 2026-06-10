class_name TextPrompt

extends Control


@onready var line_edit = %LineEdit
@onready var label = %Label
@onready var close_button = %CloseButton

@export var args: Array[Argument]
@export var default_text: String
var display_text: String

func _ready():
	display_text = default_text
	update_label()
	
func _on_line_edit_text_submitted(new_text):
	line_edit.clear()
	for arg in args:
		print(arg.valid_arguments)
		if new_text in arg.valid_arguments:
			label.text = read_text(arg.response_text)
			if arg.new_arguments.size() > 0:
				args = arg.new_arguments
			elif arg.end_conversation:
				close_button.show()

func read_text(file):
	var text = FileAccess.open(file, FileAccess.READ)
	var content = text.get_as_text()
	return content

func update_label():
	label.text = display_text


func _on_close_button_pressed():
	close_button.hide()
	display_text = default_text
	update_label()
	self.hide()
