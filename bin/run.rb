require_relative '../config/environment'
require_relative '../app/models/item.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/wardrobe.rb'





def kinds_for_everyone(type)
    found = Item.all.where(kind: type)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 

def colors_for_everyone(col)
    found = Item.all.where(color: col)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 
    

def seasons_for_everyone(seas)
   found = Item.all.where(season: seas)
   found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 

def date_for_everyone(date)
    found = Item.all.where(date)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 



def deciding_filters 
    answer = CLI::UI::Prompt.ask("choose how you would like to search through everyone's wardrobes") do |handler|
        handler.option('type')  { |selection| selection }
        handler.option('color')  { |selection| selection }
        handler.option('season')  { |selection| selection }
        handler.option('purchased in the last year')  { |selection| selection }
    end 

    if answer == "type"
       
        sec_answer = CLI::UI::Prompt.ask("choose the type of clothing you would like to search through") do |handler|
        handler.option('top')  { |selection| selection }
        handler.option('bottom')  { |selection| selection }
        handler.option('shoes')  { |selection| selection }
    end 

        if sec_answer == "top"
            kinds_for_everyone("top")
        elsif sec_answer == "bottom"
            kinds_for_everyone('bottom')
        elsif sec_answer == "shoes"
            kinds_for_everyone('shoes')
        end 
            
    elsif answer == "color"
        
        sec_answer = CLI::UI::Prompt.ask("choose the color of clothing you would like to search through") do |handler|
        handler.option('red')  { |selection| selection }
        handler.option('yellow')  { |selection| selection }
        handler.option('blue')  { |selection| selection }
        handler.option('green')  { |selection| selection }
        handler.option('black')  { |selection| selection }
        handler.option('orange')  { |selection| selection }
        handler.option('purple')  { |selection| selection }
        handler.option('white')  { |selection| selection }
    end 

        if sec_answer == "red"
            colors_for_everyone("red")
        elsif sec_answer == "yellow"
            colors_for_everyone("yellow")
        elsif sec_answer == "blue"
            colors_for_everyone("blue")
        elsif sec_answer == "green"
            colors_for_everyone("green")
        elsif sec_answer == "black"
            colors_for_everyone("black")
        elsif sec_answer == "orange"
            colors_for_everyone("orange")
        elsif sec_answer == "purple"
            colors_for_everyone("purple")
        elsif sec_answer == "white"
            colors_for_everyone("white")
        end 

    elsif answer == 'season'

        sec_answer = CLI::UI::Prompt.ask("choose the season of clothing you would like to search through") do |handler|
        handler.option('winter')  { |selection| selection }
        handler.option('summer')  { |selection| selection }
        end 

        if sec_answer == "winter"
            seasons_for_everyone("winter")
        elsif sec_answer == "summer"
            seasons_for_everyone("summer")
        end 

    elsif answer == "purchased in the last year"
            date_for_everyone("date > 2018")
    end 
end 

#-------------------------------------------------------------------------

def kinds_for_self(user, type, ward)
    binding.pry
    found = user.ward.items.where(kind: type)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 

def colors_for_self(user, col, ward)
    found = user.ward.items.where(color: col)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 
    

def seasons_for_self(user, seas, ward)
   found = user.ward.items.where(season: seas)
   found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 

def date_for_self(user, date, ward)
    found = user.ward.items.where(date)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 

 

def deciding_filters_for_self(wardrobe, user_chosen)
 
  
    answer = CLI::UI::Prompt.ask("choose how you would like to search through your wardrobe") do |handler|
        handler.option('type')  { |selection| selection }
        handler.option('color')  { |selection| selection }
        handler.option('season')  { |selection| selection }
        handler.option('purchased in the last year')  { |selection| selection }
        handler.option('add new item')  { |selection| selection }
    end 
    

    if answer == "type"
        
        sec_answer = CLI::UI::Prompt.ask("choose the type of clothing you would like to search through") do |handler|
        handler.option('top')  { |selection| selection }
        handler.option('bottom')  { |selection| selection }
        handler.option('shoes')  { |selection| selection }
    end 
  
        if sec_answer == "top"
            kinds_for_self(user_chosen, "top", wardrobe)
        elsif sec_answer == "bottom"
            kinds_for_self(user_chosen, 'bottom', wardrobe)
        elsif sec_answer == "shoes"
            kinds_for_self(user_chosen, 'shoes', wardrobe)
        end 
            
    elsif answer == "color"
        sec_answer = CLI::UI::Prompt.ask("choose the color of clothing you would like to search through") do |handler|
        handler.option('red')  { |selection| selection }
        handler.option('yellow')  { |selection| selection }
        handler.option('blue')  { |selection| selection }
        handler.option('green')  { |selection| selection }
        handler.option('black')  { |selection| selection }
        handler.option('orange')  { |selection| selection }
        handler.option('purple')  { |selection| selection }
        handler.option('white')  { |selection| selection }
    end 

        if sec_answer == "red"
            colors_for_self(user_chosen, "red", wardrobe)
        elsif sec_answer == "yellow"
            colors_for_self(user_chosen, "yellow", wardrobe)
        elsif sec_answer == "blue"
            colors_for_self(user_chosen, "blue", wardrobe)
        elsif sec_answer == "green"
            colors_for_self(user_chosen, "green", wardrobe)
        elsif sec_answer == "black"
            colors_for_self(user_chosen, "black", wardrobe)
        elsif sec_answer == "orange"
            colors_for_self(user_chosen, "orange", wardrobe)
        elsif sec_answer == "purple"
            colors_for_self(user_chosen, "purple", wardrobe)
        elsif sec_answer == "white"
            colors_for_self(user_chosen, "white", wardrobe)
        end 

    elsif answer == 'season'
         sec_answer = CLI::UI::Prompt.ask("choose the season of clothing you would like to search through") do |handler|
        handler.option('winter')  { |selection| selection }
        handler.option('summer')  { |selection| selection }
        end 

        if sec_answer == "winter"
            seasons_for_self(user_chosen, "winter", wardrobe)
        elsif sec_answer == "summer"
            seasons_for_self(user_chosen, "summer", wardrobe)
        end 

    elsif answer == "purchased in the last year"
            date_for_self("date > 2018")
    

    elsif answer == "add new item"
    
        user_id = user_chosen.id 
        # wardrobe = user_chosen.new_wardrobes 


        puts "enter type of item (ex. top, bottom, shoes)"
        type = gets.chomp 
        puts "enter color of item"
        color = gets.chomp
        puts "enter season of item"
        season = gets.chomp
        puts "enter where item is located in you room"
        location = gets.chomp
        puts "enter size of item"
        size = gets.chomp 
        puts "enter name of wardrobe"
            wardrobe_name = CLI::UI::Prompt.ask("please select a wardrobe you would like to enter your item into") do |handler|
                user_chosen.new_wardrobes.each do |ward|
                    handler.option(ward.name)  { |selection| selection }
                end 
            end 
       
         wardrobe = get_wardrobe_from_name(wardrobe_name)

        puts "enter year purchased"
        date = gets.chomp.to_i

        puts "enter image url if you have one"
        image_url = gets.chomp 

        add_new_item(type, color, season, location, date, size, user_id, wardrobe.id, image_url)

    end 
    
end 

def get_wardrobe_from_name(name)
    Wardrobe.all.find do |wardrobe|
        wardrobe.name == name 
    end 
end 

def make_new_account(result)
    User.create(name: result)
 
end 

def make_new_wardrobe(user, title)
    Wardrobe.create(name: title, user_id: user)
end 

def add_new_item(type1, color1, season1, location1, date1, size1, user_id1, wardrobe_id1, image_url1="")
    Item.create(kind: type1, color: color1, season: season1, location: location1, size: size1, date: date1, user_id: user_id1, wardrobe_id: wardrobe_id1, image_url: image_url1)
end 

def showing_many_wardrobes(user_instance)
   
    CLI::UI::Prompt.ask("login? or make a new account?") do |handler|
        user_instance.new_wardrobes.each do |ward|
            handler.option(ward.name)  { |selection| selection }
        end 
    end 

end 



def run 
    puts "Welcome to Myo's Closet"
   
   answer2 = CLI::UI::Prompt.ask("login? or make a new account?") do |handler|
        handler.option('new account')  { |selection| selection }
        handler.option('login')  { |selection| selection }
    end 
    
    if answer2 == 'new account'
        puts "please enter your name to create account"
        new_name = gets.chomp
        make_new_account(new_name)
        puts "your account is made"
    end 


    puts "Enter your name to log in"
    name = gets.chomp 
    user_instance = User.all.find do |user|
        user.name == name
    end 

   
    wardrobe_choice = CLI::UI::Prompt.ask("Do you want to look at your wardrobe or everybody's wardrobes?") do |handler|
        handler.option('your wardrobe')  { |selection| selection }
        handler.option('everyones wardrobe')  { |selection| selection }
        handler.option('make new wardrobe')  { |selection| selection }
    end 
 
    
    if wardrobe_choice == "your wardrobe"
    
        if user_instance.new_wardrobes.all.length > 1
wardrobe_name_chosen =  CLI::UI::Prompt.ask("login? or make a new account?") do |handler|
             user_instance.new_wardrobes.each do |ward|
                handler.option(ward.name)  { |selection| selection }
            end 
            binding.pry
        end 
        
            wardrobe_chosen = get_wardrobe_from_name(wardrobe_name_chosen)
            deciding_filters_for_self(wardrobe_chosen, user_instance)
        elsif user_instance.new_wardrobes.all.length == 1
        
            deciding_filters_for_self(user_instance.new_wardrobes[0], user_instance)
        end 

    elsif wardrobe_choice == "everyones wardrobe"
        deciding_filters
    elsif wardrobe_choice == "make new wardrobe"
        puts "enter the name of new wardrobe"
        new_wardrobe_name = gets.chomp 

        make_new_wardrobe(user_instance.id, new_wardrobe_name)

    end 


    #get to screen for choosing self or everyone 
   
    # deciding_filters # chooses for everyones closet, decides filters two times and outputs items.
   
end 



run 
