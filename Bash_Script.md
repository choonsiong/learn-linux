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
    - `if`
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
    - `case`
        ```
        echo -n "Yes/no? "
        read answer
        case $answer in
            y | yes) echo "yes";;
            n | no) echo "no";;
            *) echo "Invalid input";;
        esac
        ```    
- Loops using `for`, `while`, `until`
    - `for`
        ```
        foobar@debian12:~$ for c in a b c; do echo $c; done
        a
        b
        c
        foobar@debian12:~$

        foobar@debian12:~$ 
        foobar@debian12:~$ ls
        foobar@debian12:~$ 
        foobar@debian12:~$ touch file{1..10}.txt
        foobar@debian12:~$ 
        foobar@debian12:~$ ls
        file1.txt  file10.txt  file2.txt  file3.txt  file4.txt  file5.txt  file6.txt  file7.txt  file8.txt  file9.txt
        foobar@debian12:~$ 
        foobar@debian12:~$ for f in *.txt; do cp "$f" "$f.bak"; done
        foobar@debian12:~$ 
        foobar@debian12:~$ ls
        file1.txt      file10.txt      file2.txt      file3.txt      file4.txt      file5.txt      file6.txt      file7.txt      file8.txt      file9.txt
        file1.txt.bak  file10.txt.bak  file2.txt.bak  file3.txt.bak  file4.txt.bak  file5.txt.bak  file6.txt.bak  file7.txt.bak  file8.txt.bak  file9.txt.bak
        foobar@debian12:~$ 

        # Set the IFS so that file names with spaces also work correctly when passed to a script from command line
        IFS=$'\n'
        for file in $*; do
            cp "$file" "$file.bak"
        done

        for db in $(cat dbs.txt); do
            mysqldump $db | gzip -c > $db.sql.gz
        done

        for i in {1..12}; do
            echo "$i"
        done

        # step 3
        for i in {1..100..3}; do
            echo "$i"
        done

        for ((i=0; i<10; i++)); do
            echo "$i"
        done    
        ```        
- Function using `function`
- The `test` command - short notation `[ expression ]` or `[[ expression ]]`
    - `test "$x"` - checks whether `x` is in use. The result is false if the string has 0 characters, otherwise it is true.
    - `test $x -gt 5` - checks whether the `x` variable contains a numerical value greater than 5. If `x` does not contain a number, an error message occurs.
        - `-eq`
        - `-ne`
        - `-lt`
        - `-le`
        - `-ge`
            ```
            foobar@debian12:~$ 
            foobar@debian12:~$ a=42
            foobar@debian12:~$ test $a -eq 42; echo $?
            0
            foobar@debian12:~$ test $a -ne 42; echo $?
            1
            foobar@debian12:~$
            ```        
    - `test -f $x` - checks whether a file with the name specified in `x` exists
    - additional test options
        - `[[ s = pattern* ]]` - true if the string starts with `pattern`
        - `[[ s == pattern* ]]` - as above
        - `[[ s ~= pattern ]]` - true if the regular pattern is true
        - `[[ s1 && s2 ]]` - true if both conditions are true
        - `[[ s1 || s2 ]]` - true if one of the conditions is true