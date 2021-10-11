extends ColorRect


const TEXT := [
	'Next is too long:',
	'The quick brown fox jumps over the lazy dog.',
	'Better split.',
	'That text was too long. What about this line?',
	'Oops, so was that.',
	'We need to fix it.'
]

var text_idx := 0

var buff := ""

var label = null


func _ready():
	label = get_node("NinePatchRect/Text")
	label.text = ""


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	elif Input.is_action_just_released("ui_select"):
		if len(buff) > 0:
			buff += '\n'
		buff += TEXT[text_idx]
		label.text = buff

		if label.get_line_count() > label.get_visible_line_count():
			label.lines_skipped = label.get_line_count() - label.get_visible_line_count()

		text_idx += 1
		if text_idx >= len(TEXT):
			text_idx = 0
