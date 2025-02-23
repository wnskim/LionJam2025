extends Area2D


@export var interact_label = "none"
@export var interact_type = "none"
@export var interact_value = "none"

func _ready() -> void:
	get_node("Panel").hide()

func _on_body_entered(body: Node2D):
	get_node("Panel").show()


func _on_body_exited(body: Node2D) -> void:
	get_node("Panel").hide()
	
