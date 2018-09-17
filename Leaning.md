#### 知识点整理
##### 配置桥接文件

> 1. 创建.h文件，格式为  ProjectName-Bridging-Header.h
> 2. Build Setting  搜索  bridging  配置Objective-C Bridging Header  路径即可
> 3. Pod 导入的OC第三方库需配置桥接文件：格式为 import "AFNetworking/AFNetworking.h"   【使用没有提示】



##### swift没有分类

> 使用类拓展可以达到所有需要的要求



##### 宏走的是预编译

> 在swift中没有宏，可以通过常量【无参】，或方法【有参】来表示

```
#define a 10 	// OC
let a = 10		// swift


// OC
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

// swift
func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

```



##### xib接入

###### 1. ViewController 对应xib

> 1. 创建同名xib
> 2. 在xib中的File's owner配置 class 为控制器名
> 3. 选中xib File's owner在视图器中将view 连线到xib上，即让xib作为viewController的view



###### 2. cell创建

>  直接创建即可

###### 3. view关联xib

```
protocol UIViewLoading {}
extension UIView : UIViewLoading {}
extension UIViewLoading where Self : UIView {
	
	static func loadFromNib() -> Self {		// 格式意思需要整理
		let nib = UINib(nibName: stringOfClass(cls: self), bundle: nil)
		return nib.instantiate(withOwner: self, options: nil).first as! Self
	}

```





##### 获取类信息

> 1.  NSObject.self // 返回的为class类型
> 2.  NSStringFromClass() // 返回的结字符串会把项目名称也写在里面，不能作为xib名字使用,需要截取才可使用



##### 闭包使用

> 闭包， 下面为闭包的格式

```
{ (parameters) -> (return type) in
    statements
  }
```

> 尾随闭包

如果需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包增强函数的可读性。

```
// 转换如下
 func someFunctionThatTakesAClosure(closure:() -> Void){
       //function body goes here
 }
 
  //here's how you call this function without using a trailing closure
 
  someFunctionThatTakesAClosure({
       //closure's body goes here
  })
    
  //here's how you call this function with a trailing closure instead
      
  someFunctionThatTakesAClosure() {
       // trailing closure's body goes here
  }
```



> 逃逸闭包

当闭包作为一个实际参数传递给一个函数的时候，我们说这个闭包逃逸了，因为它可以在函数返回后被调用。当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前写@escaping来明确闭包时允许逃逸的。类似于OC中把block当成属性保存起来以后使用。

```
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
```

> 自动闭包

自动闭包是一种自动创建的，用来把座位实际参数传递给函数表达式打包的闭包。它不接受任何实际参数，并且当它被调用时，它会返回内部打包的表达式的值。这个语法的好处在于通过写普通表达式代替显式闭包而使你省略包围函数的形式参数的括号。

```

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )			// 需要使用{}包围闭包体


// 对比使用
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))	// 自动会对实参添加{} 不需要自己添加{}
```





更多闭包知识点：https://www.cnswift.org/closures



##### 布局使用

> 使用snpKit

```
import SnapKit
self.headerView.snp.makeConstraints { (make) in
			make.width.equalTo(100)
			make.height.equalTo(200)
			make.center.equalToSuperview()
		}
```



##### 枚举使用

> 格式

```
enum SomeEnumeration {
    // enumeration definition goes here
}
```

> 关联值: 与枚举成员建立关系的常量或变量

```
// 条码，分两种，条形码，二维码
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 创建一个条码
var productBarCode = Barcode.upc(8, 19251, 15225, 2)
// 创建一个qrcode码
productBarCode = .qrCode("ABCDEFGHIJKLMNOP")

// 不同的条码需要使用switch语句进行检查
switch productBarCode {
case .upc(let a, let b, let c, let d):
    print("UPC: \(a), \(b), \(c), \(d)")
case .qrCode(let code):
    print(code)
}

// 嫌弃上面写的let太多，可以直接在case后操作
switch productBarCode {
case let .upc(a,b,c,d):
    print("UPC: \(a), \(b), \(c), \(d)")
case let .qrCode(code):
    print(code)
}

```

> 原始值

就是默认值 需要指定枚举成员类型，如果第一个取值为0则其他会逐渐加一，如果为字符串会直接使用字面意思，通过rawValue来使用

```
enum Planet: Int {  // Int 不可省略
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint: String {  // string不可省略
    case north, south, east, west
}

print(Planet.venus.rawValue)
// 2

print(CompassPoint.north.rawValue)
// north


```



从原始值初始化一个枚举成员

```
let possiblePlanet = Planet(rawValue: 7)
```



> 递归枚举

```
// 需要使用indirect 关键字

# 写法1
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

# 写法2
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}


```



使用方式：在switch实现逻辑

```
// 接近自然语言的操作方式
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

// 内部操作的实现
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
```





##### setter & getter

> 1. 成员变量自己写

```
private var _name:String?		// 通过成员变量来存储信息
var name:String? {
	set {
		_name = newValue
	}
	get {
		return _name
	}
}
```



> 2. set get 与didSet不能一起使用

```
private var _name:String?
var name:String? {
//	set {	// 使用了didSet不能使用 set get
//		_name = newValue
//	}
//	get {
//		return _name
//	}
	
	didSet {
		_name = name
		print("newValue:\(_name) oldValue:\(oldValue)")
	}
}

```

> 3.  计算属性/存储属性 

计算属性，就是用来计算的有set 和 get方法：【get】读计算属性，【set】写计算属性

存储属性用来存储一个常量或者变量

```
// 存储属性
var name: String = "lili"
let age: Int = 10
lazy var p1:Person1 = Person1() 
```



```
// 计算属性
private var _name:String?		// 通过成员变量来存储信息 存储属性
var name:String? {  // 计算属性
	set {
		_name = newValue
	}
	get {
		return _name
	}
}


var name:String? {  // 计算属性 如果只读可简写
	return _name
}


```



总结：OC中存储属性计算属性共同构成了  

​	属性：成员变量【存储属性】   set/get【计算属性】   如果计算属性，只实现了get则是只读



> 4. 计算属性与懒加载区别

```
private var _name:String?		// 通过成员变量来存储信息 存储属性
var name:String? {  // 计算属性用来操作一个存储属性，本身没有存储空间
	set {
		_name = newValue
	}
	get {
		return _name
	}
}

```



```
	lazy var headerView: RAYMineHeaderView = {  // 注意懒加载不能使用let，有存储空间，一次赋值，后续不会再次赋值，如果置为nil也不会出值
		let headerView = RAYMineHeaderView.loadFromNib()
		print("初始化lazy var ")
		return headerView;
	}()
```



##### self 和 Self

Self相当于OC中的instancetype，但是使用方式需要配置协议方可

```
protocol aProtocol{}

//只给遵守aProtocol协议的UIView添加了拓展
extension aProtocol where Self: UIView {	// self 代表是UIView类型
	func getString() -> String{
		return "string"
	}
}
```



##### 打印行号，方法名

>  配置宏

```
func rayPrint(_ str:String) {
	print("L: \(#line)  M:\(#function) C:" + str)
}
```



##### weak 弱引用

```
swift解除循环引用： weak  unowned

```



###### 延伸

> 非class类型协议不能定义为weak

```
protocol LossOfLimbDelegate: class {  // 无后面class不能使用 weak
	func limbHasBeenLost()
}

weak var delegate: LossOfLimbDelegate?

```



##### JSON转模型





##### Where语句

> Where语句为一种条件语句，像数据库语句一样，可以用于拓展，switch, forEach语句中。
>
> 4.0之前的if let guard 语句中的where现在用","替代

```
// extension使用

protocol aProtocol{}

//只给遵守aProtocol协议的UIView添加了拓展
extension aProtocol where Self: UIView {
	func getString() -> String{
		return "string"
	}
}

```



```
// switch中使用
let strSwitch:String?
strSwitch = "1"
switch strSwitch {
case "20"?:
	break
case let x where Int(x!) != nil && Int(x!)! < 10 :
	print(x!)
default:
	break
}
```



```
let scores = [20,8,59,60,70,80]

//switch语句中使用
scores.forEach {
	switch $0{
	case let x where x>=60:
		print("及格")
	default:
		print("不及格")
	}
}

//for语句中使用
for score in scores where score>=60 {
	print("这个是及格的：\(score)")
}

```

知识点拓展：http://www.hangge.com/blog/cache/detail_1826.html





##### 多层字典取值



##### API可用性

```
if #available(iOS 10, macOS 10.12, *) {  // 最小检查
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
```



##### 修改参数值

```
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var soneInt = 3
var anotherInt = 104
swapTwoInts(&soneInt, &anotherInt)   // 需要传入地址，编译器会自动配置好
```



