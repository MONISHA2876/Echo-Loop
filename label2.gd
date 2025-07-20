extends Label

var full_text = "Kai: They said Zennith was just a myth. A ghost story told by hackers in underground networks. \nBut I found the truth hidden in the darkest corners of the corporate mainframe."
var word_delay = 0.3  # Delay per word
var next_scene_path = "res://Scenes/game.tscn"  # Replace with your scene path

func _ready():
	show_narration()

func show_narration():
	text = ""  # Start with an empty text
	var words = full_text.split(" ")  # Split text into words

	for word in words:
		text += word + " "  
		await get_tree().create_timer(word_delay).timeout

	await get_tree().create_timer(1.5).timeout  # Wait before scene change
	get_tree().change_scene_to_file(next_scene_path)  # Load the next scene
