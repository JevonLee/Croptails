class_name TileMapLayerDataResource
extends NodeDataResource

@export var tilemap_layer_used_cells: Array[Vector2i] 
@export var terrain_set: int = 0
@export var terrain: int = 3 #这里只需要保存根种的土地


func _save_data(node: Node2D) -> void:
	super._save_data(node)
	
	var tilemap_layer: TileMapLayer = node as TileMapLayer 
	var cells: Array[Vector2i] = tilemap_layer.get_used_cells()#从tilemaplayer节点返回 Vector2i 数组，其中存放的是所有包含图块的单元格的位置
	
	tilemap_layer_used_cells = cells


func _load_data(window: Window) -> void:
	var scene_node = window.get_node_or_null(node_path)
	
	if scene_node != null:
		var tilemap_layer: TileMapLayer = scene_node as TileMapLayer
		tilemap_layer.set_cells_terrain_connect(tilemap_layer_used_cells, terrain_set, terrain, true) #通过之前保存的位置数组再重新绘制地形
