#### Swift-TabMenu
![](https://github.com/candRabbit/Swift-TabMenu/blob/master/screenshot/tab-menu.gif)
***
####How to Use 

`
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

`
