#!/usr/bin/fish

# How to:
# fish find_errors.fish [output] [string of a command to run the program, using @@ for the file name]
# should be run in a directory that contains a crashes directory somewhere inside it (or recrusively buried inside it)
# logs errors to [output], also writes unique errors to stdout as well as appending them to the output file

# Example:
# ./errors.fish out.txt "~/my_program @@"

echo "" > $argv[1];
for i in **/crashes/id*;
  echo -e "backtrace\nquit"                                                     \
  | fish -c "gdb --quiet -ex 'run' --args "(echo $argv[2] | sed "s/@@/"$i"/g")  \
  | tee -a $argv[1];
end | grep --text "^(gdb) #0" | sort | uniq | tee -a $argv[1]
