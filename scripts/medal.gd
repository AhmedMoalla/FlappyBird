extends Control

enum MedalRank { None, Bronze, Silver, Gold, Platinum }

@export var textures: Dictionary[MedalRank, Texture2D]

func _ready() -> void:
	set_rank(MedalRank.None)


func set_rank_for_score():
	if Global.score >= 40:
		set_rank(MedalRank.Platinum)
	elif Global.score >= 30:
		set_rank(MedalRank.Gold)
	elif Global.score >= 20:
		set_rank(MedalRank.Silver)
	elif Global.score >= 10:
		set_rank(MedalRank.Bronze)


func set_rank(rank: MedalRank):
	if rank == MedalRank.None:
		$AnimationPlayer.play("RESET")
		$TextureRect.texture = null
		$Sparks.visible = false
		return
	$TextureRect.texture = textures[rank]
	$Sparks.visible = true
	$AnimationPlayer.play("display_medal")
