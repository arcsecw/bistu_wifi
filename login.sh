#!/bin/bash
#login in
username=你的用户名
password=你的密码
curl -d "buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=&network_name=Guest+Network&username=`echo -n $username`&password=`echo -n $password`" "https://1.1.1.1/login.html"
