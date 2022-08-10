require_relative "piece.rb"

class Rook < Piece
    include Slideable

    def initialize(color, board, pos)
        super
        @symbol = :rook
    end

    def move_dirs
        [
            [0, 1],
            [1, 0],
            [0, -1],
            [-1, 0]
        ]   
    end
end