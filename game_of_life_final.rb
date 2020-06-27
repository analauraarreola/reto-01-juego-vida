require 'byebug'

class CreatesBoard

  def initialize
    create_matrix(true)
  end

  def create_matrix(random=false)
    if random
      @board = Array.new(10) { Array.new(10) {rand(0..1)} }
    else
      @board_next = Array.new(10) { Array.new(10) {0} }
      
    end
  end

  def print_board
    i = 0
    j = 0
    while i < 10 do 
      while j < 10 do 
        print status_cell(i,j) == true ?  "▇ " : ". "
        j += 1
      end
      puts 
      j = 0
      i += 1
    end
  end

  def iteration
    @board.each_with_index  do |i,position| 
      puts "La posición #{position} tiene el valor #{i}"
      #¿cuáles células están vivas?
    end
  end

  def inside_board?(row,column)
    row < @size && row >= 0 && column < @size && column >= 0
  end
    
  def neighbours(row, column) #Analizando los vecinos de cada célula
    neighbours_sum = 0
    if (@board[row-1, column])   == 1 
      neighbours_sum += 1 
    end
    if (@board[row-1, column+1]) == 1
      neighbours_sum += 1 
    end
    if (@board[row, column+1])   == 1
      neighbours_sum += 1 
    end
    if (@board[row+1, column+1]) == 1
      neighbours_sum += 1 
    end
    if (@board[row+1, column])   == 1
      neighbours_sum += 1 
    end
    if (@board[row+1, column-1]) == 1
      neighbours_sum += 1 
    end
    if (@board[row, column-1])   == 1
      neighbours_sum += 1 
    end
    if (@board[row-1, column-1]) == 1
      neighbours_sum += 1 
    end
    neighbours_sum
  end

  def status_cell (row,column)
    @board[row][column] == 1 ? true : false
  end

  def rules
    create_matrix 
    (0...10).each do |row|
      (0...10).each do |column|
        neighbours_count = neighbours(row,column) #Decidiendo si cada célula vive, revive, muere o se reproduce. 
            #Una célula viva  que tenga menos de 2 vecinas vivos, muere
        if status_cell(row,column) == true && neighbours_count <2 
          change_cell_state(row,column)
              #Una célula viva con dos o tres vecinas vivas pasa a la siguiente generación, vive
        elsif status_cell(row,column) == true && neighbours_count  ==2 || neighbours_count == 3 
              #Una célula viva, si sus vecinos vivos son 1 o 4 +
        else status_cell(row,column) == false && neighbours_count  == 1 || neighbours_count >= 4
          change_cell_state(row,column)
        end
      end
    end
    @board = @board_next
  end
  
  def change_cell_state(row,column)
    if !status_cell(row,column)
      @board_next[row][column] = 1
    end
  end

  def play
    i = 0
    print_board
    while i < 1000 
    sleep(0.2)
     rules 
      print_board
    end
  end 
end

new_board = CreatesBoard.new
new_board.play 
