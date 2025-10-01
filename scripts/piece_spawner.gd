extends Node

@onready var board: Board = $"../Board"

var current_tetromino: Shared.TetrominoType

func _ready() -> void:
	current_tetromino = Shared.TetrominoType.values().pick_random()
	board.spawn_tetromino(current_tetromino, false, Vector2(0, 25))
