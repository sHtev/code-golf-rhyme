w = ["Head,", "shoulders,", "knees and", "toes", "and eyes", "and ears", "and mouth and", "nose"]
r = ["...,", "...,", "... ...", "...", "... ...", "... ...", "... ... ...", "..."]

lines = [[1,2,3,4], [3, 4], [1,2,3,4], [3, 4], [5, 6, 7, 8], [1,2,3,4], [3,4]]

defmodule CodeGolf do

def gen_words(_, _, []), do: []
def gen_words(_, 0, rest), do: rest
def gen_words([replacement| r_rest], n, [_|rest]), do:
    [replacement | gen_words(r_rest, n-1, rest)]

def print_line([index | []], words),    do:  words[index]
def print_line([index | rest], words),         do:  
        words[index] <> " " <> print_line(rest, words)

def print_verse([line | []], words),     do: print_line(line, words)
def print_verse([line | rest], words), do: 
        print_line(line, words) <> "\n" <> print_verse(rest, words)


def print_song(lines, replace, words, 0),        do:
    print_verse(lines, Enum.into(Enum.zip([1,2,3,4,5,6,7,8], gen_words(replace, 8, words)), %{}))

def print_song(lines, replace, words, n),        do:
    print_verse(lines, Enum.into(Enum.zip([1,2,3,4,5,6,7,8], gen_words(replace, 8-n, words)), %{})) <> "\n\n" <> print_song(lines, replace, words, n-1)

end




IO.puts CodeGolf.print_song(lines, r, w, 8)
