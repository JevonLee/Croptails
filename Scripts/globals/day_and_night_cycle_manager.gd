extends Node

const MINUTES_PER_DAY : int  = 24 * 60 #每天的分钟数
const MINUTES_PER_HOUR : int = 60 #每小时分钟数
const GAME_MINUTE_DURATION: float = TAU / MINUTES_PER_DAY # TAU是PI*2 确保时间循环, 游戏中一分钟对应现实的时间

var game_speed:float = 5.0 #时间流速

var initial_day:int = 1
var initial_hour:int = 12
var initial_minute:int = 30

var time:float = 0.0 #跟踪当前累计的游戏时间
var current_minute:int = -1
var current_day:int = 0

signal game_time(time:float) #广播当前时间的信号，用于改变滤镜传递时间
signal time_tick(day:int,hour:int,minute:int) #每分钟变化时触发，传递分、小时、天
signal time_tick_day(day:int) #天数变化时触发，传递天

func _ready() -> void:
	set_initial_time()
	
func _process(delta: float) -> void:
	time += delta * game_speed * GAME_MINUTE_DURATION #通过delta更新时间
	print(time)
	game_time.emit(time) #把当前时间传递出去
	recalculate_time() 

func set_initial_time() -> void: #
	var initial_total_minutes = initial_day * MINUTES_PER_DAY + (initial_hour * MINUTES_PER_HOUR) + initial_minute #初始的游戏中总分钟数
	time = initial_total_minutes * GAME_MINUTE_DURATION
	
func recalculate_time() -> void: #这个函数的目的是从当前的 time 值（累计的虚拟游戏时间）计算出具体的“游戏时间”，包括天数、小时和分钟。
	var total_minutes:int = int(time / GAME_MINUTE_DURATION) #游戏中的虚拟分钟数，它将累计的 time 值除以 GAME_MINUTE_DURATION 来转换成“游戏分钟”单位。
	#
	var day: int = int(total_minutes / MINUTES_PER_DAY) #天数 = 总分钟数/24 * 60
	var current_day_minutes:int = int(total_minutes % MINUTES_PER_DAY) #当前减去 天数 后的总分钟数，上面公式的余数
	#
	var hour: int = int(current_day_minutes / MINUTES_PER_HOUR) #小时数 = 当前总分钟数 / 60
	var minute:int = int(current_day_minutes % MINUTES_PER_HOUR) #每分钟数就是余下的真分钟数
	
	#if 语句确保只有在分钟或天数发生变化时，才发出time_tick或time_tick_day信号，避免不必要的重复调用。
	if current_minute != minute:
		current_minute = minute
		time_tick.emit(day,hour,minute) #发出更新信号
		
	if current_day != day:
		current_day = day
		time_tick_day.emit(day) #上面传递了day，我目前猜测这个day是用于作物种植时传递
