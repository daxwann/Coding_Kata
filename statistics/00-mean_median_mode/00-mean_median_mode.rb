# Given an array, X, of N integers, calculate and print the respective 
# mean, median, and mode on separate lines. If your array contains more 
# than one modal value, choose the numerically smallest one.

# Sample Input

# 10
# 64630 11735 14216 99233 14470 4978 73429 38120 51135 67060

# Sample Output

# 43900.6
# 44627.5
# 4978

def mmm
    size = input_size
    arr = input_arr
    mean = find_mean(size, arr)
    median = find_median(size, arr)
    mode = find_mode(size, arr)
    puts mean.to_s
    puts median.to_s
    puts mode.to_s
end

def input_size
    size = gets.chomp.to_i
end

def input_arr
    arr = gets.chomp.split(" ")
    arr.map! {|ele| ele.to_i}
end

def find_mean(size, arr)
    sum = arr.reduce(:+)
    mean = sum / size.to_f
    (mean * 1.0).round(1)
end

def find_median(size, arr)
    sorted = arr.sort
    mid = (size / 2).floor
    if size % 2 == 0
        median = sorted[(mid - 1)..mid].reduce(:+) / 2.0
    else
        median = sorted[mid]
    end
    (median * 1.0).round(1)
end

def find_mode(size, arr)
    hash = Hash.new
    arr.each do |ele|
        if hash[ele]
            hash[ele] = hash[ele] + 1
        else
            hash[ele] = 0
        end
    end
    sorted = hash.sort_by {|key, val| [-val, key]}
    sorted.first[0]
end

mmm