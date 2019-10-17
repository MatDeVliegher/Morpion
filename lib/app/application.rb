class Application

  def self.start

    puts "WELCOME\n"

    continue_playing = true

    #On lance la partie au moins une fois, et on la relance tant que les utilisateurs veulent continuer

    while continue_playing

      puts "\nNEW Game\n\n"

      new_game = Game.new

      new_game.start


      choice_not_well_typed = true #Choix de continuer ou pas

      #On s'assure que l'utilisateur entre une valeur reconnue
      while choice_not_well_typed
        print "Voulez vous continuer ? [Y] / [N] "
        my_choice = gets.chomp.upcase
        (my_choice == "Y" || my_choice == "N") ? choice_not_well_typed = false : choice_not_well_typed = true
      end

      #On sort du jeu si l'utilisateur veut partir
      if my_choice == "N"
        continue_playing = false
        puts "\n\n------------See You------------"
      end

    end

  end
end
