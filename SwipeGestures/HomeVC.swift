//
//  HomeVC.swift
//  SwipeGestures
//
//  Created by iroid on 29/05/25.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var Xnum = 1
        
        let leftside = UISwipeGestureRecognizer(target: self, action: #selector(HomeVC.swiped(gesture:)))
        leftside.direction = .left
        image.addGestureRecognizer(leftside)
        
        
        let rightside = UISwipeGestureRecognizer(target: self, action: #selector(HomeVC.swiped(gesture:)))
        rightside.direction = .right
        image.addGestureRecognizer(rightside)
        
        let upside = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        upside.direction = .up
        image.addGestureRecognizer(upside)
        
        let downside = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        downside.direction = .down
        image.addGestureRecognizer(downside)
        
        image.image = foodimage[0]
        
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        image.addGestureRecognizer(singleTap)
                
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        image.addGestureRecognizer(doubleTap)
        
        
        
        
        let pinchin = UIPinchGestureRecognizer(target: self, action: #selector(pinchHandler))
        image.addGestureRecognizer(pinchin)
        
        

        
        

        // Do any additional setup after loading the view.
    }
    
    var Xnum:Int = 1
    var Fliped = false
    @IBAction func FlipTapped(_ sender: Any) {
       
        if Fliped == true{
            image.transform = CGAffineTransform(scaleX: +1, y: 1)
            Fliped = false
        }else{
            image.transform = CGAffineTransform(scaleX: -1, y: -1)
            Fliped = true
            
        }
        
        
    }
    
    
    var foodimage = [
        UIImage(named: "placeholder"),
        UIImage(named: "Burger"),
        UIImage(named: "Sandwich"),
        UIImage(named: "ramen"),
        UIImage(named: "japanese"),
        UIImage(named: "pizza"),
        UIImage(named: "paneer")
    ]
    
    
   @objc func pinchHandler(pinch: UIPinchGestureRecognizer){
       image.transform = image.transform.scaledBy(x: pinch.scale, y: pinch.scale)
           pinch.scale = 1
        
    }
    
    
    
    @objc func tapHandler(tap:UITapGestureRecognizer){
        if let tapGesture = tap as? UITapGestureRecognizer{
            switch tapGesture.numberOfTapsRequired{
            case 1:
                image.image = foodimage[5]
            case 2:
                image.image = foodimage[6]
            default:
                break
            }
        }
    }
    
    @objc func swiped(gesture:UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case .left:
                image.image = UIImage(named: "Burger")
                
            case .right:
                image.image = foodimage[2]
                
            case .up:
                image.image = foodimage[3]
                
            case .down:
                image.image = foodimage[4]
            default:
                break
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
