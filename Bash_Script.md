# `bash` Script

- Scripts are text files that contain Linux and `bash` commands.
- Scripts can contain branches, loops, and functions.
    - This means that `bash` is a simple programming language.
- The first line of the bash script is called *shebang* or *hashbang* and starts with the `#!` character combination. This is followed by the path to the interpreter that will execute the following code.
- Shell scripts can only be executed if the access bits for read access (r) and execution (x) are set `chmod +x myscript`.
- `exit` terminates the running script, and thus the script returns the return value of the last executed command.
    - you can explicitly pass a value to `exit`
        - `0` - no error
        - `1` - general error
        - `2` - error in the passed parameters
- `set -e` to abort the script at the first error
    ```
    #!/bin/bash -e
    # this script will abort at the first error
    ...
    ...
    ```
- `shift` - this command virtually pushes the passed parameters through  the ten variables `$0` to `$9`.
    - e.g., if you execute `shift 9`, the first nine parameters passed to the program are lost, but then the next nine parameters can be conveniently addressed
    - shift without further specification shifts the parameter list by one parameter
- Arrays
    - up to and including version 3, the index must be a number
    - `${field[n]}` syntax for accessing the nth element
- Create branches using `if`, `case`
    ```
    if [ $# -ne 2 ]; then
        echo "Two parameters are required: <username> <password>"
        exit 2
    else
        username=$1
        password=$2
        echo "Username is: $username"
        echo "Password is: $password"
    fi
    ```
- Loops using `for`, `while`, `until`
- Function using `function`
- The `test` command
    - `test "$x"`