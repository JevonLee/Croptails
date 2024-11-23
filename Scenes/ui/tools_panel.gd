extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato

func _ready() -> void:
	ToolManager.enable_tool.connect(on_enable_tool)
	tool_tilling.disabled = true
	tool_tilling.focus_mode = Control.FOCUS_NONE #focus_mode的选项
	tool_watering_can.disabled = true
	tool_watering_can.focus_mode = Control.FOCUS_NONE
	tool_corn.disabled = true
	tool_corn.focus_mode = Control.FOCUS_NONE
	tool_tomato.disabled = true
	tool_tomato.focus_mode = Control.FOCUS_NONE
	

func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.AxeWood)


func _on_tool_tilling_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.TillGround)


func _on_tool_watering_can_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.WaterCrops)


func _on_tool_corn_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)


func _on_tool_tomato_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantTomato)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_tilling.release_focus()
		tool_watering_can.release_focus()
		tool_corn.release_focus()
		tool_tomato.release_focus()
		
func on_enable_tool(tool:DataTypes.Tools) -> void:
	if tool == DataTypes.Tools.TillGround:
		tool_tilling.disabled = false
		tool_tilling.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.WaterCrops:
		tool_watering_can.disabled = false
		tool_watering_can.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantCorn:
		tool_corn.disabled = false
		tool_corn.focus_mode = Control.FOCUS_ALL
	elif tool == DataTypes.Tools.PlantTomato:
		tool_tomato.disabled = false
		tool_tomato.focus_mode = Control.FOCUS_ALL
		
