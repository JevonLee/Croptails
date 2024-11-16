class_name DayNightCycleComponent
extends CanvasModulate

#这些export变量，每当在外部检视器改变值时，都会将这个值的改变应用到时间系统那边
@export var initial_day: int = 1:
	set(id): #通过set来控制当前值改变时对应的其他值
		initial_day = id
		DayAndNightCycleManager.initial_day = id
		DayAndNightCycleManager.set_initial_time()

@export var initial_hour: int = 12:
	set(ih):
		initial_hour = ih
		DayAndNightCycleManager.initial_hour = ih
		DayAndNightCycleManager.set_initial_time()

@export var initial_minute: int = 30:
	set(im):
		initial_minute = im
		DayAndNightCycleManager.initial_minute = im
		DayAndNightCycleManager.set_initial_time()

@export var day_night_gradient_texture: GradientTexture1D #自定义的渐变颜色变量，用来控制滤镜

func _ready() -> void:#通过这个节点的检视器，定义时间系统那边的初始值
	DayAndNightCycleManager.initial_day = initial_day
	DayAndNightCycleManager.initial_hour = initial_hour
	DayAndNightCycleManager.initial_minute = initial_minute
	DayAndNightCycleManager.set_initial_time()
	DayAndNightCycleManager.game_time.connect(on_game_time)

func on_game_time(time: float) -> void:
	var sample_value = 0.5 * (sin(time - PI * 0.5) + 1.0) #让滤镜和time时间对应
	color = day_night_gradient_texture.gradient.sample(sample_value) #并且改变当前脚本绑定节点的color值
