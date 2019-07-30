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
   puts  "choose a filter"
    answer = gets.chomp

    if answer == "kind"
        puts "choose another filter"
        sec_answer = gets.chomp
        if sec_answer == "top"
            kinds_for_everyone("top")
        elsif sec_answer == "bottom"
            kinds_for_everyone('bottom')
        elsif sec_answer == "shoes"
            kinds_for_everyone('shoes')
        end 
            
    elsif answer == "color"
        puts "choose another filter"
        sec_answer = gets.chomp
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
         puts "choose another filter"
        sec_answer = gets.chomp
        if sec_answer == "winter"
            seasons_for_everyone("winter")
        elsif sec_answer == "summer"
            seasons_for_everyone("summer")
        end 

    elsif answer == "date"
         puts "choose another filter"
        sec_answer = gets.chomp.to_i
        if sec_answer < 2018
            date_for_everyone("date < 2018")
        elsif sec_answer >= 2018
            date_for_everyone("date >= 2018")
        end 

    end 
end 

#____________________________________________________________


def kinds_for_self(user, type)
    found = user.items.all.where(kind: type)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 

def colors_for_self(user, col)
    found = user.items.all.where(color: col)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 
    

def seasons_for_self(user, seas)
   found = user.items.all.where(season: seas)
   found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 

def date_for_self(user, date)
    found = user.items.all.where(date)
    found.each do |item|
        puts [item.kind, item.location, item.size, item.image_url]
    end 
end 



def deciding_filters_for_self(user_chosen)
   puts  "choose a filter"
    answer = gets.chomp

    if answer == "kind"
        puts "choose another filter"
        sec_answer = gets.chomp
        if sec_answer == "top"
            kinds_for_self(user_chosen, "top")
        elsif sec_answer == "bottom"
            kinds_for_self(user_chosen, 'bottom')
        elsif sec_answer == "shoes"
            kinds_for_self(user_chosen, 'shoes')
        end 
            
    elsif answer == "color"
        puts "choose another filter"
        sec_answer = gets.chomp
        if sec_answer == "red"
            colors_for_self(user_chosen, "red")
        elsif sec_answer == "yellow"
            colors_for_self(user_chosen, "yellow")
        elsif sec_answer == "blue"
            colors_for_self(user_chosen, "blue")
        elsif sec_answer == "green"
            colors_for_self(user_chosen, "green")
        elsif sec_answer == "black"
            colors_for_self(user_chosen, "black")
        elsif sec_answer == "orange"
            colors_for_self(user_chosen, "orange")
        elsif sec_answer == "purple"
            colors_for_self(user_chosen, "purple")
        elsif sec_answer == "white"
            colors_for_self(user_chosen, "white")
        end 

    elsif answer == 'season'
         puts "choose another filter"
        sec_answer = gets.chomp
        if sec_answer == "winter"
            seasons_for_self(user_chosen, "winter")
        elsif sec_answer == "summer"
            seasons_for_self(user_chosen, "summer")
        end 

    elsif answer == "date"
         puts "choose another filter"
        sec_answer = gets.chomp.to_i
        if sec_answer < 2018
            date_for_self(user_chosen, "date < 2018")
        elsif sec_answer >= 2018
            date_for_self(user_chosen, "date >= 2018")
        end 

    end 
end 




def run 
    #imput username 
    puts "Enter your name"
    name = gets.chomp 
    answer = User.all.find do |user|
        user.name == name
    end 

    puts "Do you want to look at your wardrobe or everybody's wardrobes?"
    #look through closet/ make new wardrobe
    wardrobe_choice = gets.chomp
    if wardrobe_choice == "my closet"
        deciding_filters_for_self(answer)
    else
        deciding_filters
    end 
    
    #get to screen for choosing self or everyone 
   
    # deciding_filters # chooses for everyones closet, decides filters two times and outputs items.
   
end 



run 
