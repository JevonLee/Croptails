extends CanvasLayer

@onready var save_game_button : Button = $MarginContainer/VBoxContainer/SaveGameButton

func _ready() -> void:
	save_game_button.disabled = !SaveGameManager.allow_save_game
	save_game_button.focus_mode = SaveGameManager.allow_save_game if Control.FOCUS_ALL else Control.FOCUS_NONE #有点像三目运算符的变体

func _on_start_game_button_pressed() -> void:
	GameManager.start_game()
	queue_free()


func _on_save_game_button_pressed() -> void:
	SaveGameManager.save_game()


func _on_exit_game_button_pressed() -> void:
	GameManager.exit_game()
