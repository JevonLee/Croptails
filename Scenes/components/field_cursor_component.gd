class_name FieldCursorComponent extends Node

@export var grass: TileMapLayer
@export var tilled_soil: TileMapLayer
@export var terrain_set: int = 0 #tilemaplayer中的地形集合
@export var terrain:int = 3 #我们绘制的泥土层的索引下标，在组件代码中我们选择不同的下标，就可以设置不同的tile在地图上

var player:Player  #@onready是在node准备好时赋值，当我们设置开始菜单为主场景时，应该是场景树加载完成时赋值

var mouse_position:Vector2 #鼠标位置
var cell_position:Vector2i #tile单元格坐标
var cell_source_id:int #用于判断单元格下方是否有tile，-1则是没有
var local_cell_position:Vector2 #单元格中心位置
var distance:float

func _ready() -> void:
	await get_tree().physics_frame #
	player = get_tree().get_first_node_in_group("player") #这里采用从组中获得玩家，是因为后期制作主场景时，玩家和这个节点不在同一个场景下

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_hit"): #ctrl+left
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse()
			remove_tilled_soil_cell()
	elif event.is_action_pressed("hit"): #left这里必须设置正确的选择顺序
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse() #从grass获得点击的tile的位置信息
			add_tilled_soil_cell() #种植tilled_soil土地
			
func get_cell_under_mouse() -> void:
	mouse_position = grass.get_local_mouse_position() #返回该 CanvasItem 中鼠标的位置
	cell_position = grass.local_to_map(mouse_position) #返回包含给定 mouse_position 的单元格地图坐标
	cell_source_id = grass.get_cell_source_id(cell_position) #返回位于坐标的单元格的图块源 ID。如果单元格不存在则返回 -1。
	local_cell_position = grass.map_to_local(cell_position) #返回位于坐标 coords 的单元格的图块源 ID。如果单元格不存在则返回 -1。
	distance = player.global_position.distance_to(local_cell_position) #玩家到单元格中心的距离
	print("mouse ",mouse_position," cell ",cell_position," cell_id ",cell_source_id)
	
func add_tilled_soil_cell()->void:
	if distance<=20 && cell_source_id != -1: #
		tilled_soil.set_cells_terrain_connect([cell_position],terrain_set,terrain,true) #更新cell_position数组的tile为terrain_set集合中的terrain地形，并忽略空地形，这个方法需要设置正确的地形过度
		
func remove_tilled_soil_cell()->void:
	if distance<=20 && cell_source_id != -1:
		tilled_soil.set_cells_terrain_connect([cell_position],terrain_set,0,true)  #-1为空，相当于那个位置的tile置为空，而不是重新设置grass地形，那样很奇怪
