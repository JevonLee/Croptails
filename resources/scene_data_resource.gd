class_name SceneDataResource extends NodeDataResource

@export var node_name:String
@export var scene_file_path:String #tscn文件路径

#除了继承父类的保存节点信息的功能之外，还
func _save_data(node:Node2D) -> void: #保存node名称，node场景的文件路径
	super._save_data(node)
	
	node_name = node.name 
	scene_file_path = node.scene_file_path #前面是自定义变量，后面是原始场景的文件路径
	
#获取父节点，然后获取场景文件并实例化为节点，恢复场景树
func _load_data(window:Window) -> void:
	var parent_node:Node2D
	var scene_node:Node2D
	
	if parent_node_path != null:
		parent_node = window.get_node_or_null(parent_node_path) #从窗口中通过parent_node_path获取节点
		
	if node_path != null:
		var scene_file_resource: Resource = load(scene_file_path) #从场景路径加载场景资源并实例化为节点
		scene_node = scene_file_resource.instantiate() as Node2D
		
	if parent_node != null and scene_node != null:
		scene_node.global_position = global_position
		parent_node.add_child(scene_node) #实例化场景到目标场景中去
