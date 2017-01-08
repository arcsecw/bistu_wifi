##mac下实现连接bistu后自动登录

> 登录bistu wifi 每次都得打开浏览器登录很烦。我想要让BISTU像自己家wifi一样连接既可用。

**概述**   

1使用curl post你的用户名密码 到https://1.1.1.1/login.html即可完成登录。

2使用control panel 可以持续监测你的mac，一旦连接到了bistu就执行curl完成登录动作

**cuntrolpanel 设置其实还挺清晰**

1定义rule 来检测某种类型的系统变化

2 定义action 来设置你要执行的自定义动作

3 定义context 来关联你的rule以及action

- ###下载安装ControlPlane
  
  这个软件很小 [官网链接](https://www.controlplaneapp.com/)
  研究这个的都是懒人，所以你可以偷懒不用下载了，我把软件放到这个项目里了。

- ###将你的用户名密码写入到项目的./login.sh 中
    脚本很简单，地球人都能看懂。
    ```
    curl -d "buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=&network_name=Guest+Network&username=你的用户名&password=你的密码" "https://1.1.1.1/login.html"

    ```


- ###设置链接bistu后自动执行脚本。

    **软件正常运行后点击preferences**
    
    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi1.png)
    
    **general 里点击 start controlplane at login**
    
    **contexts里点击+号添加一个描述 用来连接你自定义的的rules 以及actions 我这里叫做login_BISTU**
    
    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi3.png)
    
    **evidence sources 里只留一个Nearby WiFi Network 因为我暂时只需要检测wifi变化**
    
    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi4.png)
    
    **rules里点击+号添加一个 wifi ssid 的rule context选择你刚才自己添加的 我这里叫login_BISTU**
    
    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi5.png)
    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi6.png)
    
    **action里点击+号添加一个system actions - run shell script 在打开的选择页面里选择login.sh context 里也选你刚才自己添加的 我这里叫BISTU**
    
    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi7.png)
    
    **Delay里选择2s 延迟个2秒再执行吧，ip如果没有获取到，登录脚本肯定要登录失败了**
    
    ![image description](http://oih1xpa8t.bkt.clouddn.com/bistu_wifi9.png)
    完事

- 你可以把 login.sh 跟logout.sh 改一下执行权限放到path 里 然后你就能酷酷的在终端里输入login.sh 完成登录 输入logout.sh 完成登出了。