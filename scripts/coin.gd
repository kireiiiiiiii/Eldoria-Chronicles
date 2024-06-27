extends Area2D

@onready var game_manager = %GameManager;
@onready var anim_player = $AnimationPlayer;

func _on_body_entered(_body):
    game_manager.add_score_point();
    anim_player.play("pick_up");
