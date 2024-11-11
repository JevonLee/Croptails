class_name NonPlayableCharacter extends CharacterBody2D

@export var min_walk_cycle : int = 2
@export var max_walk_cycle : int = 6

var walk_cycles : int #连续选择目标并移动的次数
var current_walk_cycle : int #当前次数，累加到walk_cycles时，转换状态Idle
