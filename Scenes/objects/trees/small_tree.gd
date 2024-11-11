class_name SmallTree extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent #检测受伤的区域的组件
@onready var damage_component: DamageComponent = $DamageComponent #实际掉血的组件

@export var log = preload("res://Scenes/objects/trees/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damaged_reached)

func on_hurt(damage:int) -> void:
	damage_component.apply_damage(damage)
	material.set_shader_parameter("shake_intensity",0.8)
	await get_tree().create_timer(1.0).timeout #await 关键字会暂停代码执行，直到指定的信号触发（这里是 timeout 信号）
	material.set_shader_parameter("shake_intensity",0.0)
	
func on_max_damaged_reached() -> void:
	call_deferred("add_log_scene")#延迟调用
	queue_free()
	
func add_log_scene() -> void:
	var log_instantiate = log.instantiate() as Node2D
	log_instantiate.global_position = global_position
	get_parent().add_child(log_instantiate)
