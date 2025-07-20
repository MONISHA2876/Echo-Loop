extends Node

# Reference to the AudioStreamPlayer node
@onready var Audio = $AudioStreamPlayer2D


func _ready():
	# Play the audio when the scene starts
	Audio.play()
