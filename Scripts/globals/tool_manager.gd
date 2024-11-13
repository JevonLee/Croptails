extends Node

var selected_tool : DataTypes.Tools = DataTypes.Tools.None #选择的工具变量

signal tool_selected(tool:DataTypes.Tools) #工具选择信号

func select_tool(tool:DataTypes.Tools) -> void: #选择工具的函数，通过参数将工具传递
	tool_selected.emit(tool)
	selected_tool = tool
