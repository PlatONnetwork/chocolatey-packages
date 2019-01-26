## Chocolatey介绍

简单来说，Chocolatey就是Windows系统的yum或apt-get。


### Chocolatey介绍

Chocolatey是一款专为Windows系统开发的、基于NuGet的包管理器工具，类似于Node.js的npm，MacOS的brew，Ubuntu的apt-get，它简称为choco。Chocolatey的设计目标是成为一个去中心化的框架，便于开发者按需快速安装应用程序和工具。

Chocolatey的官网： https://chocolatey.org/.

### Chocolatey安装

要安装Chocolatey很容易，必须以管理员权限打开cmd.exe命令行提示，执行如下内容：

```
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

还有一种安装方法，使用PowerShell，同样必须以管理员权限打开PowerShell，执行如下命令：

```
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
```

### Chocolatey用法

1.命令

- search : 搜索包 choco search something
- list   : 列出包 choco list -lo
- install: 安装 choco install baretail
- pin    : 固定包的版本，防止包被升级 choco pin windirstat
- upgrade：安装包的升级 choco upgrade baretail
- uninstall：安装包的卸载 choco uninstall baretail

2.常用的一些命令

1）列出本地已安装的包

```
choco list --local-only
```

2）列出Windows系统已安装的软件

```
choco list -li
```

或使用

```
choco list -lai
```

3）升级所有已安装的包

```
choco upgrade all -y
```

## PlatON打包

### 创建
1. 修改当前路径下的`xxxxx.nuspec`文件中的版本、release信息
2. 替换`tools/`下的`xxxxx.zip`包，注意将旧版本的二进制包删除
3. 更新`tools/chocolateyinstall.ps1`中的包信息
4. 更新`tools/VERIFICATION.txt`中的`Download链接`与`checksum`
5. 在最上层目录下执行以下命令

```
choco pack
```

该命令生成文件platon.xxx.nupkg。

### 测试
在`.nupkg`文件所在目录执行以下命令进行测试

```
choco install platon -dv -s .
choco install platon -dv -s . --force
choco install platon -dv -s "'.;https://chocolatey.org/api/v2/'"
```

### PlatON包上传
上传安装包到[chocolatey](https://chocolatey.org), 需要先创建账号并获取到`api key`

在`.nupkg`文件所在目录下执行以下命令进行上传

```
choco apikey -k xxxxxxxx
choco push --source https://chocolatey.org/
```

上传成功后需要通过审核和测试后才能使用。


***可能会遇到的问题***

1. <font style="color:red"> Failed to process request. 'The package platon have a previous version in a submitted state, and no approved stable releases.'.</font>

```
要等待chocolatey aproved。或者更换一个id。
```

2. <font style="color:red"> You must specify both 'source' and 'key' to set an api key.</font>

```
choco apikey -k xxxxxxxx --source https://chocolatey.org/
```


### PlatON包安装
上传成功后，可以通过以下命令进行安装，注意需要在PowerShell命令行中使用：

```
choco install platon
```

In fact, we intend to use this id to submit a package, but that cannot upgrade before appored, so we changed another.

Can you help me to remove this package?

Thanks.
