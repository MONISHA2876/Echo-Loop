extends Label

var full_text = "In the sprawling megacity of Neo-Zenith, information is the most controlled substance. Corporations don't just own the streets—\nthey own every pixel of your existence."
var word_delay = 0.3  # Time in seconds between each word
var next_scene_path = "res://Scenes/naration2.tscn"
func _ready():
	show_narration()

func show_narration():
	text = ""  # Start with an empty text
	var words = full_text.split(" ")  # Split text into words
	for word in words:
		text += word + " "  # Append each word with space
		await get_tree().create_timer(word_delay).timeout  # Wait before next word
	await get_tree().create_timer(1.5).timeout  # Wait before scene change
	get_tree().change_scene_to_file(next_scene_path)  # Load the next scene
