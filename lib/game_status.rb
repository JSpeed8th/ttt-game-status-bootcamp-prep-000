# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #mid row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #mid column
  [2,5,8], #right column
  [0,4,8], #left horizontal
  [2,4,6] #right horizontal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position1 = combo[0]
    position2 = combo[1]
    position3 = combo[2]
    if board[position1] == "X" && board[position2] == "X" && board[position3] == "X"
      true
    elsif board[position1] == "O" && board[position2] == "O" && board[position3] == "O"
      true
    else
      false
    end
  end
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    true
  elsif won?(board) == false && full?(board) == false
    false
  elsif won?(board) == true
    true
  end
end

def over? (board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  end
end
