#include "read_stdin.h"
#include <iostream>
#include <string>

char *read_stdin()
{
    std::string contents = "";
    std::string line;
    while (std::getline(std::cin, line)) {
        contents += line + "\n";
    }
    return contents.c_str();
}
