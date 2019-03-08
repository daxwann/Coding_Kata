# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

require 'rspec'

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  count = 0
  grid.each_with_index do |row, i|
    row.each_with_index do |col, j|
      next if col == '0'
      count += 1
      erase_island(grid, [i, j])
    end 
  end
  return count   
end

def erase_island(grid, coord)
  y, x = coord
  return if x < 0 || y < 0 ||  x >= grid[0].count || \
    y >= grid.count || grid[y][x] == '0'
  grid[y][x] = '0'
  erase_island(grid, [y - 1, x]) 
  erase_island(grid, [y + 1, x])
  erase_island(grid, [y, x - 1])
  erase_island(grid, [y, x + 1])
end
# rspec
describe 'num_islands' do
  it 'returns 1 island' do
    grid = [
      ['1', '1', '1', '1', '0'],
      ['1', '1', '0', '1', '0'],
      ['1', '1', '0', '0', '0'],
      ['0', '0', '0', '0', '0']
    ]

    expect(num_islands(grid)).to eq(1)
  end

  it 'returns 3 islands' do
    grid = [
      ['1', '1', '0', '0', '0'],
      ['1', '1', '0', '0', '0'],
      ['0', '0', '1', '0', '0'],
      ['0', '0', '0', '1', '1']
    ]

    expect(num_islands(grid)).to eq(3)
  end

  it 'returns 1 island' do
    grid = [["1","1","1"],["1","0","1"],["1","1","1"]]

    expect(num_islands(grid)).to eq(1)
  end
end
