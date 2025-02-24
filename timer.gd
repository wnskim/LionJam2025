extends RichTextLabel

var s = 0
var m = 12

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if s < 0 :
		m -= 1
		s = 59
	
	set_text(str(m)+"H "+str(s)+"M ")

	pass

func _on_ms_timeout() :
	s -= 1
	
	pass
