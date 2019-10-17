require_relative 'board_case' #We get the board cases to create a good board
require_relative 'player' #On chope les joueurs

class Board

  attr_accessor :grid

  #Initialize the grid with the values of the board cases
  def initialize

    @grid = {"A1" => BoardCase.new("A1") , "A2" => BoardCase.new("A2") , "A3" => BoardCase.new("A3") , "B1" => BoardCase.new("B1") , "B2" => BoardCase.new("B2") , "B3" => BoardCase.new("B3") , "C1" => BoardCase.new("C1") , "C2" => BoardCase.new("C2") , "C3" => BoardCase.new("C3") }

  end

  #Fonction qui permet à un joueur de jouer
  def play (player)

    condition = true

    #On vérifie que la valeur entrée par l'utilisateur est la bonne et que la case est bien vide
    while condition

      #L'utilisateur choisit une case
      print "#{player.name} (#{player.token}) où veux tu jouer? > "
      choice = gets.chomp.upcase

      while !['A1','A2','A3','B1','B2','B3','C1','C2','C3'].include?(choice)
        print "#{player.name} ton choix est non valide, où veux tu jouer? > "
        choice = gets.chomp.upcase
      end
      if !@grid["#{choice}"].is_case_empty?
        puts "Case déjà prise "
      else
        condition = false
      end
    end

    #Ecrire dans le tableau le token du joueur
    @grid["#{choice}"].write_in_case(player.token)
    puts "#{player.name} a joué en #{choice}"

  end


end
