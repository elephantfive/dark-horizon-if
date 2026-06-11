class_name TextPrompt

extends Control


@onready var line_edit = %LineEdit
@onready var label = %Label
@onready var close_button = %CloseButton

@export var args: Array[Argument]
@export var default_text: String
var display_text: String

func _ready():
	read_text(default_text)
	update_label()
	
func _on_line_edit_text_submitted(new_text):
	var valid_args: int = 0
	var selected_arg: Argument
	line_edit.clear()
	for arg in args:
		for valid_arg in arg.valid_arguments:
			if valid_arg in new_text:
				valid_args += 1
				selected_arg = arg
	if valid_args == 1:
		read_text(selected_arg.response_text)
		if selected_arg.new_arguments.size() > 0:
			args = selected_arg.new_arguments
		elif selected_arg.end_conversation:
			close_button.show()
	elif valid_args > 1:
		display_text = "That is too complicated."
	else:
		display_text = "You can't do that here."
	print(str(valid_args))
	update_label()

func read_text(file):
	var text = FileAccess.open(file, FileAccess.READ)
	var content = text.get_as_text()
	display_text = content

func update_label():
	label.text = display_text


func _on_close_button_pressed():
	close_button.hide()
	display_text = default_text
	update_label()
	self.hide()
