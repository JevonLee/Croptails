extends SmallTree

@export var apple = preload("res://Scenes/objects/trees/apple.tscn")

func on_max_damaged_reached() -> void:
	call_deferred("add_apple_scene")#延迟调用
	super()

func add_apple_scene() -> void:
	var apple_instantiate = apple.instantiate() as Node2D
	apple_instantiate.global_position = global_position + Vector2(4,8)
	get_parent().add_child(apple_instantiate)
