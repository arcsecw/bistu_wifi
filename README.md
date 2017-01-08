##mac下实现连接bistu后自动登录

> 登录bistu wifi 每次都得打开浏览器登录很烦。我想要让BISTU像自己家wifi一样连接既可用。

> **概述**   

> 1使用curl post你的用户名密码 到 https://1.1.1.1/login.html 即可完成登录。

> 2使用control panel 可以持续监测你的mac，一旦连接到了bistu就执行curl完成登录动作

> 感谢 https://github.com/billhu1996 修改shell


```
git clone git@github.com:arcsecw/bistu_wifi.git
cd bistu_wifi
```

- ###下载安装ControlPlane
  
  这个软件很小 [官网链接](https://www.controlplaneapp.com/)
  研究这个的都是懒人，所以你可以偷懒不用下载了，我把软件放到这个项目里了。
  安装后别打开（打开影响也不大）

   

- ###将你的用户名密码写入到项目的./login.sh 中
    脚本很简单，地球人都能看懂。
    ```
    #!/bin/bash
    #login
    
    username=你的用户名
    password=你的密码
    
    data="buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=&network_name=Guest+Network&username="$username"&password="$password
    curl -d $data "https://1.1.1.1/login.html"

    ```

- 打开终端导入我保存的配置

 ```
    defaults delete com.dustinrue.ControlPlane
defaults import com.dustinrue.ControlPlane ./com.dustinrue.ControlPlane.plist
    ```

- 打开软件
  将此图中的shellScript地址手动修改为本项目中login.sh 的 **绝对地址** 

    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi9.png)

    完事

- 你可以把 login.sh 跟logout.sh 改一下执行权限放到path 里 然后你就能酷酷的在终端里输入login.sh 完成登录 输入logout.sh 完成登出了。