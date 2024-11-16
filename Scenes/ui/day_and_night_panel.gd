extends Control

@onready var day_label: Label = $DayPanel/DayLabel
@onready var time_label: Label = $TimePanel/TimeLabel

@export var normal_speed:int = 5
@export var fast_speed:int = 100
@export var cheetah_speed:int = 200

func _ready() -> void:
	DayAndNightCycleManager.time_tick.connect(on_time_tick) #接收每分钟变化的信号，然后更新到面板
	
func on_time_tick(day:int,hour:int,minute:int) -> void:
	day_label.text = "DAY "+str(day)
	time_label.text = "%02d:%02d" % [hour,minute]


func _on_normal_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = normal_speed


func _on_fast_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = fast_speed


func _on_cheetah_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = cheetah_speed
