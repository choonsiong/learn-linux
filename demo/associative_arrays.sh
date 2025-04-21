#!/bin/bash

declare -A y # declare an associative array

y[foo]='bar'
y[bar]='foo'

echo ${y[foo]} # prints 'bar'
echo ${y[bar]} # prints 'foo'

y=( ['foo']='bar' ['bar']='foo' ) # declare an associative array with 2 elements    
echo ${y[foo]} # prints 'bar'
echo ${y[bar]} # prints 'foo'