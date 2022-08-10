module Slideable
    # def diagonal_dirs
        
    # end

    # def horizontal_dirs

    # end

    def move_dirs
        #taken from subclasses
    end

    def moves #grow unblocked moves in dir (dx,dy)
        possible_moves = []
        start_pos = self.pos
        current_color = self.color
        move_dirs.each do |(dx, dy)|
            cur_x, cur_y = start_pos
            until cur_x + dx < 0 || cur_y + dy < 0 || cur_x + dx > 7 || cur_y + dy > 7
                new_pos = [cur_x + dx, cur_y + dy]
                row, col = new_pos
                if @board[row][col].nil?
                    possible_moves << new_pos
                else
                    if @board[row][col].color != current_color
                        possible_moves << new_pos
                        break
                    else
                        break
                    end
                end  
                cur_x += dx
                cur_y += dy
            end            
        end
        possible_moves
    end

end

module Steppable
    def moves
        valid_moves = []
    
        current_color = self.color
        cur_x, cur_y = pos
        move_diffs.each do |(dx, dy)|
            new_pos = [cur_x + dx, cur_y + dy]
    
            if new_pos.all? { |coord| coord.between?(0, 7) }
                valid_moves << new_pos
            end
        end
    
        valid_moves.select do |pos| 
            @board[pos[0]][pos[1]].nil? || @board[pos[0]][pos[1]].color != current_color 
        end
    end

    def move_diffs 
        #to be overwritten
    end
end

class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    attr_reader :color, :pos

    def to_s
        "#{Symbol}"
    end

    def empty?(pos)
        @board[pos[0]][pos[1]].nil?
    end

    def valid_moves 
        moves
    end

    def pos=(val)
        @board[pos[0]][pos[1]] = val
    end

    def Symbol
        # self.symbol
    end

    # def move_into_check?(end_pos)
    # end

end