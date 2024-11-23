extends NodeState

@export var character : NonPlayableCharacter
@export var animated_sprite_2d: AnimatedSprite2D 
@export var navigation_agent_2d : NavigationAgent2D
@export var min_speed : float = 5.0
@export var max_speed : float = 10.0

var speed: float

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed) #用于计算避障的安全速度。
	call_deferred("character_setup") #确保场景已完全加载。
	navigation_agent_2d.avoidance_enabled = true
	
func character_setup() -> void:
	await get_tree().physics_frame #等待物理帧结束的信号
	set_movement_target() 

func set_movement_target() -> void:  #设置移动目标      #随机选择一个目标位置（返回RID，导航层级，为false则随机选择一个区块）
	var target_position : Vector2 = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(),navigation_agent_2d.navigation_layers,false)
	navigation_agent_2d.target_position = target_position #设置导航代理的目标位置
	speed = randf_range(min_speed,max_speed)
	

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void: 	#鸡实际的向目标点移动
	if navigation_agent_2d.is_navigation_finished(): #到达目标点后重新设置目标点，并循环步数+1
		character.current_walk_cycle += 1
		set_movement_target()
		return
			
	var target_position = navigation_agent_2d.get_next_path_position() #返回可以移动至的下一个位置
	var target_direction = character.global_position.direction_to(target_position) #到目标点的方向
	var velocity : Vector2 = target_direction * speed  #实际的速度和方向
	if navigation_agent_2d.avoidance_enabled: #避障条件判断
		animated_sprite_2d.flip_h = velocity.x < 0
		navigation_agent_2d.velocity = velocity  # NavigationAgent2D 的 velocity 属性直接控制导航路径上的移动方式，包含了一些导航功能，比如避障和自动路径计算。
	else:
		character.velocity = velocity
		character.move_and_slide() 

func on_safe_velocity_computed(safe_velocity : Vector2)->void: #开启避障选项时，调用这个函数安全移动，这个参数是velocity_computed自带的参数
	animated_sprite_2d.flip_h = safe_velocity.x < 0
	character.velocity = safe_velocity 
	character.move_and_slide() 

func _on_next_transitions() -> void:
	if character.current_walk_cycle == character.walk_cycles: #如果循环次数完成了则转换状态
		character.velocity = Vector2.ZERO
		transition.emit("Idle")


func _on_enter() -> void:
	animated_sprite_2d.play("walk")

func _on_exit() -> void:
	animated_sprite_2d.stop()
