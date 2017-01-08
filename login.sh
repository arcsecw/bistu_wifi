#!/bin/bash
#login

username=你的用户名
password=你的密码

data="buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=&network_name=Guest+Network&username="$username"&password="$password
curl -d $data "https://1.1.1.1/login.html"
