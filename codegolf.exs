words = %{1 => "Head,", 2 => "shoulders,", 3 => "knees", 4 => "and", 5 => "toes", 6 => "eyes", 7 => "ears", 8 => "mouth", 9 => "nose"}

lines = [[1,2,3,4,5], [3,4,5], [1,2,3,4,5], [3,4,5], [4,6,4,7,4,8,4,9], [1,2,3,4,5], [3,4,5]]

defmodule CodeGolf do

def print_line([index | []], words),    do:  words[index]
def print_line([index | rest], words),         do:  
        words[index] <> " " <> print_line(rest, words)

def print_verse([line | []], words),     do: print_line(line, words)
def print_verse([line | rest], words), do: 
        print_line(line, words) <> "\n" <> print_verse(rest, words)

end


IO.puts CodeGolf.print_verse(lines, words)
