extends Area2D


func _on_body_entered(_body:Node2D):
    print("Entered portal");
    get_tree().reload_current_scene();
