extends CharacterBody2D

@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent

var balloon = preload("res://dialogue/game_dialogue_balloon.tscn")
var is_range:bool

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_enter)
	interactable_component.interactable_deactivated.connect(on_exit)
	interactable_label_component.hide()
	
	GameDialogueManager.give_crop_seeds.connect(on_give_crop_seeds)
	
func on_enter()->void:
	interactable_label_component.show()
	is_range = true
	
func on_exit()->void:
	interactable_label_component.hide()
	is_range = false

func _unhandled_input(event: InputEvent) -> void:
	if is_range:
		if event.is_action_pressed("show_dialogue"):
			var bolloon_instance :BaseGameDialogueBalloon= balloon.instantiate()
			get_tree().root.add_child(bolloon_instance)
			bolloon_instance.start(load("res://dialogue/conversations/guide.dialogue"),"start")#加载对话脚本从start开始
		
func on_give_crop_seeds()->void:
	ToolManager.enable_tool_button(DataTypes.Tools.TillGround)
	ToolManager.enable_tool_button(DataTypes.Tools.WaterCrops)
	ToolManager.enable_tool_button(DataTypes.Tools.PlantCorn)
	ToolManager.enable_tool_button(DataTypes.Tools.PlantTomato)
