class_name DamageComponent extends Node2D #受伤组件

@export var max_damage = 1 #所能承受的最大伤害
@export var current_damage = 0

signal max_damaged_reached #达到最大伤害时的信号

func apply_damage(damage : int) -> void:
	current_damage = clamp(current_damage+damage,0,max_damage) #限定范围
	
	if current_damage == max_damage:
		max_damaged_reached.emit()
