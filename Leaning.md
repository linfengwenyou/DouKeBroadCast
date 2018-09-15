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



##### block使用



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



##### 打印行号，方法名

>  配置宏

```
func rayPrint(_ str:String) {
	print("L: \(#line)  M:\(#function) C:" + str)
}
```

