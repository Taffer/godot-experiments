extends ColorRect


var label = null


func _ready():
	label = get_node("ColorRect/ColorRect/ExperimentText")
	label.text = ""
	label.grab_focus()


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
