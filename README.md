# CDEmptyView

[![CI Status](https://img.shields.io/travis/WQ/CDEmptyView.svg?style=flat)](https://travis-ci.org/WQ/CDEmptyView)
[![Version](https://img.shields.io/cocoapods/v/CDEmptyView.svg?style=flat)](https://cocoapods.org/pods/CDEmptyView)
[![License](https://img.shields.io/cocoapods/l/CDEmptyView.svg?style=flat)](https://cocoapods.org/pods/CDEmptyView)
[![Platform](https://img.shields.io/cocoapods/p/CDEmptyView.svg?style=flat)](https://cocoapods.org/pods/CDEmptyView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
# CDEmptyView

self.tableView.cd_emptyView = [CDEmptyView emptyViewWithImageStr:@"noData"
titleStr:@"暂无数据，点击重新加载"
detailStr:@""];

PS:可对库进行二次封装，调用更简洁
//二次封装方法，调用简洁
self.tableView.cd_emptyView = [CDDIYEmpty diyNoDataEmpty];
完全低耦合，在你的项目中加入这一行代码就可集成

#### 注意点:
不管项目中是reloadData方法刷UI还是insert、delete等方式刷UI,runtime交换方法没做处理，避免项目中遇到未知问题，实现效果需要自己通过数据、网络判断展示还是隐藏。
* 如需

> 如果需要，直接把注释解除就行。
## Installation

CDEmptyView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CDEmptyView'
```

## Author

WQ, 469775163@qq.com

## License

CDEmptyView is available under the MIT license. See the LICENSE file for more info.
