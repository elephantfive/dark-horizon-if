extends Button

@export var prompt: TextPrompt

func _on_pressed():
	prompt.show()
