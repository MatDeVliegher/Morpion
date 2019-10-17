require_relative 'player' #On chope les joueurs
require_relative 'board' #On chope le board
require_relative 'board_case' #On chope les cases du board
require_relative '../views/show'

class Game

  attr_accessor :player1, :player2, :game_board, :show


  def get_new_players

    puts "Premier joueur"
    @player1 = Player.new("X") #Le player 1 joue avec les X
    puts "Vous jouez avec #{@player1.token}"
    puts "\nDeuxième joueur"
    @player2 = Player.new("O") #Le player 2 joue avec les O
    puts "Vous jouez avec les #{@player2.token}"
    @game_board = Board.new
    @show = Show.new(@game_board) #Affichage dans show
    print 'Appuyez sur une touche pour continuer'
    gets.chomp

  end

  #Fonction qui va vérifier si une partie est toujours en cours (on check dans la grille)
  def is_ongoing_game?

    #Dans 8 cas le jeu se termine car terminé
    case

    # On retourne le statut et le nom du vainqueur le cas échéant (s'assurer que les cases sont pleines)
    when @game_board.grid["A1"].inside_case == @game_board.grid["A2"].inside_case && @game_board.grid["A2"].inside_case == @game_board.grid["A3"].inside_case && @game_board.grid["A1"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A1"].inside_case }

    when @game_board.grid["B1"].inside_case == @game_board.grid["B2"].inside_case && @game_board.grid["B2"].inside_case == @game_board.grid["B3"].inside_case && @game_board.grid["B1"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A1"].inside_case }

    when @game_board.grid["C1"].inside_case == @game_board.grid["C2"].inside_case && @game_board.grid["C2"].inside_case == @game_board.grid["C3"].inside_case && @game_board.grid["C1"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A1"].inside_case }

    when @game_board.grid["A1"].inside_case == @game_board.grid["B1"].inside_case && @game_board.grid["B1"].inside_case == @game_board.grid["C1"].inside_case && @game_board.grid["A1"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A1"].inside_case }

    when @game_board.grid["A2"].inside_case == @game_board.grid["B2"].inside_case && @game_board.grid["B2"].inside_case == @game_board.grid["C2"].inside_case && @game_board.grid["A2"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A2"].inside_case }

    when @game_board.grid["A3"].inside_case == @game_board.grid["B3"].inside_case && @game_board.grid["B3"].inside_case == @game_board.grid["C3"].inside_case && @game_board.grid["A3"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A3"].inside_case }

    when @game_board.grid["A1"].inside_case == @game_board.grid["B2"].inside_case && @game_board.grid["B2"].inside_case == @game_board.grid["C3"].inside_case && @game_board.grid["A1"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A1"].inside_case }

    when @game_board.grid["A3"].inside_case == @game_board.grid["B2"].inside_case && @game_board.grid["B2"].inside_case == @game_board.grid["C1"].inside_case && @game_board.grid["A3"].inside_case != " "
      return status = {:over? => true, :winner => @game_board.grid["A3"].inside_case }

    when @game_board.grid["A1"].inside_case != " " && @game_board.grid["A2"].inside_case != " " && @game_board.grid["A3"].inside_case != " " && @game_board.grid["B1"].inside_case != " " && @game_board.grid["B2"].inside_case != " " && @game_board.grid["B3"].inside_case != " " && @game_board.grid["C1"].inside_case != " " && @game_board.grid["C2"].inside_case != " " && @game_board.grid["C3"].inside_case != " "
      return status = {:over? => true, :winner => " "} #si on a un match nul

    else #Si aucun joueur n'a gagné et la partie en cours, on retourne un status false
      return status = {:over? => false, :winner => " "}
    end

  end

  #Fonction qui gère une partie en entier (les 2 joueurs jouent jusqu'à une victoire)
  def start

    #On récupère les joueurs
    get_new_players

    #Tant que la partie n'est pas finie
    while !is_ongoing_game?[:over?]

      system "clear"
      puts "Partie en cours :"
      @show.display

      #Le joueur 1 joue
      @game_board.play(@player1)

      system "clear"
      puts "Partie en cours :"
      @show.display

      break if is_ongoing_game?[:over?] #On sort du jeu si le player 1 gagne

      #le joueur 2 joue
      @game_board.play(@player2)

    end

    #Afficher le gagnant en fonction du résultat
    puts "----FIN de la partie ------\n"
    case
    when is_ongoing_game?[:winner] == "X"
      puts "#{@player1.name} (#{@player1.token}) vous avez gagné"
    when is_ongoing_game?[:winner] == "O"
      puts "#{@player2.name} (#{@player2.token}) vous avez gagné (O)"
    else
      puts "Match nul"
    end

  end

end
