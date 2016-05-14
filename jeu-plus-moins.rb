class Jeu
    
    def initialize(number_min, number_max)
        @number_min = number_min
        @number_max = number_max
        @tentatives = 0
        @tirage = random
    end
    
    def random
        random = rand(@number_min..@number_max)
    end
    
    def try
        puts "Tapez un nombre entre 1 et 100"
        choice = gets.chomp.to_i
        while !choice.between?(@number_min,@number_max)
            choice = try
        end
        return choice
    end
    
    def win?
        tentative = try
        @tentatives += 1
        if tentative < @tirage
            puts "C'est plus"
            win?
        elsif tentative > @tirage
            puts "C'est moins"
            win?
        else
            puts "Trouvé (#{@tentatives} tentatives)"
        end
    end
end

100.times do |tour|
    jeu = Jeu.new(1, 100)
    jeu.win?
end