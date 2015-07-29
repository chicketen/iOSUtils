# iOSUtilsとは
iOSで開発(Swift)を行う際にあったら便利そうなExtensionです。
# 使い方
## String Extension
### 部分文字列を取得する
```swift
var sub = "test string".substringWithBeginIndex(1, endIndex: 6)
println(sub!) // "est s"

sub = "test string".substringWithBeginIndex(3)
println(sub!) // "t string"
```

### 文字列を整数に変換する
```swift
var number = "123"
println("number: \(number.scanInt()!)") // 123

number = "123abc456"
println("number: \(number.scanInt())") // nil
```

### 16進文字列を整数に変換する
```swift
var hex = "10a0"
println("hex: \(hex.scanHexInt()!)") // 4256

hex = "0x10A0"
println("hex: \(hex.scanHexInt()!)") // 4256

hex = "0x10z0"
println("hex: \(hex.scanHexInt())") // nil
```
