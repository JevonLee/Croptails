extends NodeState

@export var character : NonPlayableCharacter
@export var animated_sprite_2d: AnimatedSprite2D 
@export var idle_state_time_interval :=5.0 #计时器的作用就是让鸡定时状态转换

@onready var idle_state_timer : Timer = Timer.new() #new一个Timer节点用于计时

var idle_state_timeout : bool = false #判断是否超时

func _ready() -> void:
	idle_state_timer.wait_time = idle_state_time_interval
	idle_state_timer.timeout.connect(on_idle_state_timeout)
	add_child(idle_state_timer)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if idle_state_timeout:
		transition.emit("Walk")


func _on_enter() -> void:
	animated_sprite_2d.play("idle")
	idle_state_timeout = false
	idle_state_timer.start()


func _on_exit() -> void:
	animated_sprite_2d.stop()

func on_idle_state_timeout() -> void:
	idle_state_timeout = true
