# Shell Scripting

```sh
foo=bar

echo $foo
```

```sh
echo "Value is $foo"
>>> Value is bar


echo 'Value is $foo'
>>> Value is $foo
```

```sh
$0 is the name of the script
$1 to $9 is the argument of that script
$? will get you the error code from previous command
$_ will get you the last argument of previous command
$# is the number of arguments
$$ is the process id
$@ will expand all the argument
!! will get you the last command
```

```sh
grep foobar build.sh
Search the foobar string inside of build.sh file

echo $?
It will give 0 or 1
0 means no problem, everything went good.
1 means, there had some problem.

```

```sh
false || echo "Opps fail"
```

```sh
false && echo "This will not print"
```

```sh
true || echo "Will be not be printed"
```

```sh
true && echo "Things went well"
```

```sh
false ; echo "Things will always print"
```

```sh
foo=$(pwd)
Assigning command value into a variable

echo "We are in $(pwd)"
```

```sh
cat <(ls) <(ls ..)

```

```sh

```
