##An additional effect for a TextPrompt to execute.

class_name AdditionalEffect

extends Resource
var target: TextPrompt
@export var target_var: String
@export var modify_value: String

func effect():
	target.set(target_var, modify_value)
