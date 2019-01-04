//
//  BackgroudView.swift
//  Demo
//
//  Created by 杨明明 on 2018/12/20.
//  Copyright © 2018年 杨明明. All rights reserved.
//

import UIKit

class BackgroudView: UIView,CAAnimationDelegate {
    
    var imageView:UIImageView!
    
    var spotImageView:UIImageView!
    
    var womanImageView:UIImageView!
    
    internal static let sharedInstance = BackgroudView()
    
    var timer:Timer!
    
    var leftTime = 5.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView.init(image: UIImage.init(named: "rotate"))
        imageView.frame = CGRect(x:Screen_Width/375 * 62.5, y:Screen_Width/375 * 100, width:Screen_Width/375 * 250, height:Screen_Width/375 * 250)
        imageView.alpha = 0.0
        //        imageView.isHidden = true
        self.addSubview(imageView)
        
        spotImageView = UIImageView.init(image: UIImage.init(named: "spot"))
        spotImageView.frame = CGRect(x:0, y:Screen_Width/375 * 160, width:Screen_Width/375 * 400, height:Screen_Width/375 * 130)
        //        spotImageView.isHidden = true
        spotImageView.alpha = 0.0
        self.addSubview(spotImageView)
        
        womanImageView = UIImageView.init(image: UIImage.init(named: "woman"))
        womanImageView.frame = CGRect(x:0, y:Screen_Width/375 * 130, width:Screen_Width/375 * 100, height:Screen_Width/375 * 150)
        self.addSubview(womanImageView)
        
        self.willAppear()
        self.changeLocation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* 移动 */
//    let womanAnim = CABasicAnimation(keyPath: "position")
    let womanAnim = CABasicAnimation(keyPath: "position")
    func changeLocation() {
        womanAnim.delegate = self
        //动画设置
        womanAnim.duration = 3 //持续时间
        womanAnim.repeatCount = 2 //重复次数
        womanAnim.isRemovedOnCompletion = false
        womanAnim.fillMode = kCAFillModeForwards
        // 起始帧和终了帧的设定
        womanAnim.fromValue = NSValue.init(cgPoint: womanImageView.layer.position)  // 起始帧
        
        womanAnim.toValue   = NSValue.init(cgPoint: CGPoint(x:self.frame.size.width/2 + 20,
                                                            y: Screen_Width/375 * 400))  // 终了帧
        
        // 添加动画
        womanImageView.layer.add(womanAnim, forKey: "womanmove-layer")
        
    }
    
        @objc func tickDown2(){
            //将剩余时间减少
            leftTime -= 0.5
            if leftTime == 4.5 {
                self.rotate()
                self.scaling ()
                //取消定时器
                //            timer.invalidate()
            }
            
            if leftTime == 2{
                let anim2 = CABasicAnimation(keyPath: "position")
                
                // 动画选项的设定
                anim2.duration    = 0.5   // 持续时间
                anim2.repeatCount = 2   // 重复次数
                anim2.isRemovedOnCompletion = false
                anim2.fillMode = kCAFillModeForwards
                //        anim2.delegate = self
                
                // 起始帧和终了帧的设定
                anim2.fromValue = NSValue.init(cgPoint: CGPoint(x:Screen_Width/375 * 480,
                                                                y: spotImageView.layer.position.y))  // 起始帧
                anim2.toValue   = NSValue.init(cgPoint: CGPoint(x:435,
                                                                y: spotImageView.layer.position.y))  // 终了帧
                anim2.timingFunction = CAMediaTimingFunction(controlPoints: 0.62 ,0.05 ,0.37 ,0.94)
                
                // 添加动画
                spotImageView.layer.add(anim2, forKey: "move-layer")
            }
        }
    
    /* 旋转 / 移动*/
    func rotate() {
        // 创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 旋转角度 (反向旋转为负值就可以了)
        anim.toValue = 2.0 * M_PI
        //重复
        anim.repeatCount = 2
        //时间
        anim.duration = 3
        //是否被移除
        anim.isRemovedOnCompletion = false
        //动画速度
        anim.speed = 1
        anim.timingFunction = CAMediaTimingFunction(controlPoints: 0.62 ,0.05 ,0.37 ,0.94)
        // 将动画添加到图层上
        imageView.layer.add(anim, forKey: nil)
        
        let anim2 = CABasicAnimation(keyPath: "position")

        // 动画选项的设定
        anim2.duration    = 2.5   // 持续时间
        anim2.repeatCount = 2   // 重复次数
        anim2.isRemovedOnCompletion = false
        anim2.fillMode = kCAFillModeForwards
        //        anim2.delegate = self

        // 起始帧和终了帧的设定
        anim2.fromValue = NSValue.init(cgPoint: spotImageView.layer.position)  // 起始帧
        anim2.toValue   = NSValue.init(cgPoint: CGPoint(x:Screen_Width/375 * 480,
                                                        y: spotImageView.layer.position.y))  // 终了帧
        anim2.timingFunction = CAMediaTimingFunction(controlPoints: 0.62 ,0.05 ,0.37 ,0.94)

        // 添加动画
        spotImageView.layer.add(anim2, forKey: "move-layer")
    }
    
    /* 放大缩小 */
    func scaling () {
        
        let womanAnim = CABasicAnimation(keyPath: "position")
        // 起始帧和终了帧的设定
        womanAnim.fromValue = NSValue.init(cgPoint: CGPoint(
            x:self.frame.size.width/2+20,
            y: Screen_Width/375 * 400))  // 起始帧
        womanAnim.toValue   = NSValue.init(cgPoint: imageView.center)  // 终了帧
        
        // 添加动画
        womanImageView.layer.add(womanAnim, forKey: "womanmove-layer")
        
        // 设定为缩放
        let anim = CABasicAnimation(keyPath: "transform.scale")
        // 缩放倍数
        anim.fromValue = NSNumber.init(floatLiteral: 1.0)       // 开始时的倍率
        anim.toValue = NSNumber.init(floatLiteral: 0.0)         // 结束时的倍率
        
        /* 动画组 */
        let group = CAAnimationGroup.init()
//        // 动画选项设定
        group.duration = 3.0
        group.repeatCount = 2
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        group.animations = [womanAnim,anim]
//
//        // 添加动画
        womanImageView.layer.add(group, forKey: "move-rotate-layer")
    }
    
    func willAppear(){
        
        UIView.animate(withDuration: 2.0, animations: {
            self.spotImageView.alpha = 1.0
            self.imageView.alpha = 1.0
        }) { (finish) in
            
        }
    }
    
    //MARK: - CAAnimationDelegate
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(tickDown2), userInfo: nil, repeats: true)
        UIView.animate(withDuration: 0.5, animations: {
            self.spotImageView.center.x += Screen_Width/375 * 100
        
            
            
        }) { (finish) in

        }
    }
    
}

