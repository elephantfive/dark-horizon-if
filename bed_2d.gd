extends Button
@onready var bed = $"../Bed"


func _on_pressed():
	bed.show()
