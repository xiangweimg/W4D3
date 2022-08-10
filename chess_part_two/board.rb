# require_relative "piece.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "null_piece.rb"
require_relative "pawn.rb"
require_relative "queen.rb"
require_relative "rook.rb"

class Board
    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        (0..7).each do |col|
            @board[1][col] = Pawn.new(:black, @board, [1, col]) #pawns
            @board[6][col] = Pawn.new(:white, @board, [6, col]) #pawns
            case col
            when 0
                @board[0][col] = Rook.new(:black, @board, [0, col])  #rook
                @board[7][col] = Rook.new(:white, @board, [7, col])  #rook
            when 7
                @board[0][col] = Rook.new(:black, @board, [0, col]) #rook
                @board[7][col] = Rook.new(:white, @board, [7, col]) #rook
            when 1 
                @board[0][col] = Knight.new(:black, @board, [0, col]) #knight
                @board[7][col] = Knight.new(:white, @board, [7, col]) #knight
            when 6
                @board[0][col] = Knight.new(:black, @board, [0, col]) #knight
                @board[7][col] = Knight.new(:white, @board, [7, col]) #knight
            when 2 
                @board[0][col] = Bishop.new(:black, @board, [0, col]) #bishop
                @board[7][col] = Bishop.new(:white, @board, [7, col]) #bishop
            when 5
                @board[0][col] = Bishop.new(:black, @board, [0, col]) #bishop
                @board[7][col] = Bishop.new(:white, @board, [7, col]) #bishop
            when 3
                @board[0][col] = Queen.new(:black, @board, [0, col]) #queen
                @board[7][col] = Queen.new(:white, @board, [7, col]) #queen
            when 4
                @board[0][col] = King.new(:black, @board, [0, col]) #king
                @board[7][col] = King.new(:white, @board, [7, col]) #king
            end
        end
    end

    def piece(pos)
        @board[pos[0]][pos[1]]
    end

    def move_piece(start_pos, end_pos)
        raise "There is no piece at this position" if @board[start_pos[0]][start_pos[1]].nil?
        raise "Invalid end position" if end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7

        piece = @board[start_pos[0]][start_pos[1]]
        @board[start_pos[0]][start_pos[1]] = nil
        @board[end_pos[0]][end_pos[1]] = piece
    end


end
