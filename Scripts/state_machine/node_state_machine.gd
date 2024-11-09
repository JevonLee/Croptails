class_name NodeStateMachine extends Node

@export var initial_node_state : NodeState

var node_states : Dictionary = {}
var current_node_state : NodeState
var current_node_state_name : String

func _ready() -> void:
	for child in get_children():
		if child is NodeState:
			node_states[child.name.to_lower()] = child #从FSM的子节点遍历状态，并添加到字典中
			child.transition.connect(transition_to) #连接状态机发送的信号，然后执行transition_to（）函数
	
	if initial_node_state: #进入初始状态，并赋值当前状态
		initial_node_state._on_enter()
		current_node_state = initial_node_state


func _process(delta : float) -> void:
	if current_node_state:
		current_node_state._on_process(delta) #每一帧执行当前状态


func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta) #接收当前状态的输入，并执行对应操作
		current_node_state._on_next_transitions() #调用当前状态节点的过渡转换函数
		#print("current state: ",current_node_state_name)


func transition_to(node_state_name : String) -> void: #状态转换过渡函数
	if node_state_name == current_node_state.name.to_lower():
		return
	
	var new_node_state = node_states.get(node_state_name.to_lower())
	
	if !new_node_state:
		return
	
	if current_node_state:
		current_node_state._on_exit() #调用当前节点的退出函数
	
	new_node_state._on_enter() #调用新节点的进入函数
	
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
