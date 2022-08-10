require_relative "piece.rb"
require 'singleton'

class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = :_
        @color 
    end

    # def moves
    # end
end