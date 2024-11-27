class_name ToolDataResource extends NodeDataResource

@export var isDisable:bool
@export var a:Control.FocusMode

func _save_data(node: Node2D) -> void:
	super._save_data(node)
	
	
	for tool_button:Button in node.get_children(): #记录这些按钮的状态
		isDisable = tool_button.disabled
		a = tool_button.focus_mode

func _load_data(window: Window) -> void:
	var scene_node = window.get_node_or_null(node_path)
	
	if scene_node != null:
		for tool_button:Button in scene_node.get_children():
			tool_button.disabled = isDisable
			tool_button.focus_mode = a
