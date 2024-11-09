extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent


func _ready() -> void:
	interactable_component.interactable_activated.connect(_on_interactable_activated)
	interactable_component.interactable_deactivated.connect(_on_interactable_deactivated)
	collision_layer = 1
	
func _on_interactable_activated():
	animated_sprite_2d.play("open_door")
	collision_layer = 2 #因为door在1层，player在2层，可以与1层碰撞，所以改变door的层级（除了1层都可以），player则不会与其碰撞
	
func _on_interactable_deactivated():
	animated_sprite_2d.play("close_door")
	collision_layer = 1
