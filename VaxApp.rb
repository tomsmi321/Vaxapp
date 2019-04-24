require 'rainbow'

class Parent
    attr_reader :children
    def initialize(name)
        @name = name
        @children = []
    end

    def get_name()
        @name
    end

    def set_name(name)
        @name = name
    end

    def get_children
        @children
    end

    def add_child(child)
        @children << child
    end

    def select_child_by_name(name)
        @children.each do |child|
            if(child.get_name() == name)
                return child
            else
                # puts("child not found")
            end
        end
    end

    def add_new_child(name, age)
        @children << Child.new(name, age)
    end
end



class Child 
    def initialize(name, age)
        @name = name
        @age = age
        @vaccinations = []
        @reminders = []
    end

    def get_name()
        @name
    end

    def set_name(name)
        @name = name
    end

    def get_age()
        @age
    end

    def set_age(age)
        @age = age
    end

    def get_vaccinations()
        @vaccinations
    end

    def add_vaccination(vaccination)
        @vaccinations << vaccination
    end

    def add_vacccination_by_name(vac_name, vac_arr)
        vac_arr.each do |vaccination|
            if(vaccination.get_name == vac_name)
                @vaccinations << vaccination
            end
        end
    end

    def has_vaccination?(vaccination)
        @vaccinations.include?(vaccination)
    end

    def print_vaccinations()
        get_vaccinations().each do |vaccination|
            print(vaccination.to_s)
        end
    end

    def get_reminders()
        @reminders
    end

    def add_reminder(reminder)
        @reminders << reminder
    end

    def remove_reminder(reminder)
        @reminders.delete(reminder)
    end

    def print_reminders()
        get_reminders().each do |reminder|
            puts(reminder.get_message)
        end
    end

    def remove_reminder_by_tag(tag, arr_reminders)
        arr_reminders.each do |reminder|
            if(reminder.get_tag == tag)
                remove_reminder(reminder)
            end
        end
    end

    def add_new_reminder(tag, time)
        @reminders << Reminder.new(tag, time)
    end

end


class Vaccinations
    attr_accessor(:name, :quantity, :admin_method, :admin_age, :notes)
    def initialize(name, quantity, admin_method, admin_age, notes)
        @name = name
        @quantity = quantity
        @admin_method = admin_method
        @admin_age = admin_age
        @notes = notes
    end

    def get_name()
        @name
    end

    def to_s()
        puts("name: #{@name}, qty: #{@quantity}, administration: #{@admin_method}, age required: #{@admin_age}, notes: #{@notes}")
    end
end




class Reminder
    def initialize(tag, time)
        @tag = tag
        @time = time
        @message = "Your child's #{tag} is due at #{time} months"
    end
    
    def get_tag()
        @tag
    end

    def set_tag(tag)
        @tag = tag
    end

    def get_time()
        @time
    end

    def set_time(time)
        @time = time
    end

    def get_message()
        @message
    end
end


class Menu

    def landing_menu()
        puts Rainbow("Welcome to Vax O'clock").underline.green
        puts
        puts Rainbow("""
Please select one of the following options:
1. Create a new account
2. Login
        """).cyan
    end

    def main_menu()
        puts
        puts Rainbow("Main Menu").underline.green
        puts
        puts Rainbow("""
Please select one of the following options:        
1. View your reminders
2. View completed vaccinations
3. Add another child
4. Exit
""").cyan
    end

    def login_page()
        puts("Please enter your name:")
        puts
    end



end


class Main 
    def run_program()
        # create reminder objects
        reminder0 = Reminder.new("Hepatitis B", 0)
        reminder2a = Reminder.new("Infanrix hexa 2a", 2)
        reminder2b = Reminder.new("Prevenar 13 2b", 2)
        reminder2c = Reminder.new("Rotarix 2c", 2)
        reminder4a = Reminder.new("Infanrix hexa 4a", 4)
        reminder4b = Reminder.new("Prevenar 13 4b", 4)
        reminder4c = Reminder.new("Rotarix 4c", 4)
        reminder6a = Reminder.new("Infanrix hexa 6a", 6)
        reminder12a = Reminder.new("MMR II/Prioix", 12)
        reminder12b = Reminder.new("Prevenar 13 12b", 12)
        reminder12c = Reminder.new("Nimenrix", 12)
        
        # create vaccination objects
        vaccination0 = Vaccinations.new("Hepatitis B", 0.5, "Intramuscular", 0, "Give withing 7 days of birth, ideally within the first 24 hours")
        vaccination2a = Vaccinations.new("Infanrix hexa 2a", 0.5, "Intramuscular", 2, "")
        vaccination2b = Vaccinations.new("Prevenar 13 2b", 0.5, "Intramuscular", 2, "")
        vaccination2c = Vaccinations.new("Rotarix 2c", 1.5, "Orally", 2, "")
        vaccination4a = Vaccinations.new("Infanrix hexa 4a", 0.5, "Intramuscular", 4, "")
        vaccination4b = Vaccinations.new("Prevenar 13 4b", 0.5, "Intramuscular", 4, "")
        vaccination4c = Vaccinations.new("Rotarix 4c", 1.5, "Orally", 4, "")
        vaccination6a = Vaccinations.new("Infanrix hexa 6a", 0.5, "Intramuscular", 6, "")
        vaccination12a = Vaccinations.new("MMR II/Prioix", 0.5, "Intramuscular or Subcutaneous", 12, "")
        vaccination12b = Vaccinations.new("Prevenar 13 12b", 0.5, "Intramuscular", 12, "")
        vaccination12c = Vaccinations.new("Nimenrix", 0.5, "Intramuscular", 12, "")
        
        vax_arr = []

        vax_arr.push(vaccination0, vaccination2a, vaccination2b, vaccination2c, vaccination4a, vaccination4b, vaccination4c, vaccination6a, vaccination12a, vaccination12b, vaccination12c)

        # , vaccination2a, vaccination2b, vaccination2c, vaccination4a, vaccination4b, vaccination4c, vaccination6a)

        # display the landing menu to the user and get their selection
        menu1 = Menu.new()
        loop_condition = true
        while(loop_condition == true)
            menu1.landing_menu
            parent_selection = gets.strip().to_i
            # if user selects create acc then create a parent and create a child
            if (parent_selection == 1)
                puts
                puts Rainbow("Create Your Account").underline.green
                puts
                puts Rainbow("Please enter your name:").cyan
                parent_name = gets.strip()
                puts
                puts Rainbow("Please enter your childs name:").cyan
                child_name = gets.strip()
                puts
                puts Rainbow("Please enter your childs age in months:").cyan
                child_age = gets.strip()
                puts
                parent1 = Parent.new(parent_name)
                child1 = Child.new(child_name, child_age)
                parent1.add_child(child1)
            
                # add reminders to child
                parent1.select_child_by_name(child_name).add_reminder(reminder0)
                parent1.select_child_by_name(child_name).add_reminder(reminder2a)
                parent1.select_child_by_name(child_name).add_reminder(reminder2b)
                parent1.select_child_by_name(child_name).add_reminder(reminder2c)
                parent1.select_child_by_name(child_name).add_reminder(reminder4a)
                parent1.select_child_by_name(child_name).add_reminder(reminder4b)
                parent1.select_child_by_name(child_name).add_reminder(reminder4c)
                parent1.select_child_by_name(child_name).add_reminder(reminder6a)
                parent1.select_child_by_name(child_name).add_reminder(reminder12a)
                parent1.select_child_by_name(child_name).add_reminder(reminder12b)
                parent1.select_child_by_name(child_name).add_reminder(reminder12c)
                

                loop_condition = false
                # if the choose to log in then take them to the login page and end menu loop
            elsif(parent_selection == 2)
                menu1.login_page
                loop_condition = false
            else
                puts
                puts Rainbow("Invalid selection, please try again").cyan
                puts
                loop_condition = true
            end
        end

        # take the user to the main menu and get their selection
        loop_condition = true
        while(loop_condition == true)
            menu1.main_menu
            parent_selection = gets.strip().to_i
            # if they select option 1 then ask them which child and print reminders for that child
            if (parent_selection == 1)
                puts
                puts Rainbow("View Your Reminders").underline.green
                puts
                puts Rainbow("Which child would you like to view reminders for?").cyan
                parent_child_selection = gets.strip()
                puts
                parent1.select_child_by_name(parent_child_selection).print_reminders
                puts
                puts Rainbow("Would you like to mark one of these reminders as completed and add them to your childs list of completed vaccinations? (y/n)").cyan
                parent_response = gets.strip()
                puts
                if(parent_response == "y")
                    puts Rainbow("Please tell us which reminder you would like to remove:").cyan
                    reminder_tag = gets.strip()
                    child = parent1.select_child_by_name(parent_child_selection)
                    child_reminders = child.get_reminders
                    child.remove_reminder_by_tag(reminder_tag, child_reminders)
                    puts
                    # add vaccination to child vaccination array
                    vac_name = reminder_tag
                    child.add_vacccination_by_name(vac_name, vax_arr) 
                end
            elsif (parent_selection == 2)
                puts
                puts Rainbow("Please enter the name of your child:").cyan
                parent_child_selection = gets.strip()
                parent1.select_child_by_name(parent_child_selection).print_vaccinations
            elsif(parent_selection == 3)
                puts
                puts Rainbow("Please enter your childs name:").cyan
                child_name = gets.strip()
                puts
                puts Rainbow("Please enter your childs age in months:").cyan
                child_age = gets.strip()
                puts
                parent1.add_new_child(child_name, child_age)
                # puts(parent1.select_child_by_name(child_name).get_name)
                parent1.select_child_by_name(child_name).add_reminder(reminder0)
                parent1.select_child_by_name(child_name).add_reminder(reminder2a)
                parent1.select_child_by_name(child_name).add_reminder(reminder2b)
                parent1.select_child_by_name(child_name).add_reminder(reminder2c)
                parent1.select_child_by_name(child_name).add_reminder(reminder4a)
                parent1.select_child_by_name(child_name).add_reminder(reminder4b)
                parent1.select_child_by_name(child_name).add_reminder(reminder4c)
                parent1.select_child_by_name(child_name).add_reminder(reminder6a)
                parent1.select_child_by_name(child_name).add_reminder(reminder12a)
                parent1.select_child_by_name(child_name).add_reminder(reminder12b)
                parent1.select_child_by_name(child_name).add_reminder(reminder12c)
            elsif (parent_selection == 4)
                loop_condition = false
            end
        end
    end
end

main1 = Main.new()
main1.run_program










