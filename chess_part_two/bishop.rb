require_relative "piece.rb"

class Bishop < Piece
    include Slideable

    def initialize(color, board, pos)
        super
        @symbol = :bishop
    end

    def to_s
        @color == :black ? "♗" : "♝"
    end

    def move_dirs
        [
            [1, 1],
            [1, -1],
            [-1, -1],
            [-1, 1]
        ]  
    end
end