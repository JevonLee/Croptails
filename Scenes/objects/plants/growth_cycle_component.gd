class_name GrowthCycleComponent extends Node #管理作物生长的脚本

@export var current_growth_state: DataTypes.GrowthStates = DataTypes.GrowthStates.Germination #作物状态
@export_range(5,365) var days_util_harvest:int = 7 #成熟时间

signal crop_maturity #成熟时的信号
signal crop_harvesting #可收获时的信号

var is_waterd :bool #是否被浇水
var starting_day: int
var current_day: int

func _ready() -> void:
	DayAndNightCycleManager.time_tick_day.connect(on_time_tick_day) #通过时间系统的天数信号来判断天数

func on_time_tick_day(day:int) -> void:
	if is_waterd: #浇水时才变化生长状态
		if starting_day == 0:
			starting_day = day
		growth_states(starting_day,day) #将时间系统里的天数和生长状态结合起来
		harvest_states(starting_day,day)

func growth_states(starting_day : int, current_day : int) -> void:
	if current_growth_state == DataTypes.GrowthStates.Maturity:
		return
	
	var num_states = 5 #生长状态数量
	
	var growth_days_passed = (current_day - starting_day) % num_states #生长状态对应的天数
	var state_index = growth_days_passed % num_states + 1 #状态下标

	current_growth_state = state_index #枚举类型本来就是整形，所以可以这样用下标值替换
	var name = DataTypes.GrowthStates.keys()[current_growth_state] #通过下标得到状态，为了返回整数，这样sprite可以通过整数来调整状态对应的图片
	print("Current growth state: ",name," state index: ",state_index)
	if current_growth_state == DataTypes.GrowthStates.Maturity:
		crop_maturity.emit()


func harvest_states(starting_day : int, current_day : int) -> void:
	if current_growth_state == DataTypes.GrowthStates.Harvesting:
		return
		
	var days_passed = (current_day - starting_day ) % days_util_harvest  #判断是否到达丰收的天数
	
	if days_passed == days_util_harvest - 1: #days_util_harvest是从0开始，所以要-1
		current_growth_state == DataTypes.GrowthStates.Harvesting
		crop_harvesting.emit()
		
func get_current_growth_state() -> DataTypes.GrowthStates :
	return current_growth_state
		
