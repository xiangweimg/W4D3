require_relative "piece.rb"

class Bishop < Piece
    include Slideable

    def initialize(color, board, pos)
        super
        @symbol = :bishop
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