require 'minitest/autorun'

class CreatesBoard
  def setup
    @board = CreatesBoard.new
  end

  def is_an_array()
        result = @board == Array
        assert_equal result, Array
  end
  def is_rule_one_ok 
  end

  def is_rule_two_ok 
  end
  def is_rule_three_ok 
  end
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