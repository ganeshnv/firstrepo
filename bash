Bash


.bash_profile

variable declaration 
EX: Export test="value"   -- without export, it won't work on another terminal

.bashrc

alias declaration
Ex: alias l="ls -lrt" -- it will work all terminal, export not required


.bash_logout (not a default file)

will execute while exit the bash terminal


[root@localhost / ]# echo 'my present dworking directory $(pwd)'
my present dworking directory $(pwd)
[root@localhost hosting]# echo " my present dworking directory $(pwd)"
 my present dworking directory /hosting
[root@localhost hosting]# echo " my present dworking directory `pwd`"
 my present dworking directory /hosting
[root@localhost hosting]#


Foreground & Background

[root@localhost hosting]# sleep 60   --- run command in foreground
^Z                                         --- ctrl+z
[1]+  Stopped                 sleep 60
[root@localhost hosting]# bg %1      --- start at background
[1]+ sleep 60 &
[root@localhost hosting]# fg %1      --- again start at foreground
sleep 60
^C
[root@localhost hosting]#



[root@lva68bdcgsas01v hosting]# test -f nohup.out && echo "found the file"
found the file
[root@lva68bdcgsas01v hosting]# test -f nohup && echo "found the file"
[root@lva68bdcgsas01v hosting]# test -f nohup || echo "found the file"
found the file


Heredocs

[root@lva68bdcgsas01v hosting]# cat <<EOT > test
> first line
> second line
> It's enough
> EOT
[root@lva68bdcgsas01v hosting]# cat test
first line
second line
It's enough
[root@lva68bdcgsas01v hosting]#


stdin & stdout

[root@lva68bdcgsas01v ~]# ls pboutput os-update.sh test > save.txt
ls: cannot access test: No such file or directory
[root@lva68bdcgsas01v ~]# cat save.txt
os-update.sh
pboutput
[root@lva68bdcgsas01v ~]# ls pboutput os-update.sh test 2> save.txt
os-update.sh  pboutput
[root@lva68bdcgsas01v ~]# cat save.txt
ls: cannot access test: No such file or directory
[root@lva68bdcgsas01v ~]#
[root@lva68bdcgsas01v ~]#
[root@lva68bdcgsas01v ~]# ls pboutput os-update.sh test >& save.txt
[root@lva68bdcgsas01v ~]# cat save.txt
ls: cannot access test: No such file or directory
os-update.sh
pboutput
[root@lva68bdcgsas01v ~]# ls pboutput os-update.sh test > save.txt 2>&1
[root@lva68bdcgsas01v ~]# cat save.txt
ls: cannot access test: No such file or directory
os-update.sh
pboutput
[root@lva68bdcgsas01v ~]# ls pboutput os-update.sh test > save.txt 2>/dev/null
[root@lva68bdcgsas01v ~]# cat save.txt
os-update.sh
pboutput
[root@lva68bdcgsas01v ~]#
