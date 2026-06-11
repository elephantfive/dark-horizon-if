class_name TextPrompt

extends Control


@onready var line_edit = %LineEdit
@onready var label = %Label
@onready var close_button = %CloseButton

@export var args: Array[Argument]
@export var default_text: String
@export var whatever: Resource
var display_text: String
var default_args: Array[Argument]

func _ready():
	read_text(default_text)
	update_label()
	default_args = args
	
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
			args = []
			line_edit.hide()
			close_button.show()
			
		if selected_arg.additional_effect != null:
			selected_arg.additional_effect.target = self
			selected_arg.additional_effect.effect()
			
	elif valid_args > 1:
		display_text = "That is too complicated."
		
	else:
		display_text = "You can't do that right now."
		
	update_label()

func read_text(file):
	var text = FileAccess.open(file, FileAccess.READ)
	var content = text.get_as_text()
	display_text = content.replace("\n", " ").replace("  ", "\n")

func update_label():
	label.text = display_text


func _on_close_button_pressed():
	args = default_args
	line_edit.show()
	close_button.hide()
	read_text(default_text)
	update_label()
	self.hide()
