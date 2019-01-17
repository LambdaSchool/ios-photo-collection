//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Angel Buenrostro on 1/16/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if photo != nil{
            photoController!.Update(photo: photo!, data: (photo?.imageData)!, string: (photo?.title)!)
        } else if imageView.image != nil && textField.text != nil {
            let data = imageView.image!.pngData()
            photoController?.Create(imageData: data!, title: textField.text!)
        }
    }
    
    func setTheme(){
        if themeHelper!.themePreference != nil {
            let preference = themeHelper!.themePreference
            self.view.backgroundColor = (preference == "dark") ? .black : .blue
            
        }
    }
    
    func updateViews(){
        setTheme()
        if photo != nil {
            imageView.image = UIImage(data: (photo?.imageData)!)
            textField.text = photo?.title
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
