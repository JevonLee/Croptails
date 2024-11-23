extends Node2D

var corn_harvest_scene = preload("res://Scenes/objects/plants/corn_harvest.tscn") #成熟的场景

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var watering_particles: GPUParticles2D = $WateringParticles #浇水时粒子
@onready var flowering_particles: GPUParticles2D = $FloweringParticles #开花时粒子
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var growth_cycle_component: GrowthCycleComponent = $GrowthCycleComponent

var growth_state : DataTypes.GrowthStates = DataTypes.GrowthStates.Seed

func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	
	hurt_component.hurt.connect(on_hurt) #检测浇水
	growth_cycle_component.crop_maturity.connect(on_crop_maturity) #成熟时转换场景
	growth_cycle_component.crop_harvesting.connect(on_crop_harvesting)

func _process(delta: float) -> void:
	growth_state = growth_cycle_component.get_current_growth_state()
	sprite_2d.frame = growth_state
	
	if growth_state == DataTypes.GrowthStates.Maturity:
		flowering_particles.emitting = true

func on_hurt(damage:int)->void:
	if !growth_cycle_component.is_waterd: #浇水作物时触发粒子效果
		watering_particles.emitting = true
		await get_tree().create_timer(5.0).timeout
		watering_particles.emitting = false
		growth_cycle_component.is_waterd = true
		
func on_crop_maturity() -> void:
	flowering_particles.emitting = true

func on_crop_harvesting() -> void:
	var corn_harvest = corn_harvest_scene.instantiate() as Node2D
	corn_harvest.global_position = global_position
	get_parent().add_child(corn_harvest)
	queue_free()
