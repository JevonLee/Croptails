extends Panel

@onready var animated_sprited_2d:AnimatedSprite2D = $Emote/AnimatedSprite2D
@onready var emote_idle_timer:Timer = $EmoteIdleTimer

var idle_emotes:Array = ["emote_1_idle","emote_2_smile","emote_3_ear_wave","emote_4_blink"]

func _ready() -> void:
	animated_sprited_2d.play("emote_1_idle")
	
func play_emotes(animation:String) ->void:
	animated_sprited_2d.play(animation)

func _on_emote_idle_timer_timeout() -> void:
	var index = randi_range(0,3)
	var emote = idle_emotes[index]
	print(emote)
	play_emotes(emote)
