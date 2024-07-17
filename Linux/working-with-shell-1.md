# Learning Linux

pwd (print working directory)

```sh
pwd
```

cd (change directory) - it will go to home directory

```sh
cd
```

mv - move - to move file or directory | often use to remane directory

```sh
mv from to
```

cp - copy

```sh
cp from to
```

rm - remove

```sh
rm 
```

rm -r for delete a folder and insides all of it's file

```sh
rm -r for recursive
```

```sh
rm -rf for recursive & force
```

concatenation

```sh
cat filename
```

> (Output Redirection Operator)

```sh
cat > filename.txt
```

>> (Append Redirection Operator)

```sh
cat >> filename.txt
```

pagers - more, less

ls - list

```sh
ls
ls -l long list
ls -la long list with all files
ls -lt sorted based on creation time
ls -ltr  reverse sorted based on creation time
```

Help

```sh
whatis cd
man cd
cd -h
cd --help
apropos modpr

```

### BASH Shell

Shell Types

Bourne Shell (sh)
C Shell (csh or tcsh)
Korn Shell (ksh)
Z Shell (zsh)
Bourne Again Shell (bash)

```sh
echo $SHELL
```

To Change Shell

```sh
chsh
```

Set Alias

```sh
alias dt=date
```

```sh
env
export OFFICE=pathao
echo $OFFICE

echo $LOGNAME
echo $PATH
```



To add new path variable
```sh
export PATH=$PATH:path_of_executable

example

export PATH=$PATH:/opt/obs/bin
```


[~]$

~ = Present working directory
$ = User Prompt Symbol


echo $PS1

[\W]$

\W = Present working directory = ~ 



PS1="ubuntu-server:"

PS1="[\d \t \u@\h:\w ] $"



echo 'export MY_VARIABLE="example_value"' >> ~/.profile
echo 'alias ll="ls -l"' >> ~/.profile
echo 'alias up="uptime"' >> ~/.profile

echo 'export PROJECT="MERCURY"' >> ~/.profile