extends NodeState

@export var player : Player #修改为自定义的Player类
@export var animated_sprite_2d : AnimatedSprite2D
var speed:int = 50
var direction: Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	direction = GameInputEvents.movement_input()

	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	
	if direction != Vector2.ZERO: #行走时将方向变量赋值给player_direction，这样Walk转换到Idle时，Idle里面的player_direction就是行走时的方向
		player.player_direction = direction
	
	player.velocity = direction * speed
	player.move_and_slide()


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle") #使用信号可以使代码直接保持低耦合


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
