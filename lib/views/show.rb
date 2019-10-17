require_relative '../app/board'
require_relative '../app/board_case'

class Show

  attr_accessor :board

  #Initialiser le show avec un board
  def initialize(board)
    @board = board
  end

  #Fonction qui sert à afficher la partie
  def display

    list = []
    @board.grid.each{ |key,value|  list.push(value.inside_case)}
    # Mise en forme du tableau de jeu
    puts "   1 2 3\n   - - -\nA |%s|%s|%s|\nB |%s|%s|%s|\nC |%s|%s|%s|\n   - - -\n" % list

  end
end

=begin
def to_s
  list = []
  @board.each{ |caseboard|  list.push(caseboard.case_value)}
  # Mise en forme du tableau de jeu
  "   1 2 3\n   - - -\nA |%s|%s|%s|\nB |%s|%s|%s|\nC |%s|%s|%s|\n   - - -\n" % list
end
=end
