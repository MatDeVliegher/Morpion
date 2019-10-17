require_relative 'player' #On chope les joueurs

class BoardCase

  #Une case est définie par sa position
  attr_accessor :case_position, :inside_case

  def initialize(case_position)
    @case_position = case_position
    @inside_case = " "
  end

  #On check si la case est vide
  def is_case_empty?
    return @inside_case == " "? true : false
  end

  #Fonction qui permet d'écrire dans une classe pour pas faire n'importe quoi
  def write_in_case(player_token)

    @inside_case = player_token

  end

end
