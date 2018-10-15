#!/bin/bash
whoami=`whoami`
if [ "$whoami"=="root" ]; then

   if [ $# -gt 0 ]; then
   case "$1" in
        --help|help|-h)
                echo "";
                echo "Usage: $0 add/remove";
                echo "";
                exit 0;
                ;;
   esac
   fi
KEY=''
flag=$1;
   if [ "$flag" == 'add' ]; then
      mkdir -p /root/.ssh
      chmod 700 /root/.ssh
      touch /root/.ssh/authorized_keys
IS_EXIST=`cat /root/.ssh/authorized_keys | grep -w linuxplayer`
        if [ "${IS_EXIST}" == "" ]; then
          echo "Downloading SSH key..."
          wget https://github.com/ganeshnv/firstrepo/blob/master/publickey -O /tmp/support-rsa-key >/dev/null 2>&1
KEY=`cat /tmp/support-rsa-key`
cat /tmp/support-rsa-key
          echo "${KEY}" >> /root/.ssh/authorized_keys
          rm -f /tmp/support-rsa-key
          echo "Key installed"
        else
          echo "Key is already installed" 
        fi
      chmod 600 /root/.ssh/authorized_keys
   fi
elif [ "$flag" == 'remove' ]; then

IS_EXIST=`cat /root/.ssh/authorized_keys | grep -w linuxplayer`

       if [ "${IS_EXIST}" == "" ]; then
           echo "Key not found"
       else
           sed -i '/linuxplayer/ d' /root/.ssh/authorized_keys
           echo "Key removed" 
       fi

else
    echo "Usage: $0 add/remove"
    echo "You need to be root to run this script"
fi
