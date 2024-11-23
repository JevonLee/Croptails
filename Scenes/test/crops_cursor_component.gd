class_name CropsCursorComponent extends Node

@export var tilled_soil: TileMapLayer
@export var terrain_set: int = 0 #tilemaplayer中的地形集合
@export var terrain:int = 3 

@onready var player:Player = get_tree().get_first_node_in_group("player") #
@onready var corn = preload("res://Scenes/objects/plants/corn.tscn")
@onready var tomato = preload("res://Scenes/objects/plants/tomato.tscn")

var mouse_position:Vector2 #鼠标位置
var cell_position:Vector2i #tile单元格坐标
var cell_source_id:int
var local_cell_position:Vector2 #单元格中心位置
var distance:float

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_hit"): #ctrl+left
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse()
			remove_crop()
	elif event.is_action_pressed("hit"): #left这里必须设置正确的选择顺序
		if ToolManager.selected_tool == DataTypes.Tools.PlantCorn or ToolManager.selected_tool == DataTypes.Tools.PlantTomato:
			get_cell_under_mouse() #从tilled_soil获得点击的tile的位置信息
			add_crop() #种植tilled_soil土地
			
func get_cell_under_mouse() -> void:
	mouse_position = tilled_soil.get_local_mouse_position() #返回该 CanvasItem 中鼠标的位置
	cell_position = tilled_soil.local_to_map(mouse_position) #返回包含给定 mouse_position 的单元格地图坐标
	cell_source_id = tilled_soil.get_cell_source_id(cell_position) #返回位于坐标的单元格的图块源 ID。如果单元格不存在则返回 -1。
	local_cell_position = tilled_soil.map_to_local(cell_position) #返回位于坐标 coords 的单元格的图块源 ID。如果单元格不存在则返回 -1。
	distance = player.global_position.distance_to(local_cell_position) #玩家到单元格中心的距离
	#print("mouse ",mouse_position," cell ",cell_position," cell_id ",cell_source_id)
	
func add_crop() -> void:
	if distance<20:
		if ToolManager.selected_tool == DataTypes.Tools.PlantCorn:
			var corn_instance = corn.instantiate() as Node2D
			corn_instance.global_position = local_cell_position #添加到单元格中心
			get_parent().find_child("CropsField").add_child(corn_instance) #添加到这个节点的子节点下面
		if ToolManager.selected_tool == DataTypes.Tools.PlantTomato:
			var tomato_instance = tomato.instantiate() as Node2D
			tomato_instance.global_position = local_cell_position #添加到单元格中心
			get_parent().find_child("CropsField").add_child(tomato_instance) #添加到这个节点的子节点下面
				
	
func remove_crop() -> void:
	if distance < 20:
		var crop_nodes = get_parent().find_child("CropsField").get_children()
		
		for i:Node2D in crop_nodes:
			if i.global_position == local_cell_position:
				queue_free()
