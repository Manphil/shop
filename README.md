# 商城
- 开发环境：IDEA、Tomcat8.5
- 数据库：MySql
- 前端主要使用Bootstrap以及JQuery，后端基于SpringMVC、Spring、MyBatis进行开发，使用Maven构建

> ## 相关问题
> 1. 图片存储使用到了intellij的虚拟路径，参考[在intellij IDEA中为web应用创建图片虚拟目录](http://blog.csdn.net/h3243212/article/details/50819218)，然后在本地项目的同级目录下(即本地的shop项目所在目录)建立shopimage目录（目录名随意），然后在该项目中添加一个虚拟目录，虚拟目录名为shopimage。

> 2. 若项目部署到tomcat中，则需要在tomcat的webapp目录中(即shop项目所在目录)建立shopimage目录用以保存图片。

> 3. 聊天使用了activemq，需要先下载安装，然后开启服务，即可使用。

> 4. 如果修改个人信息地址不成功的，报404错误，在IDEA的工具栏的运行配置Edit Configuration里面的Deployment选项中war explode中的Application Context中的"/"改成"/shop"即可


***如果还有其他Bug，请提Issues或邮件联系。***
