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
> 2. NSStringFromClass() // 返回的结字符串会把项目名称也写在里面，不能作为xib名字使用,需要截取才可使用



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



##### 懒加载

```
	lazy var headerView: RAYMineHeaderView = {  // 注意懒加载不能使用let
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

