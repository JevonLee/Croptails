extends Node

var allow_save_game: bool

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("save_game"):
		save_game()


func save_game() -> void:
	var save_level_data_component: SaveLevelDataComponent = get_tree().get_first_node_in_group("save_level_data_component")
	#定义一个SaveLevelDataComponent变量，这个组件节点从分组中得到
	if save_level_data_component != null:
		save_level_data_component.save_game()#然后调用这个组件脚本的保存游戏


func load_game() -> void:
	await get_tree().process_frame #等待场景树加载完毕
	
	var save_level_data_component: SaveLevelDataComponent = get_tree().get_first_node_in_group("save_level_data_component")
	
	if save_level_data_component != null:
		save_level_data_component.load_game()
