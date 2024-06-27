extends Node

var current_score = 0;

func add_score_point() :
	current_score += 1;
	print("Current score: " + str(current_score));

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
