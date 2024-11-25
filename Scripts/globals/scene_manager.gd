extends Node

var main_scene_path :String = "res://Scenes/main_scene.tscn"
var main_scene_level_root:String = "/root/MainScene"
var main_scene_level_root_path : String = "/root/MainScene/GameRoot/LevelRoot"

var level_scenes:Dictionary = {#下面的load_level可以通过level参数获得场景文件
	"Level2" : "res://Scenes/levels/level_2.tscn"
}

func load_main_scene_container() -> void:
	if get_tree().root.has_node(main_scene_level_root):  #防止主场景被重复创建
		return
	
	var node:Node = load(main_scene_path).instantiate()
	
	if node != null:
		get_tree().root.add_child(node) #从场景树中添加主场景
		
func load_level(level:String) -> void: #实现动态添加场景level
	var scene_path:String = level_scenes.get(level)
	
	if scene_path ==null:
		return
	
	var level_scene:Node = load(scene_path).instantiate() #实例化关卡场景
	var level_root:Node = get_node(main_scene_level_root_path) #获得管理Level关卡的根节点

	if level_root !=null:
		var nodes = level_root.get_children() #然后遍历所有levelroot子节点，将level清空
		
		if nodes!=null:
			for node: Node in nodes:
				node.queue_free() #释放所有level关卡节点
		await get_tree().physics_frame #等待旧节点释放完毕才添加动态场景，让存档时获取名称在添加新场景之前
	
	level_root.add_child(level_scene) #然后将实例化的场景添加到levelroot
