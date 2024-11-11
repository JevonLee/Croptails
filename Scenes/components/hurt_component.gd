class_name HurtComponent extends Area2D

@export var tool : DataTypes.Tools = DataTypes.Tools.None

signal hurt



func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent #将传进来的区域转为HitComponent类型
	if tool == hit_component.current_tool:
		hurt.emit(hit_component.damage)	
