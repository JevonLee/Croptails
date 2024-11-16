extends Node

var inventory : Dictionary = Dictionary() #这里是构造函数，仅仅是更直观表示类型，{}初始化也是一样的

signal inventory_changed

func add_collectable(collectable_name : String) -> void:
	inventory.get_or_add(collectable_name) #将物品添加到字典里，如果key不存在会创建新的
	
	#更新字典key的值
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1
		
	inventory_changed.emit()
