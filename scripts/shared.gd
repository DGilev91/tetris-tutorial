extends Node

enum TetrominoType { I, O, T, J, L, S, Z }

var cells: Dictionary[TetrominoType, Array] = {
	TetrominoType.I: [Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0), Vector2(2, 0)],
	TetrominoType.O: [Vector2(0, 0), Vector2(1, 0), Vector2(0, 1), Vector2(1, 1)],
	TetrominoType.T: [Vector2(0, 1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
	TetrominoType.J: [Vector2(-1, 1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
	TetrominoType.L: [Vector2(1, 1), Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0)],
	TetrominoType.S: [Vector2(0, 1), Vector2(1, 1), Vector2(-1, 0), Vector2(0, 0)],
	TetrominoType.Z: [Vector2(-1, 1), Vector2(0, 1), Vector2(0, 0), Vector2(1, 0)],
}
var wall_kicks_i: Array = [
	[Vector2(0,0), Vector2(-2,0), Vector2(1,0), Vector2(-2,-1), Vector2(1,2)],
	[Vector2(0,0), Vector2(2,0), Vector2(-1, 0), Vector2(2,1), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(-1, 0), Vector2(2,0), Vector2(-1,2), Vector2(2, -1)],
	[Vector2(0,0), Vector2(1,0), Vector2(-2, 0), Vector2(1, -2), Vector2(-2, 1)],
	[Vector2(0,0), Vector2(2,0), Vector2(-1, 0), Vector2(2,1), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(-2,0), Vector2(1, 0), Vector2(-2, -1), Vector2(1, 2)],
	[Vector2(0,0), Vector2(1,0), Vector2(-2,0), Vector2(1, -2), Vector2(-2,1)],
	[Vector2(0,0), Vector2(-1, 0), Vector2(2, 0), Vector2(-1,2), Vector2(2, -1)]
]

var wall_kicks_jlostz: Array = [
	[Vector2(0,0), Vector2(-1,0), Vector2(-1,1), Vector2(0,-2), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(1,0), Vector2(1, -1), Vector2(0,2), Vector2(1, 2)],
	[Vector2(0,0), Vector2(1, 0), Vector2(1,-1), Vector2(0,2), Vector2(1, 2)],
	[Vector2(0,0), Vector2(-1,0), Vector2(-1, 1), Vector2(0, -2), Vector2(-1, -2)],
	[Vector2(0,0), Vector2(1,0), Vector2(1, 1), Vector2(0,-2), Vector2(1, -2)],
	[Vector2(0,0), Vector2(-1,0), Vector2(-1, -1), Vector2(0, 2), Vector2(-1, 2)],
	[Vector2(0,0), Vector2(-1,0), Vector2(-1,-1), Vector2(0, 2), Vector2(-1, 2)],
	[Vector2(0,0), Vector2(1, 0), Vector2(1, 1), Vector2(0,-2), Vector2(1, -2)]
]

var data = {
	TetrominoType.I: preload("res://Resources/i_piece_data.tres"),
	TetrominoType.J: preload("res://Resources/j_piece_data.tres"),
	TetrominoType.L: preload("res://Resources/l_piece_data.tres"),
	TetrominoType.O: preload("res://Resources/o_piece_data.tres"),
	TetrominoType.S: preload("res://Resources/s_piece_data.tres"),
	TetrominoType.T: preload("res://Resources/t_piece_data.tres"),
	TetrominoType.Z: preload("res://Resources/z_piece_data.tres")
}

var clockwise_rotation_matrix: Array = [Vector2(0, -1), Vector2(1, 0)]
var counter_clockwise_rotation_matrix: Array = [Vector2(0,1), Vector2(-1, 0)]
