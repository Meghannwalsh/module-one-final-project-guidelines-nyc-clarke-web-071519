require_relative '../config/environment'
require_relative '../app/models/item.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/wardrobe.rb'





def kinds_for_everyone(type)
    allItems = Item.all.where(kind: type)
    if allItems.empty?
        puts "sorry, there are no items here"
        run

    else
        selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 

        system "clear"

        output = allItems.find do |item|
            item.kind == selection
        end 


        CLI::UI::Frame.open('Open') { puts 'hi' }
                
      

        editing_method(output)
    end 
end 

def colors_for_everyone(col)
    allItems = Item.all.where(color: col)
    if allItems.empty?
        puts "sorry, there are no items here"
        run
    else
        selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 

        system "clear"

        output = allItems.find do |item|
            item.kind == selection
        end 

        puts output.kind
        puts output.image_url
        puts output.location
        puts output.size

        editing_method(output)
    end
end 
    

def seasons_for_everyone(seas)
   allItmes = Item.all.where(season: seas)
   if allItems.empty?
        puts "sorry, there are no items here"
        run

    else
    selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 

        system "clear"
        output = allItems.find do |item|
            item.kind == selection
        end 

        puts output.kind
        puts output.image_url
        puts output.location
        puts output.size

        editing_method(output)
    end
end 

def date_for_everyone(date)
    allItems = Item.all.where(date)
    if allItems.empty?
        puts "sorry, there are no items here"
        run

    else
        selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 

        system "clear"

        output = allItems.find do |item|
            item.kind == selection
        end 

        puts output.kind
        puts output.image_url
        puts output.location
        puts output.size

        editing_method(output)
    end
end 



def deciding_filters 
    answer = CLI::UI::Prompt.ask("choose how you would like to search through everyone's wardrobes") do |handler|
        handler.option('type')  { |selection| selection }
        handler.option('color')  { |selection| selection }
        handler.option('season')  { |selection| selection }
        handler.option('purchased in the last year')  { |selection| selection }
    end 

    system "clear" 

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

def editing_method(output)

    system "clear" 

    CLI::UI::Frame.open('Item') { 
        puts "type: #{output.kind}"
        puts "color: #{output.color}"
        puts output.location
        puts output.size }
   

    editing = CLI::UI::Prompt.ask("do you want to edit this item?") do |handler|
            handler.option('edit')  { |selection| selection }
            handler.option('delete')  { |selection| selection }
            handler.option('no')  { |selection| selection }
        end 
        if editing == 'delete' 

            output.destroy

        elsif editing == 'edit'
            system "clear"
                editing_attributes = CLI::UI::Prompt.ask("what would you like to edit?") do |handler|
                    handler.option('location of the item')  { |selection| selection }
                    handler.option('size of the item')  { |selection| selection }
                    handler.option('color of the item')  { |selection| selection }
                    handler.option('season of the item')  { |selection| selection }
                    handler.option('date purchased of the item')  { |selection| selection }
                end 

           
                if editing_attributes == 'location of the item'
                    system "clear"
                    puts 'what would you like the new location to be'
                    new_location = gets.chomp
                    output.location = new_location
                    output.save 

                    puts output.kind
                    puts output.image_url
                    puts output.location
                    puts output.size
                    puts output.color
                    puts output.date

                elsif editing_attributes == 'size of the item'
                    system "clear"
                    puts 'what would you like the new size to be'
                    new_size = gets.chomp
                    output.size = new_size
                    output.save 

                    puts output.kind
                    puts output.image_url
                    puts output.location
                    puts output.size
                    puts output.color
                    puts output.date

                elsif editing_attributes == 'color of the item'
                    system "clear"
                    puts 'what would you like the new color to be'
                    new_color = gets.chomp
                    output.color = new_color 
                    output.save 

                    puts output.kind
                    puts output.image_url
                    puts output.location
                    puts output.size
                    puts output.color
                    puts output.date

                elsif editing_attributes == 'season of the item'
                    system "clear"
                    puts 'what would you like the new season to be'
                    new_season = gets.chomp
                    output.season = new_season
                    output.save 

                    puts output.kind
                    puts output.image_url
                    puts output.location
                    puts output.size
                    puts output.color
                    puts output.date

                elsif editing_attributes == 'date purchased of the item'
                    system "clear"
                    puts 'what would you like the new purchased date to be'
                    new_date = gets.chomp.to_i
                    output.date = new_date
                    output.save 

                    puts output.kind
                    puts output.image_url
                    puts output.location
                    puts output.size
                    puts output.color
                    puts output.date
                end
        
        end 
    end 




def kinds_for_self(user, type, ward)
    
    allItems = ward.items.where(kind: type)

    if allItems.empty?
        puts "sorry, there are no items here"

        back_to_main_page(user)
    else
        selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 
    
        output = allItems.find do |item|
            item.kind == selection
        end 

         CLI::UI::Frame.open('Open') { puts 'hi' }
        # puts output.kind
        # puts output.image_url
        # puts output.location
        # puts output.size

        editing_method(output)
    end 
end 


def colors_for_self(user, col, ward)
    allItems = ward.items.where(color: col)
    if allItems.empty?
            puts "sorry, there are no items here"
        back_to_main_page(user)
    else
        system "clear"
        selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 

        output = allItems.find do |item|
            item.kind == selection
        end 

        puts output.kind
        puts output.image_url
        puts output.location
        puts output.size

        editing_method(output)
    end 
end 
    

def seasons_for_self(user, seas, ward)
    allItems = ward.items.where(season: seas)
    if allItems.empty?
        puts "sorry, there are no items here"
        back_to_main_page(user)
    else
        selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 

        output = allItems.find do |item|
            item.kind == selection
        end 

        puts output.kind
        puts output.image_url
        puts output.location
        puts output.size

        editing_method(output)
    end
end 

def date_for_self(user, date, ward)
    allItems = ward.items.where(date)
    if allItems.empty?
        puts "sorry, there are no items here"
        back_to_main_page(user)

    else
        selection = CLI::UI::Prompt.ask("select an item for a closer look") do |handler|
            allItems.each do |op|
            handler.option(op.kind)  { |selection| selection }
            end 
        end 

        output = allItems.find do |item|
            item.kind == selection
        end 

        puts output.kind
        puts output.image_url
        puts output.location
        puts output.size

        editing_method(output)
    end
end 


def deciding_filters_for_self(ward, user_chosen)
 
  
    answer = CLI::UI::Prompt.ask("choose how you would like to search through your wardrobe") do |handler|
        handler.option('type')  { |selection| selection }
        handler.option('color')  { |selection| selection }
        handler.option('season')  { |selection| selection }
        handler.option('purchased in the last year')  { |selection| selection }
        handler.option('add new item')  { |selection| selection }
    end 
    
    system "clear"

    if answer == "type"
        
        sec_answer = CLI::UI::Prompt.ask("choose the type of clothing you would like to search through") do |handler|
        handler.option('top')  { |selection| selection }
        handler.option('bottom')  { |selection| selection }
        handler.option('shoes')  { |selection| selection }
    end 
  
        if sec_answer == "top"
            kinds_for_self(user_chosen, "top", ward)
        elsif sec_answer == "bottom"
            kinds_for_self(user_chosen, 'bottom', ward)
        elsif sec_answer == "shoes"
            kinds_for_self(user_chosen, 'shoes', ward)
        end 

        system "clear"
            
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
            colors_for_self(user_chosen, "red", ward)
            
            #method where they can select item and be brought to that item
        elsif sec_answer == "yellow"
            colors_for_self(user_chosen, "yellow", ward)
        elsif sec_answer == "blue"
            colors_for_self(user_chosen, "blue", ward)

        elsif sec_answer == "green"
            colors_for_self(user_chosen, "green", ward)
        elsif sec_answer == "black"
            colors_for_self(user_chosen, "black", ward)
        elsif sec_answer == "orange"
            colors_for_self(user_chosen, "orange", ward)
        elsif sec_answer == "purple"
            colors_for_self(user_chosen, "purple", ward)
        elsif sec_answer == "white"
            colors_for_self(user_chosen, "white", ward)
        end 

        system "clear"

    elsif answer == 'season'
         sec_answer = CLI::UI::Prompt.ask("choose the season of clothing you would like to search through") do |handler|
        handler.option('winter')  { |selection| selection }
        handler.option('summer')  { |selection| selection }
        end 

        if sec_answer == "winter"
            seasons_for_self(user_chosen, "winter", ward)
        elsif sec_answer == "summer"
            seasons_for_self(user_chosen, "summer", ward)

        end 

        system "clear"

    elsif answer == "purchased in the last year"
            date_for_self("date > 2018")
        
        system "clear"

    elsif answer == "add new item"
    
        user_id = user_chosen.id 

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

            system "clear"
       
         wardrobe = get_wardrobe_from_name(wardrobe_name)

        puts "enter year purchased"
        date = gets.chomp.to_i

        puts "enter image url if you have one"
        image_url = gets.chomp 

        add_new_item(type, color, season, location, date, size, user_id, wardrobe.id, image_url)


    end 
    
end 


def back_to_main_page(user_chosen)
 done = CLI::UI::Prompt.ask("would you like to go back to the main page?") do |handler|
         handler.option("yes")  { |selection| selection }
        handler.option("no")  { |selection| selection }
        end 

        if done == "yes"
            system "clear"
            post_log_in(user_chosen)
        else 
            puts "goodbye"
            exit
        end 
        system "clear"
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


def post_log_in(user_instance)
       
    wardrobe_choice = CLI::UI::Prompt.ask("Do you want to look at your wardrobe or everybody's wardrobes?") do |handler|
        handler.option('your wardrobe')  { |selection| selection }
        handler.option('everyones wardrobe')  { |selection| selection }
        handler.option('make new wardrobe')  { |selection| selection }
        handler.option('clean out wardrobe')  { |selection| selection }
    end 
 
    system "clear"
    
    if wardrobe_choice == "your wardrobe"
        
        if user_instance.new_wardrobes.length > 1
wardrobe_name_chosen =  CLI::UI::Prompt.ask("Choose which wardrobe you would like to enter") do |handler|
                user_instance.new_wardrobes.each do |ward|
                handler.option(ward.name)  { |selection| selection }
            end 
        end 

    
        wardrobe_chosen = get_wardrobe_from_name(wardrobe_name_chosen)

        
        deciding_filters_for_self(wardrobe_chosen, user_instance)

        elsif user_instance.new_wardrobes.all.length == 1
        
            deciding_filters_for_self(user_instance.new_wardrobes[0], user_instance)
        end 

        system "clear"

    elsif wardrobe_choice == "everyones wardrobe"
        deciding_filters
    elsif wardrobe_choice == "make new wardrobe"
        puts "enter a name for your new wardrobe"
        new_wardrobe_name = gets.chomp 

        system "clear"

        make_new_wardrobe(user_instance.id, new_wardrobe_name)
        puts "you now have a new wardrobe: #{new_wardrobe_name}"

    elsif wardrobe_choice == "clean out wardrobe"
        clean_wardrobe =  CLI::UI::Prompt.ask("Choose which wardrobe you would like to clean out") do |handler|
            user_instance.new_wardrobes.each do |ward|
            handler.option(ward.name)  { |selection| selection }
            end 
        end 


        system "clear"

        
        selected_wardrobe = user_instance.new_wardrobes.find do |wardrobe|
                    wardrobe.name == clean_wardrobe
                    end 


        puts "Clean out your closet! Enter a year so that we can clean out all of the items you purchased before that year"
        answer = gets.chomp.to_i
       

        selected_wardrobe.items.each do |item|
            year = item.date
            if year < answer 
                item.destroy 
            end 
        end 
         system "clear"
 
         puts "Your Wardrobe is clean!!"
    end 


    
    back_to_main_page(user_instance)
 
end 

def invalid_name(user_instance)
    User.all.each do |user|
        if user == user_instance
            puts "That is a valid name"
            post_log_in(user)
        end
    end 
    puts "This is an invalid name"
    run
end 
def run 
    puts "Welcome to Myo's Closet"
   
   answer2 = CLI::UI::Prompt.ask("login? or make a new account?") do |handler|
        handler.option('new account')  { |selection| selection }
        handler.option('login')  { |selection| selection }
    end 

    system "clear"
    
    if answer2 == 'new account'
        puts "please enter your name to create account"
        new_name = gets.chomp
        make_new_account(new_name)
        puts "your account is made"
    end 

    system "clear"

    puts "Enter your name to log in"
    name = gets.chomp 
    user_instance = User.all.find do |user|
        user.name == name
    end  
    invalid_name(user_instance)

    system "clear"

   post_log_in(user_instance)
  
end 



run 
