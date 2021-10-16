extends ColorRect


const VALUES := [
	"Value 1",
	"Value Two",
	"Three"
]

var index = 0;
var button_label = null


# Called when the node enters the scene tree for the first time.
func _ready():
	button_label = get_node("TextureRect/Label")
	button_label.text = VALUES[index]


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_LeftButton_pressed():
	index -= 1
	if index < 0:
		index = len(VALUES) - 1
	button_label.text = VALUES[index]


func _on_RightButton_pressed():
	index += 1
	if index >= len(VALUES):
		index = 0
	button_label.text = VALUES[index]
