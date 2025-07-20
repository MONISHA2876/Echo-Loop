extends Label

var full_text = "Ren (Resistance Leader): Our intel suggests a critical weakness in the CorpSec network.\n One breach, one moment of vulnerability—that's all we need to strike back."
var word_delay = 0.3  # Time in seconds between each word

func _ready():
	show_narration()

func show_narration():
	text = ""  # Start with an empty text
	var words = full_text.split(" ")  # Split text into words
	for word in words:
		text += word + " "  # Append each word with space
		await get_tree().create_timer(word_delay).timeout
