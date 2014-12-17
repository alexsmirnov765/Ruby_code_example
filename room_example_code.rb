######################################################################################
#
# User                      : Alexey Smirnov (alexsmirnov765@gmail.com)
#
# Ruby version              : 2.0.0
#
# Script name               : room_example_code.rb
#
# Requires                  : the file with text description of rectangular room internal structure - 'input007.txt' should be in the same
#                           directory as that script
#
# Description               : Finding length of path of laser beam within the rectangular room
#
# Instructions to run       : ruby room_example_code.rb
#
######################################################################################

#Instance of that class represents rectangular room internal structure
class Room

    attr_accessor :room_string, :rows, :columns, :final_arr, :path_counter, :direction
    attr_reader :file_name
    COUNTER = 50 #max number of rows allowed
   
    #class object initialization method
    def initialize(file_name)
        @file_name = file_name
        @rows = 0
        @columns = 0
        @final_arr = []
        @path_counter = 1
        @direction = 'right'
        @room_string = read_input(@file_name)
    end
   
    #reading source data file from STDIN
    def read_input(file_name)
        counter = 1
        text = ''
        begin
            f = File.open(file_name, 'r')
            f.each_line do |line|
                text += line
                counter += 1
                if counter > COUNTER
                    break
                end
            end
            f.close
            return text
        rescue Exception => e
            puts "Sorry, your data file ('#{file_name}') was moved, renamed or deleted"
            puts e.message
            puts e.backtrace.inspect
        end
    end

    #convertation text data to 2-dimensional array
    def convertation
        arr = []
        arr = @room_string.split(/\n/)
        
        arr.each do |arr_element|
            final_arr << arr_element.chars.to_a
        end

        @rows = final_arr.length
        @columns = final_arr[0].length
        return final_arr
    end
    
    #finding coordinates of the position of '@' (laser) element
    def find_at_position(array)
        x_coord = 0
        y_coord = 0
        while y_coord < @rows
            while x_coord < @columns
                if array[y_coord][x_coord] == '@'
                    return x_coord, y_coord
                end
                x_coord += 1
            end
            x_coord = 0
            y_coord += 1
        end
    end
    
    #result calculating
    def result_calc
        x, y = find_at_position(convertation)
        if x == (@columns - 1)
            #keep @path_counter equal default value
        else
            current_x = x + 1
            current_y = y

            while ((0..(@columns - 1)) === current_x) && ((0..(@rows - 1)) === current_y)
                
                case @final_arr[current_y][current_x]
                
                when "@"
                    case @direction
                        when "up"
                            current_y += 1
                            @path_counter += 1
                        when "left"
                            current_x -= 1
                            @path_counter += 1
                        when "down"
                            current_y -= 1
                            @path_counter += 1
                        when "right"
                            current_x += 1
                            @path_counter += 1
                    end


                when "-"
                    case @direction
                        when "up"
                            current_y += 1
                            @path_counter += 1
                        when "left"
                            current_x -= 1
                            @path_counter += 1
                        when "down"
                            current_y -= 1
                            @path_counter += 1
                        when "right"
                            current_x += 1
                            @path_counter += 1
                    end
                    
                when "^"
                    current_y -= 1
                    @path_counter += 1
                    @direction = 'down'
                when "<"
                    current_x -= 1
                    @path_counter += 1
                    @direction = 'left'
                when "v"
                    current_y += 1
                    @path_counter += 1
                    @direction = 'up'
                when ">"
                    current_x += 1
                    @path_counter += 1
                    @direction = 'right'
                when "O"
                    case @direction
                        when "up"
                            @direction = 'down'
                            current_y -= 1
                            @path_counter += 1
                        when "left"
                            @direction = 'right'
                            current_x -= 1
                            @path_counter += 1
                        when "down"
                            @direction = 'up'
                            current_y += 1
                            @path_counter += 1
                        when "right"
                            @direction = 'left'
                            current_x += 1
                            @path_counter += 1
                    end
                    

                when "\/"
                    case @direction
                        when "up"
                            @direction = 'left'
                            current_x -= 1
                            @path_counter += 1
                        when "left"
                            @direction = 'up'
                            current_y += 1
                            @path_counter += 1
                        when "down"
                            @direction = 'right'
                            current_x += 1
                            @path_counter += 1
                        when "right"
                            @direction = 'down'
                            current_y -= 1
                            @path_counter += 1
                    end

                when "\\"
                    case @direction
                        when "up"
                            @direction = 'right'
                            current_x += 1
                            @path_counter += 1
                        when "left"
                            @direction = 'down'
                            current_y -= 1
                            @path_counter += 1
                        when "down"
                            @direction = 'left'
                            current_x -= 1
                            @path_counter += 1
                        when "right"
                            @direction = 'up'
                            current_y += 1
                            @path_counter += 1
                    end
 

                end #end of top level case statement
            

            end #end of while loop
        end #end of if.. else.. condition

        return @path_counter
    end #end of function definition
    
end #end of class


room = Room.new('input007.txt')
puts room.result_calc

