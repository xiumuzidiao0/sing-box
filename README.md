# 介绍

最好用的 sing-box 一键安装脚本 & 管理脚本

# 特点

- 快速安装
- 无敌好用
- 零学习成本
- 自动化 TLS
- 简化所有流程
- 兼容 sing-box 命令
- 强大的快捷参数
- 支持所有常用协议
- 一键添加 VLESS-REALITY (默认)
- 一键添加 TUIC
- 一键添加 Trojan
- 一键添加 Hysteria2
- 一键添加 AnyTLS
- 一键添加 Shadowsocks 2022
- 一键添加 VMess-(TCP/HTTP/QUIC)
- 一键添加 VMess-(WS/H2/HTTPUpgrade)-TLS
- 一键添加 VLESS-(WS/H2/HTTPUpgrade)-TLS
- 一键添加 Trojan-(WS/H2/HTTPUpgrade)-TLS
- 一键启用 BBR
- 一键更改伪装网站
- 一键自定义每个代理节点的出站出口 (SOCKS5/HTTP 链式代理)
- 原生支持标准 JSON 外部控制 API 接口 (`sing-box api`)，方便第三方系统 (如 AimiliVPN) 自动化调度
- 一键开启/管理远程文件订阅 (支持随机高位端口与随机安全路径)
- 一键更改 (端口/UUID/密码/域名/路径/加密方式/SNI/出口/等...)
- 还有更多...

# 设计理念

设计理念为：**高效率，超快速，极易用**

脚本基于作者的自身使用需求，以 **多配置同时运行** 为核心设计

并且专门优化了，添加、更改、查看、删除、这四项常用功能

你只需要一条命令即可完成 添加、更改、查看、删除、等操作

例如，添加一个配置仅需不到 1 秒！瞬间完成添加！其他操作亦是如此！

脚本的参数非常高效率并且超级易用，请掌握参数的使用

# 文档

安装及使用：https://233boy.com/sing-box/sing-box-script/

# 安装

```bash
bash <(wget -qO- -o /dev/null https://raw.githubusercontent.com/xiumuzidiao0/sing-box/main/install.sh)
```

如果无法使用 wget，可使用 curl：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/xiumuzidiao0/sing-box/main/install.sh)
```

# 帮助

使用：`sing-box help`

```
sing-box script v1.0 by 233boy
Usage: sing-box [options]... [args]...

基本:
   v, version                                      显示当前版本
   ip                                              返回当前主机的 IP
   pbk                                             同等于 sing-box generate reality-keypair
   get-port                                        返回一个可用的端口
   ss2022                                          返回一个可用于 Shadowsocks 2022 的密码

一般:
   a, add [protocol] [args... | auto]              添加配置
   c, change [name] [option] [args... | auto]      更改配置
   d, del [name]                                   删除配置**
   i, info [name]                                  查看配置
   sub, subscription [new | update | port | del]   远程文件订阅管理
   api [list | add | out | del | sub | status]     对外控制 API 接口 (JSON)
   qr [name]                                       二维码信息
   url [name]                                      URL 信息
   log                                             查看日志
更改:
   full [name] [...]                               更改多个参数
   id [name] [uuid | auto]                         更改 UUID
   host [name] [domain]                            更改域名
   port [name] [port | auto]                       更改端口
   path [name] [path | auto]                       更改路径
   passwd [name] [password | auto]                 更改密码
   key [name] [Private key | auto] [Public key]    更改密钥
   method [name] [method | auto]                   更改加密方式
   sni [name] [ ip | domain]                       更改 serverName
   new [name] [...]                                更改协议
   web [name] [domain]                             更改伪装网站
   out, outbound [name] [addr:port | direct]       更改出口 (Outbound)

进阶:
   dns [...]                                       设置 DNS
   dd, ddel [name...]                              删除多个配置**
   fix [name]                                      修复一个配置
   fix-all                                         修复全部配置
   fix-caddyfile                                   修复 Caddyfile
   fix-config.json                                 修复 config.json
   import                                          导入 sing-box/v2ray 脚本配置

管理:
   un, uninstall                                   卸载
   u, update [core | sh | caddy] [ver]             更新
   U, update.sh                                    更新脚本
   s, status                                       运行状态
   start, stop, restart [caddy]                    启动, 停止, 重启
   t, test                                         测试运行
   reinstall                                       重装脚本

测试:
   debug [name]                                    显示一些 debug 信息, 仅供参考
   gen [...]                                       同等于 add, 但只显示 JSON 内容, 不创建文件, 测试使用
   no-auto-tls [...]                               同等于 add, 但禁止自动配置 TLS, 可用于 *TLS 相关协议
其他:
   bbr                                             启用 BBR, 如果支持
   bin [...]                                       运行 sing-box 命令, 例如: sing-box bin help
   [...] [...]                                     兼容绝大多数的 sing-box 命令, 例如: sing-box generate uuid
   h, help                                         显示此帮助界面

谨慎使用 del, ddel, 此选项会直接删除配置; 无需确认
反馈问题) https://github.com/xiumuzidiao0/sing-box/issues
文档(doc) https://233boy.com/sing-box/sing-box-script/
```

# 对外控制 API 接口 (JSON)

本项目内置专为第三方系统集成（如 AimiliVPN Web 控制台）设计的无交互 JSON 控制接口，支持跨进程状态读取与自动化配置管理：

```bash
# 1. 节点列表查询 (输出 JSON 数组，包含各节点协议、端口、出口、URL等完整信息)
sing-box api list

# 2. 查询指定节点详情
sing-box api info <name>

# 3. 快速添加节点 (可指定协议、端口、UUID/密码、伪装域名及链式出口)
sing-box api add reality auto auto auto 127.0.0.1:7928

# 4. 动态更改节点出口 (支持切换直连 direct 或指定本地 SOCKS5/HTTP 代理)
sing-box api outbound all http://127.0.0.1:7928
sing-box api outbound all direct

# 5. 删除节点
sing-box api del <name|all>

# 6. 远程订阅管理
sing-box api sub get      # 获取订阅链接与节点状态
sing-box api sub sync     # 同步当前所有节点到订阅文件
sing-box api sub init     # 一键初始化并开启远程订阅服务

# 7. 服务运行状态检查
sing-box api status

# 8. 核心服务重启
sing-box api restart

# 9. 获取支持的协议列表元数据
sing-box api protocols
```
