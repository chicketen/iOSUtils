# iOSUtilsとは
iOSで開発(Swift)を行う際にあったら便利そうなExtensionです。  
  
**Swiftバージョン：1.2**

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

### 部分文字列のインデックスを取得する
```swift
var index = "test/string/index".indexOf("/")
println("index: \(index)") // 4

index = "test/string/index".lastIndexOf("/")
println("index: \(index)") // 11

index = "test/string/index".indexOf("*")
println("index: \(index)") // -1

index = "test/string/index".lastIndexOf("*")
println("index: \(index)") // -1
```

## UIColor Extension
### 整数指定(0～255)でUIColorを作成する
```swift
var color = UIColor.colorWithInt(r: 10, g: 128, b: 255)
println("color: \(color)") // UIDeviceRGBColorSpace 0.0392157 0.501961 1 1

color = UIColor.colorWithInt(r: 10, g: 128, b: 255, a: 30)
println("color: \(color)") // UIDeviceRGBColorSpace 0.0392157 0.501961 1 0.117647
```

### 16進文字列からUIColorを作成する
```swift
var optColor = UIColor.colorWithRGBString("#1080ff")
println("color: \(optColor!)") // UIDeviceRGBColorSpace 0.0627451 0.501961 1 1

optColor = UIColor.colorWithRGBString("ffffff")
println("color: \(optColor!)") // UIDeviceRGBColorSpace 1 1 1 1

optColor = UIColor.colorWithRGBString("ffffffz")
println("color: \(optColor)") // nil

optColor = UIColor.colorWithRGBAString("10203040")
println("color: \(optColor!)") // UIDeviceRGBColorSpace 0.0627451 0.12549 0.188235 0.25098

optColor = UIColor.colorWithRGBAString("#ffffffff")
println("color: \(optColor!)") // UIDeviceRGBColorSpace 1 1 1 1

optColor = UIColor.colorWithRGBAString("#fffffffz")
println("color: \(optColor)") // nil
```
