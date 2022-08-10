require_relative "piece.rb"

class Pawn < Piece
    def initialize(color, board, pos)
        super
        # @symbol = :pawn
    end

    def to_s
        @color == :black ? "♙" : "♟"
    end

    def at_start_row?
        if self.color == :white
            return true if self.pos[0] == 6
        else
            return true if self.pos[0] == 1
        end
        false
    end

    def start_move
        arr = []
        start_pos = self.pos
        row, col = start_pos
        dx, dy = forward_dir

        forward_one = [row + dx, col + dy]
        forward_two = [row + dx + dx, col + dy + dy]

        if @board[forward_one[0]][forward_one[1]].nil? 
            arr << forward_one
        end
        
        if @board[forward_two[0]][forward_two[1]].nil? && @board[forward_one[0]][forward_one[1]].nil? 
            arr << forward_two
        end
        arr
    end

    def forward_dir
        if self.color == :white 
            return [-1, 0]
        else
            return [1, 0]
        end
    end

    def forward_steps
        start_pos = self.pos
        row, col = start_pos
        dx, dy = forward_dir

        if row + dx >= 0 && row + dx < 8
            if @board[row + dx][col].nil?
                return [row + dx, col]
            else
                return []
            end
        end
    end

    def side_dir
        if self.color == :white 
            return [[-1, -1], [-1, 1]]
        else
            return [[1, -1], [1, 1]]
        end
    end

    def side_attacks
        start_pos = self.pos
        current_color = self.color
        row, col = start_pos
        arr = []
        side_dir.each do |dx, dy|
            if !@board[row + dx][col + dy].nil? && @board[row + dx][col + dy].color != current_color
                arr << [row + dx, col + dy]
            end
        end
        arr
    end

    def moves
        arr = []
        if self.at_start_row?
            arr += start_move if !start_move.nil?
            arr += side_attacks if !side_attacks.nil?
        else
            arr += forward_steps if !forward_steps.nil?
            arr += side_attacks if !side_attacks.nil?
        end
        arr
    end
end 