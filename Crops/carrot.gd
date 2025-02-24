
extends Area2D

@export var speed: float = 100.0  # Speed of following
var target: Node2D = null
var following: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame.
func _process(delta: float) -> void:
	if following and target:
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if Input.is_action_just_pressed("interact"):
		target = body
		following = true
