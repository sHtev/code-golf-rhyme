words = ["Head,", "shoulders,", "knees", "and", "toes", "eyes", "ears", "mouth", "nose"]

defmodule CodeGolf do

def print_line([word | []]),         do:  word
def print_line([word | rest]),   do:  word <> " " <> print_line(rest)

end

print_verse = fn line_words ->
    IO.puts CodeGolf.print_line(line_words)
end

print_verse.(words)
