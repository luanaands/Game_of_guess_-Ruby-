def welcome
    puts "\n\n"
    puts "Welcome to the game of guess"
    puts "what's your name?"
    name = gets.strip
    puts "\n\n"
    puts "Lets the game begin for you, #{name}"
end 

def draw_secret_number(difficulty)
    case difficulty
    when 1 
        maximum = 30
    when 2 
        maximum = 60
    when 3 
        maximum = 100
    when 4 
        maximum = 150
    else 
        maximum = 200
    end
    puts "Choose a number of 0 the #{maximum}:"
    puts "We're giving away a secret number ..What's it?"
    drawn = rand(maximum) 
    drawn
end 
def ask_a_number(try, number_try, shots)
    puts "\n"
    puts "Shots up to now: #{shots}"
    puts "Try: #{try} of #{number_try}" 
    shot = gets.strip
    shot.to_i
end 
def check_number(secret_number, shot)
    hit = numero_secreto == shot 
    if  hit
        puts "Hit!"
        return true
    end
    puts"Missed!"
    bigger = secret_number > shot 
    if bigger
        puts "The number is bigger"
    else
        puts "The number is smaller"
    end
    false
end 
def get_difficulty
    puts "What difficulty do you want? (1 Easy, 5 Hard)"
    value = gets.strip
    difficulty = value.to_i
end 
def no_want_play_game 
    puts "Do you want to play game again? (S/N)"
    no_want_play_game = gets.strip
    no_want_play_game.upcase == "N"
end 

def play_game(difficulty)
    secret_number = draw_secret_number difficulty
    shots = []
    points = 1000
    number_try = 5

    for try in 1..number_try
        shot = ask_a_number(try,number_try,shots)
        shots << shot
        points_to_lose = (shot - secret_number) /2.0
        points -= points_to_lose.abs
        if check_number(secret_number, shot)
            break
        end
        puts "\n"
    end
end 

name = welcome
difficulty = get_difficultyt

loop do 
    play_game difficulty
    if  no_want_play_game
        break
    end
end 