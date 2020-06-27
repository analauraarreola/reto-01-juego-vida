require 'minitest/autorun'

class CreatesBoard
  def setup
    @board = CreatesBoard.new
  end

  def is_an_array()
        result = @board == Array
        assert_equal result, Array
  end

  def is_rule_one_ok(true)
    assert(false)
    if (status_cell(row,column) == true && neighbours_count <2 
    change_cell_state(row,column)) {
    test= false
    }
  end

  def is_rule_two_ok (true)
    assert(true)
    if (status_cell(row,column) == true && neighbours_count  ==2 || neighbours_count == 3){
    test= true
  }
  end
  def is_rule_three_ok (false)
    assert(false)
    if (status_cell(row,column) == false && neighbours_count  == 1 || neighbours_count >= 4
    change_cell_state(row,column)){
        test= true
    }
  end
end
