//
//  ImageTableViewCell.swift
//  Demo
//
//  Created by 杨明明 on 2018/12/12.
//  Copyright © 2018年 杨明明. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var images: UIImageView!
    
    
    
    //内容图片的宽高比约束
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                images.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                images.addConstraint(aspectConstraint!)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //清除内容图片的宽高比约束
        aspectConstraint = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //加载内容图片（并设置高度约束）
    func loadImage(urlString: String) {
        //定义NSURL对象
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        //从网络获取数据流,再通过数据流初始化图片
        if let imageData = data, let image = UIImage(data: imageData) {
            //计算原始图片的宽高比
            let aspect = image.size.width / image.size.height
            //设置imageView宽高比约束
            aspectConstraint = NSLayoutConstraint(item: images,
                                                  attribute: .width, relatedBy: .equal,
                                                  toItem: images, attribute: .height,
                                                  multiplier: aspect, constant: 0.0)
            //加载图片
            images.image = image
        }else{
            //去除imageView里的图片和宽高比约束
            aspectConstraint = nil
            images.image = nil
        }
    }
    
}
