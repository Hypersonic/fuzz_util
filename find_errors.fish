#!/usr/bin/fish

# fish find_errors.fish [output] [command that takes input file name as arg]
# should be run in a directory that contains a crashes directory somewhere inside it (or recrusively buried inside it)
# logs errors to [output], also writes unique errors to stdout as well as appending them to the output file

echo "" > $argv[1];
for i in **/crashes/id*;
  echo -e "backtrace\nquit"                                 \
  | gdb --quiet -ex "run" --args $argv[2..(count $argv)] $i \
  | tee -a $argv[1];
end | grep --text "^(gdb) #0" | sort | uniq | tee -a $argv[1]
