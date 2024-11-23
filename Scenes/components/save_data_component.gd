class_name SaveDataComponent extends Node

@onready var parent_node : Node2D = get_parent() as Node2D

@export var save_data_resource : Resource #资源容器，调用这个资源类脚本的_save_data保存

func _ready() -> void:
	add_to_group("save_data_component") #在其他场景中作为组件时，自动添加到组中

func _save_data() -> Resource:
	if parent_node == null:
		return null
	
	if save_data_resource == null:
		push_error("save_data_resource:", save_data_resource, parent_node.name)
		return null
	
	save_data_resource._save_data(parent_node) #将这个组件节点的父节点的信息保存到资源
	
	return save_data_resource
