extends ColorRect


const TEXT := [
	'Next is too long:',
	'The quick brown fox jumps over the lazy dog.',
	'Better split.',
	'That text was too long. What about this line?',
	'Oops, so was that.',
	'We need to fix it.'
]

var rich_text = null
var buff = ""
var text_idx := 0


func _ready():
	randomize()
	rich_text = get_node("ColorRect/ColorRect/RichTextLabel")


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	elif Input.is_action_just_released("ui_select"):
		if len(buff) > 0:
			buff += '\n'

		var parts = TEXT[text_idx].split(" ")
		var add_text: PoolStringArray = []
		for word in parts:
			if randi() % 2 == 0:
				word = "[code]{word}[/code]".format({"word": word})

			var colour = Color(rand_range(0.5, 1.0), rand_range(0.5, 1.0), rand_range(0.5, 1.0))
			word = "[color=#{colour}]{word}[/color]".format({"colour": colour.to_html(), "word": word})
			
			add_text.append(word)

		buff += add_text.join(" ")
		rich_text.bbcode_text = buff

		text_idx += 1
		if text_idx >= len(TEXT):
			text_idx = 0
