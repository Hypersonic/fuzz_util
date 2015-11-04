# fish find_errors.fish [command that takes input file name as arg]
# logs output to out.txt, also writes unique errors to stdout as well as appending them to out.txt
rm out.txt;touch out.txt;for i in id*;echo -e "backtrace\nquit"|gdb --quiet -ex "run" --args $argv $i |tee -a out.txt;end|grep --text "^(gdb) #0" |sort |uniq | tee -a out.txt
