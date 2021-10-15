extends ColorRect


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_Button1_pressed():
	print("Button 1 pressed")


func _on_Button2_pressed():
	print("Button TWO pressed")
