extends Timer

@export var audio:AudioStreamPlayer2D


func _on_timeout() -> void:
	audio.play()
