class_name SaveLevelDataComponent extends Node

var level_scene_name: String
var save_game_data_path:String = "user://game_data/" #定义的保存文件路径
var save_file_name : String = "save_%s_game_data.tres" #定义文件命名方式
var game_data_resource:SaveGameDataResource #定义level的资源，这里不用export赋值

func _ready() -> void:
	add_to_group("save_level_data_component") #添加到分组，以便save_game_manager能访问
	level_scene_name = get_parent().name #获取父节点名称（场景根节点）
	
func save_node_data() -> void:
	var nodes = get_tree().get_nodes_in_group("save_data_component") #获得save_data_component组的所有节点
	
	game_data_resource = SaveGameDataResource.new() #new一个level级别的资源对象
	
	if nodes != null:#遍历所有save_data_component节点
		for node: SaveDataComponent in nodes:
			if node is SaveDataComponent:
				var save_data_resource: NodeDataResource = node._save_data() #加载资源，然后复制一份
				var save_final_resource = save_data_resource.duplicate()
				game_data_resource.save_data_nodes.append(save_final_resource) #将节点信息添加到这个对象的数组中
				
func save_game() -> void:
	if !DirAccess.dir_exists_absolute(save_game_data_path): #先判断然后创建存档文件夹
		DirAccess.make_dir_absolute(save_game_data_path)
	
	var level_save_file_name: String = save_file_name % level_scene_name #将文件名用格式化字符串赋值进去
	
	save_node_data() #保存所有节点信息
	
	var result: int = ResourceSaver.save(game_data_resource, save_game_data_path + level_save_file_name) 
	#ResourceSaver用于将资源类型保存到文件系统的单例
	print("save result:", result)


func load_game() -> void:
	var level_save_file_name: String = save_file_name % level_scene_name
	var save_game_path: String = save_game_data_path + level_save_file_name
	
	if !FileAccess.file_exists(save_game_path):
		return
	
	game_data_resource = ResourceLoader.load(save_game_path)
	
	if game_data_resource == null:
		return
	
	var root_node: Window = get_tree().root #获得场景树的根node
	
	for resource in game_data_resource.save_data_nodes:
		if resource is Resource:
			if resource is NodeDataResource:
				resource._load_data(root_node)
