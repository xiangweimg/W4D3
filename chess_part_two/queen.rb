require_relative "piece.rb"

class Queen < Piece
    include Slideable

    def initialize(color, board, pos)
        super
        @symbol = :queen
    end

    def to_s
        @color == :black ? "♔" : "♚"
    end

    def move_dirs
        [
            [1, 1],
            [1, -1],
            [-1, -1],
            [-1, 1],
            [0, 1],
            [1, 0],
            [0, -1],
            [-1, 0]
        ]  
    end
end