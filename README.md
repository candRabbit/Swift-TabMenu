#### Swift-TabMenu
***
![](https://github.com/candRabbit/Swift-TabMenu/blob/master/screenshot/tab-menu.gif)

#####你可以放入更多的TAB,不用担心显示不出来,因为它是可以滑动的,并且它会根据你当前显示的page,滑动到合理的位置.

####How to Use 

```swift
class ViewController: UIViewController,TabMenuDelegate{

   
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabMenu = TabMenu(frame: CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height-64))
        tabMenu.delegate = self
        tabMenu.initView(self)
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
