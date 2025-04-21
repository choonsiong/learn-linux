#!/bin/bash

x=() # declare an empty array

x[0]='a'
x[1]='b'
x[2]='c'

echo ${x[0]} # prints 'a'
echo ${x[1]} # prints 'b'
echo ${x[2]} # prints 'c'

echo ${x[@]} # prints 'a b c'
echo ${#x[@]} # prints 3

echo ${#x[0]} # prints 1
echo ${#x[1]} # prints 1
echo ${#x[2]} # prints 1

echo ${!x[@]} # prints 0 1 2

x=('a', 'b', 'c') # declare an array with 3 elements

echo ${x[0]} # prints 'a'
echo ${x[1]} # prints 'b'
echo ${x[2]} # prints 'c'