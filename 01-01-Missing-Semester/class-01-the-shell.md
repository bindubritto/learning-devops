# Missing Semester | Lecture 1: Course Overview + The Shell

```sh
date
```

```sh
echo
```

Backward slash for space separated things

```sh
echo hello\ world
```

For finding program location

```sh
which
```

For Change Directory

```sh
cd
```

Present working directory

```sh
pwd
```

Current directory

```sh
.
```

Parent directory

```sh
..
```

User Home directory

```sh
~
```

Root directory of file-system

```sh
/
```

List

```sh
ls
```

Will go to learning folder

```sh
cd ~/Desktop/learning
```

Previous directory

```sh
cd -
```

Program with argument

```sh
ls --help
```

```sh
drwxrwxrwx
d is stand for directory
rwx (read, write, execute) for the owner of the directory.
rwx for the group associated with the directory.
rwx for others (everyone else).
```

Move file or directory

```sh
mv old new
```

Copy

```sh
cp old new
```

Manual

```sh
man another-program
```

Writing something using stream. Every program have input stream and output stream.
The default input stream is terminal and output stream is terminal

```sh
< means input redirection.
> means output redirection.

```

Write output of echo program to hello.txt

```sh
echo "hello world" > hello.txt
```

Take input from hello.txt

```sh
cat < hello.txt
```

Will copy the contents of one file ("hello.txt") to another file ("hello2.txt") using the "cat" command and input/output redirection

```sh
cat < hello.txt > hello2.txt
```

append

```sh
>>
```

Pipe | Take the output from the program of left and make them (output) as input to the program of right

```sh
ls -la | tail -n1
```

Here, ls -la will print what it print, then the output will be the input of tail, and it will print n (number) of line, in our case 1

We can use more pipe there, like

```sh
ls -la | tail -n3 > ls.txt
```

Here is an example of more advanced chaining or use of pipe

```sh
curl --head --silent google.com
```

Output will look like this

```sh
HTTP/1.1 301 Moved Permanently
Location: http://www.google.com/
Content-Type: text/html; charset=UTF-8
Content-Security-Policy-Report-Only: object-src 'none';base-uri 'self';script-src 'nonce-kMCk_-9Q_s0O0u8H1EMolg' 'strict-dynamic' 'report-sample' 'unsafe-eval' 'unsafe-inline' https: http:;report-uri https://csp.withgoogle.com/csp/gws/other-hp
Date: Mon, 06 Nov 2023 02:30:34 GMT
Expires: Wed, 06 Dec 2023 02:30:34 GMT
Cache-Control: public, max-age=2592000
Server: gws
Content-Length: 219
X-XSS-Protection: 0
X-Frame-Options: SAMEORIGIN

```

We will try to search some content here using grep program. grep is a program that search in a input stream.

```sh
curl --head --silent google.com | grep --ignore-case content-length

same as

curl --head --silent google.com | grep -i content-length 
```

More chaining. This will output the second field (f2) of the content-length header which is 219 in our case.
Here, we used cut command as 3rd program by chaining or pipe operator.

```sh
curl --head --silent google.com | grep -i content-length | cut -d ' ' -f2 
```

Root User => user id is 0.
When we need to run any command as super user, we will use sudo command

```sh
sudo // do as su(super user)
```

This will change our actions as super user.

```sh
sudo su
```

```sh
$ means normal user
'#' means super user
```

## Abhisekh Veermalla

```sh
Memory
free -g

CPU
nproc

Disc
df -h
```
