# README
各种设计模式Design pattern(ViewModel等)的整理及比较

[TOC]



## 一、MVVM中的ViewModel设计

这里我将主要采用`block`、`delegate`、`KVO`、`RAC`四种方式介绍ViewModel的设计。
详情请查看：[CJViewModelDemo](https://github.com/dvlproad/DvlproadDesignPatternCollect/blob/master/CJViewModelDemo) 中 [ViewModelDemos 文件夹下的代码](https://github.com/dvlproad/DvlproadDesignPatternCollect/tree/master/CJViewModelDemo/CJViewModelDemo/Module/ViewModelDemos)。





## 二、ViewModel设计中的监听坑(RAC、KVO)
这里将主要介绍如果你使用RAC或者KVO设计ViewModel的时候，有哪些坑是你一定要注意的。

详情请查看：[让你不知道怎么死的RAC.md](https://dvlproad.github.io/Architecture架构/架构相关/1架构细节/你真的会用RAC吗/)

该部分也分别用代码验证了这些坑的存在，代码位置为[CJViewModelDemo](./CJViewModelDemo)中对应的部分。如：

* [文本框双向绑定的坑](./CJViewModelDemo/CJViewModelDemo/BindTextFieldDemo(文本框绑定))
* [监听属性的坑](./CJViewModelDemo/CJViewModelDemo/BindPropertyDemo(监听属性的时机))
* [监听数组的坑](./CJViewModelDemo/CJViewModelDemo/ListenArrayDemo(监听数组))
* [监听selected的使用示例](./CJViewModelDemo/CJViewModelDemo/ListenSelectedDemo)



## 三、UITextField的坑
#### 1、无法弹出第三方键盘

可能原因分析：

* APP内部被全局禁止了第三方键盘
* APP使用了自定义的键盘
* 设置了**UITextField的secureTextEntry属性**

可参考文章：

> [iOS开发禁用第三方键盘，强制使用系统键盘](https://www.jianshu.com/p/35219655d187)



## 四、结束语