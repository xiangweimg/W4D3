require_relative "piece.rb"

class Knight < Piece
    include Steppable

    def initialize(color, board, pos)
        super
        @symbol = :knight
    end

    def to_s
        @color == :black ? "♘" : "♞"
    end

    def move_diffs
        [
            [-2, -1],
            [-2,  1],
            [-1, -2],
            [-1,  2],
            [ 1, -2],
            [ 1,  2],
            [ 2, -1],
            [ 2,  1]
        ]
    end
end