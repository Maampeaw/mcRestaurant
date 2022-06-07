//
//  FormViewController.swift
//  FoodPinView2
//
//  Created by user on 5/19/22.
//

import UIKit

class FormViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var photoImageView: UIImageView!{
        didSet{
            photoImageView.layer.cornerRadius = 10
            photoImageView.layer.masksToBounds = true
            
        }
    }
  

    @IBOutlet weak var nameTextField: RoundedTextField!{
        didSet{
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    @IBOutlet weak var typeTextField: RoundedTextField!{
        didSet{
            typeTextField.tag = 2
            typeTextField.delegate = self
        }
    }
    @IBOutlet weak var addressTextField: RoundedTextField!{
        didSet{
            addressTextField.tag = 3
            addressTextField.delegate = self
        }
    }
    @IBOutlet weak var phoneTextField: RoundedTextField!{
        didSet{
            phoneTextField.tag = 4
            phoneTextField.delegate = self
        }
    }
    @IBOutlet weak var descriptionTextField: UITextView!{
        didSet{
            descriptionTextField.tag = 5
            descriptionTextField.delegate = self
            descriptionTextField.layer.cornerRadius = 10
            descriptionTextField.layer.masksToBounds = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let appearance = navigationController?.navigationBar.standardAppearance{
            
            if let customFont = UIFont(name: "Nunito-Bold", size: 40.0){
                appearance.titleTextAttributes = [.foregroundColor:UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor:UIColor(named: "NavigationBarTitle")!, .font: customFont]
                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.compactAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = appearance

            }
        }
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
       
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alertController = UIAlertController(title: "Choose Your Preferred Source", message: nil, preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "Camera", style: .default){
                action in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    self.present(imagePicker, animated: true)
                }
            }
            
            let photoLibraryAction = UIAlertAction(title: "PhotoLibrary", style: .default){
                action in
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                imagePicker.delegate = self
                self.present(imagePicker, animated: true)
                
            }
            alertController.addAction(cameraAction)
            alertController.addAction(photoLibraryAction)
            
            if let popOverController = alertController.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath){
                    popOverController.sourceView = cell
                    popOverController.sourceRect = cell.bounds
                }
            }
            self.present(alertController, animated: true)
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: Any) {
        let fields = [nameTextField, typeTextField, addressTextField, phoneTextField]
        
        for field in fields{
            if field?.text ==  ""{
                let alertController = UIAlertController(title: "Empty Field", message: "Cannot proceed because of an empty Field", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(okAction)
                present(alertController, animated: true)
                
                return
                
            }else{
                print(field!.text!)
            }
            
        }
    }
    
}
    




extension FormViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag+1){
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
}
