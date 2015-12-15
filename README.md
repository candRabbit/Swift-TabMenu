#### Swift-TabMenu
**一个带有多种样式Tab可分页滑动的控件**
***
![](https://github.com/candRabbit/Swift-TabMenu/blob/master/screenshot/screenshot.gif)

####怎么使用

**样式枚举**

+ TabMenuStyle
  - Normal
  - Scroll
  - BottomLine

**你可以根据你的需求来选择合适的样式,也可以进行扩展**

---

```swift
class ViewController: UIViewController,TabMenuDelegate{

   
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabMenu = TabMenu(frame: CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height-64))
        tabMenu.delegate = self
        tabMenu.initTab(style:style!,controller: self)
        self.view.addSubview(tabMenu)
        self.automaticallyAdjustsScrollViewInsets = false
     
    
   
    }
    
    // return your tabTitles
    func getTitles() -> [String] {
        var titles = [String]()
        return titles
    }
    
    // return your controllers
    func getControllers() -> [UIViewController] {
        
        var controllers = [UIViewController]()
        return controllers
    }

}
```
