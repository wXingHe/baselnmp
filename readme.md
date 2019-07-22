# 一个完整的Lnmp docker 环境

# A complete docker environment for lnmp 

## 在.env中可以配置php和mysql的版本和root密码，在网站（即html中）下请使用 db 为host链接mysql

## You can set mysql version、 php version and the password of root in file .env, you can use 'db' to link mysql for host.

## 请在安装完docker后在 当前目录运行 

## After install docker, you can run it by

``` shell 

  docker-compose up -d

```

## 网站根目录在nginx/html, mysql和nginx的配置文件在各自的conf.d下
## The webroot is nginx/html, the config files of mysql and nginx are under thire conf.d.


# 如果需要更多功能，比如一键启动，关闭，nginx的虚拟主机，php 安装扩展的简易脚本等，请提issue.

# If You need more features, like sample starting, ending, and vhost of nginx, sample installation for php extension, please pull issue.  