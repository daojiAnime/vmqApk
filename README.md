
<div align="center">

# vmq-fastapi-android


![GitHub License](https://img.shields.io/github/license/daojiAnime/vmqApk)
[![GitHub stars](https://img.shields.io/github/stars/daojiAnime/vmqApk.svg)](https://github.com/daojiAnime/vmqApk/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/daojiAnime/vmqApk.svg)](https://github.com/daojiAnime/vmqApk/network)
[![GitHub issues](https://img.shields.io/github/issues-raw/daojiAnime/vmqApk)](https://github.com/daojiAnime/vmqApk/issues)
![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/daojiAnime/vmqApk/total)

</div>

## 感谢
本项目需要对多租户进行支持，所以需要对原作者的代码进行修改。不支持原版本控制中台。

感谢原作者 [szvone](https://github.com/szvone) 的 [vmqApk](https://github.com/szvone/VmqApk) 项目，此项目最早的版本。

感谢 [zwc456baby](https://github.com/zwc456baby) 的 [vmqApk](https://github.com/zwc456baby/vmqApk) 项目，本项目基于此项目进行修改。


## Android 15 新限制

请注意，Android 15 新系统，对app权限进一步限制，需要打开usb调试模式，使用adb执行shell命令：

```
appops set com.vone.qrcode RECEIVE_SENSITIVE_NOTIFICATIONS allow
```

手动授予 `RECEIVE_SENSITIVE_NOTIFICATIONS`  权限，才能正常监听某些 支付宝 消息，否则会导致漏单等情况。这是Android15 新加入的限制，目前没有其他办法绕过

> 部分消息会被系统拦截，部分消息能够正常监听，这是新系统的默认行为，并非软件无法监听。手动授予权限后，才能监听到完整的通知消息
> Android 14 以及低版本没有这个限制

## 简介

此处为fork自原作者的修改版
主要修改增加几项功能：

1. 支持开机自启(国内定制系统需手动开启自启权限)
2. 支持post失败后再重试一次(这次重试是强制亮屏的)
3. ios设备可以找一台安卓设备-》绑定店员进行收款通知了

优化功能：

1. 优化了里面大量的 okhttp 的访问，做成了单例,防止某些情况下可能导致的内存溢出、错误崩溃等等
2. 增加了一次网络重试（没有做三次、四次是防止重复提交导致订单出问题），而且是唤起到前台的网络重试，（之所以唤起到前台，是测试过小米等机型，如果app长时间在后台（6小时以上），app会被限制网络，除非启动前台Service或者Activity

修改版特点：可以装在自己的日用安卓机器上，不用专门找一台机器亮屏挂机了。因为修改版支持错误重试，如果装在日用机器上推送失败，软件会强制打开一个前台Service以及一个前台Activity

前台页面的打开需要手动开启两项权限：后台弹出页面、锁屏显示

> 在使用过程中，可以将屏幕关闭，省电，然后在收到支付信息后，软件会自动的打开前台并推送支付信息。
> 软件里面的心跳本来想移除用来省电的，但基于可靠性，虽然心跳会略微增加耗电，但还是没有去除

---

**以下赞助链接采用此系统搭建，您可以随时赞助测试其稳定性：**

[赞助链接](https://card.zwc365.com/p/2eyzmzlwcdc076wm8zc2)

如果 APK 出现什么问题，不兼容你的手机或新版支付宝，可以从赞助链接与我反馈

## 说明
 + 请部署完成后访问后台，有详细的Api说明

## 注意

  + 本系统原理为监控收款后手机的通知栏推送消息，所以请保持微信/支付宝/V免签监控端后台正常运行，且添加到内存清理白名单！

  + v免签面向用户是个人开发者，如果您不懂如何开发网站，那么v免签不适合您的使用！

  + v免签的原理是监控手机收到收款后的通知栏推送信息，所以不适合于商用多用户的情况，如果您想用于商用，请二次开发！

  + v免签是免费开源产品，所有程序均开放源代码，所以不会有收费计划，因此作者不可能教会每个人部署安装，请参考文档多百度谷歌，v免签使用具有一定的技术门槛，请见谅！

  + v免签的监控端并不适配所有手机，遇到手机无法正常使用的时候，请您更换手机或使用模拟器挂机！
  + 
  + 正常的安装步骤简略如下
    + 下载服务端部署(GitHub中下载的为最新版)
    + 登录网站后台更改系统设置
    + 打开网站后台监控端设置
    + 下载监控端
    + 安装监控端后使用手动配置或扫码配置
    + 监控端中点击开启服务跳转到辅助功能中开启服务
    + 开启服务后返回v免签点击检测监听权限
    + 如果显示监听权限正常，至此安装完毕，如果只收到通知栏推送的测试通知，则系统不兼容无法正常监听
    + 如果显示监听权限正常，还是无法正常运行，那么请确定微信是否关注 “微信支付”这个公众号


  + v免签支持的通知有：
    + 支付宝个人收款的推送通知
    + 支付宝商家二维码的收款推送通知
    + 支付宝店员通绑定的店员账号收款的推送通知
    + 微信二维码收款推送通知
    + 微信店员收款推送通知
    + 微信收款商业版收款推送通知
    + 微信收款商业版店员到账收款通知

## 版权信息

遵循 MIT License 开源协议发布，并提供免费使用，请勿用于非法用途。
协议延续 V免签 协议，不做修改。

