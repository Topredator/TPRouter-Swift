# TPRouter-Swift

[![CI Status](https://img.shields.io/travis/周晓路/TPRouter-Swift.svg?style=flat)](https://travis-ci.org/周晓路/TPRouter-Swift)
[![Version](https://img.shields.io/cocoapods/v/TPRouter-Swift.svg?style=flat)](https://cocoapods.org/pods/TPRouter-Swift)
[![License](https://img.shields.io/cocoapods/l/TPRouter-Swift.svg?style=flat)](https://cocoapods.org/pods/TPRouter-Swift)
[![Platform](https://img.shields.io/cocoapods/p/TPRouter-Swift.svg?style=flat)](https://cocoapods.org/pods/TPRouter-Swift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TPRouter-Swift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TPRouter-Swift'
```

## Author

Top, luyanggold@163.com

## License

TPRouter-Swift is available under the MIT license. See the LICENSE file for more info.

## Use Register
``` swift

        /*
         情景1、使用正则表达式方式注册 xxx/:name1/:name2([0-9]+)
            正则表达式 作用：指定 传入参数的格式要求 (name1、name2为参数名)
            使用: xxx/xxx/123
         */
        Router.shared.register("gotoSecond/:name/:sex([0-9]+)") {
            let vc = SecondVC()
            if let name = $0["name"] as? String, let sex = $0["sex"] {
                vc.title = name + "\(sex)"
            }
            Navigator.push(vc)
        }
        /*
         情景2、path 直接注册 xxxx/xxxx/xxxx
         使用时分两种：a、path?param=[String: Any]
                            b、url: path  parameters: [String: Any]
         */
        Router.shared.register("gotoSecond") {
            let vc = SecondVC()
            if let name = $0["name"] as? String, let sex = $0["sex"] {
                vc.title = name + "\(sex)"
            }
            Navigator.push(vc)
        }
        
```

## Use 

``` swift

        // 使用 情景1
        Router.shared.use("gotoSecond/跳转/15")
        // 使用 场景 2-1
        Router.shared.use("gotoSecond?name=\("跳转")&sex=\(9)")
        // 使用 场景 2-2
        Router.shared.use("gotoSecond", parameters: ["name": "跳转", "sex": 9])
```
