extends Node

@export var mouse: Texture2D

func _ready() -> void:
	Input.set_custom_mouse_cursor(mouse,Input.CURSOR_ARROW) #默认光标箭头，其他的可以自己再设置
