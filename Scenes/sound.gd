extends Node

# Reference to the AudioStreamPlayer node
@onready var audio_player = $AudioStreamPlayer2D

func _ready():
	# Play the audio when the scene starts
	audio_player.play()
