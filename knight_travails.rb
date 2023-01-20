class Board
  attr_accessor :board
  def initialize
    @board = 
    [[0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0]]
  end

  def add(x,y)
    @board[x][y] = 1
  end

  def empty?(x,y)
    @board[x][y] == 0
  end
end

class Knight
  attr_accessor :x, :y, :prev
  def initialize(x, y, prev = nil)
    @x = x
    @y = y
    @prev = prev
  end
  
  def possible_moves
    row = [1,1,2,2,-1,-1,-2,-2]
    col = [2,-2,1,-1,2,-2,1,-1]
    moves = []
    for i in 0..7
      nx = @x + row[i]
      ny = @y + col[i]
      if nx >= 0 && nx < 8 && ny >= 0 && ny < 8
        moves << [nx,ny]
      end
    end
    moves
  end
end

def knight_moves(start,fin)
  if start == fin
    puts "You made it in 0 moves!  Here's your path:"
    p start
    return [start]
  else
    queue = []
    b = Board.new
    queue << Knight.new(start[0],start[1])
    b.add(start[0],start[1])
    while queue.length > 0
      k = queue.shift
      k.possible_moves.each do |move|
        if b.empty?(move[0],move[1])
          ck = Knight.new(move[0],move[1],k)
          if ck.x == fin[0] && ck.y == fin[1]
            path = [[ck.x,ck.y]]
            parent = ck.prev
            while parent != nil
              path << [parent.x,parent.y]
              parent = parent.prev
            end
            puts "You made it in #{path.length-1} moves!  Here's your path:"
            for i in path.reverse
              p i
            end
            return path.reverse
          else
            queue << ck
            b.add(move[0],move[1])
          end
        end
      end
    end
  end
end

knight_moves([0,0],[0,0])
knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])
knight_moves([3,3],[0,0])
knight_moves([3,3],[4,3])
