class Player

  #Un joueur a un nom et choisit par la suite un logo pour jouer
  attr_accessor :name, :token

  def initialize (token)

    print "Nom du player > "
    @name = gets.chomp
    @token = token

  end

  def change_logo(new_token)
    @token = new_token
  end

end
