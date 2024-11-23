extends Node

signal give_crop_seeds
signal feed_the_animals

func action_give_crop_seeds() -> void:
	give_crop_seeds.emit()

func action_feed_animals() -> void:
	feed_the_animals.emit()
