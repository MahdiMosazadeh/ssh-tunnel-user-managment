#!/bin/bash
#Auther "Mahdi Mosazadeh"
#Telegram -> @persvens
#Github : https://github.com/MahdiMosazadeh
clear
echo "**************************************"
echo "         SSH User Management"
echo "**************************************"
echo ""
echo "User Managment :"
echo " 1 : Add User"
echo " 2 : Del User"
echo " 3 : Show All Users"
echo " 4 : Show Specific User"
echo " 5 : Conut Users"
echo ""
echo "Users Monitoring :"
echo " 6 : Show Online Users"
echo " 7 : Show Online SSH Connection"
echo " 8 : Show Specific User Is Online ?"
echo ""
echo "Users Traffic Usage & Managment :"
echo " 9 : Show Users Traffic Usage"
echo " 10 : Set Traffic Limit For Specific User"
echo " 11 : Set Time Limit For Specific User"
echo ""

while [ 1 ]
do
        echo ""
        read -p "Enter Your Operator :" operator
        echo ""
                if [ $operator == 1 ]
                then
                      read -p "Enter Username :" userName
                      read -p "Enter Password :" -s passWord
                      useradd -p $(openssl passwd -1 $passWord) $userName
                      echo "User Is Added ."
                elif [ $operator == 2 ]
                then
                      read -p "Enter Username For Delete :" deleteUser
                      deluser $deleteUser
                elif [ $operator == 3 ]
                then
                      cat /etc/shadow | grep '^[^:]*:[^\*!]' | cut -d : -f 1

                elif [ $operator == 4 ]
                then
		      read -p "Enter UserName You Want :" userNameSpecific
                      cat /etc/passwd | grep $userNameSpecific
                elif [ $operator == 5 ]
                then
                      echo "The Number Of Users is : "
                      cat /etc/shadow | grep '^[^:]*:[^\*!]' -c
                elif [ $operator == 6 ]
                then
                     echo "Online Users :"
                     ps aux | grep ssh | grep -Eo '^[^ ]+' | sort | uniq
                elif [ $operator == 7 ]
                then
                     echo "Online SSH Connections :"
                     ps aux | grep ssh
                elif [ $operator == 8 ]
                then
                    read -p "Enter Your Username You Want :" userOnline
                    ps aux | grep ssh | grep $userOnline
                else
                        echo "Select Some Operator From Above List :"
                fi
done
