extends Node

var game_menu_screen = preload("res://Scenes/ui/game_menu_screen.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("game_menu"):
		set_game_menu_screen()

func start_game() ->void:
	SceneManager.load_main_scene_container()
	SceneManager.load_level("Level2")
	SaveGameManager.load_game()
	SaveGameManager.allow_save_game = true

func exit_game() ->void:
	get_tree().quit()

func set_game_menu_screen() -> void:
	var game_menu = game_menu_screen.instantiate()
	get_tree().root.add_child(game_menu)
