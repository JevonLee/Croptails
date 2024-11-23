class_name NodeDataResource extends Resource

@export var global_position: Vector2
@export var node_path: NodePath
@export var parent_node_path: NodePath

#用于保存节点的位置，路径和父节点路径信息
func _save_data(node: Node2D) -> void: #保存node的global_position和获得node对于场景树的路径，以及父节点路径
	global_position = node.global_position
	node_path = node.get_path()
	
	var parent_node = node.get_parent()
	
	if parent_node != null:
		parent_node_path = parent_node.get_path() #返回该节点相对于 SceneTree.root 的绝对路径。如果该节点不在场景树内部，则该方法失败并返回空的 NodePath。


func _load_data(_window: Window) -> void: #创建窗口的节点
	pass
