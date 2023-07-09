#!/bin/bash
#Auther "Mahdi Mosazadeh"
#Telegram -> @persvens
#Github : https://github.com/MahdiMosazadeh/ssh-tunnel-user-managment
while [ 1 ]
do
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
        echo "Exit :"
        echo " 0 : Quit Script !"
        echo ""
        
        while [ 1 ]
        do
                echo ""
                read -p "Enter Your Operator :" operator
                echo ""
                        if [ $operator == 1 ]
                        then
                              clear
                              read -p "Enter Username :" userName
                              read -p "Enter Password :" -s passWord
                              useradd -p $(openssl passwd -1 $passWord) $userName
                              echo "User Is Added ."
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 2 ]
                        then
                              clear
                              echo "This Is All Users You Have :"
                              cat /etc/shadow | grep '^[^:]*:[^\*!]' | cut -d : -f 1
                              read -p "Enter Username For Delete :" deleteUser
                              deluser $deleteUser
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 3 ]
                        then
                              clear
                              echo "All Users :"
                              cat /etc/shadow | grep '^[^:]*:[^\*!]' | cut -d : -f 1
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 4 ]
                        then
                              clear
                	      read -p "Enter UserName You Want :" userNameSpecific
                              cat /etc/passwd | grep $userNameSpecific
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 5 ]        
                        then
                              clear
                              echo "The Number Of Users is : "
                              cat /etc/shadow | grep '^[^:]*:[^\*!]' -c
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 6 ]
                        then
                              clear
                              echo "Online Users :"
                              ps aux | grep ssh | grep -Eo '^[^ ]+' | sort | uniq
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 7 ]
                        then
                              clear
                              echo "Online SSH Connections :"
                              ps aux | grep ssh
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 8 ]
                        then
                              clear
                              read -p "Enter Your Username You Want :" userOnline
                              ps aux | grep ssh | grep $userOnline
                              read -p "Enter Any Key To Back :" fakedata
                              break
                        elif [ $operator == 0 ]
                        then
                              echo "** Bye Bye **"
                              exit
                        else
                              break
                        fi
        done
done
