//
//  AboutYourChildViewController.swift
//  NeuroSpark
//
//  Created by salchug on 19.05.25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AboutYourChildViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let aboutChildText = UILabel()
    private let profileIcon = UIButton()
    private let nameField = UITextField()
    private let nameText = UILabel()
    private let ageField = UITextField()
    private let ageText = UILabel()
    private let genderField = UITextField()
    private let genderText = UILabel()
    private let genderPicker = UIPickerView()
    private let genders = ["Male", "Female", "Other"]
    private let dateField = UITextField()
    private let dateText = UILabel()
    private let datePicker = UIDatePicker()
    private let dateFormatter = DateFormatter()
    private let saveButton = UIButton()
    

    
    private var selectedImage: UIImage?
    private let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setupBackground()
        setupUI()
        setupFieldObservers()
        setupDatePicker()
        loadUserData()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    
    private func setupBackground() {
        let backgroundImage = UIImageView(image: UIImage(named: "backgroundcircle"))
        backgroundImage.contentMode = .scaleAspectFit
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupUI() {
        configureAboutChildText()
        configureProfileIcon()
        configureNameField()
        configureNameText()
        configureAgeField()
        configureAgeText()
        configureGenderField()
        configureGenderText()
        setupGenderPicker()
        configureDateField()
        configureDateText()
        configureSaveButton()
    }
    
    private func setupFieldObservers() {
        nameField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        ageField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        genderField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        dateField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        dateFormatter.dateFormat = "dd/MM/yyyy"
    }
    
    private func configureAboutChildText() {
        aboutChildText.text = "About Your Child"
        aboutChildText.font = UIFont.systemFont(ofSize: 20)
        aboutChildText.textColor = UIColor(hex: "#292929")
        aboutChildText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(aboutChildText)
        NSLayoutConstraint.activate([
            aboutChildText.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            aboutChildText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func configureProfileIcon() {
        profileIcon.setImage(UIImage(named: "profileiconpng"), for: .normal)
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.addTarget(self, action: #selector(profileIconTapped), for: .touchUpInside)
        
        profileIcon.layer.cornerRadius = 59
        profileIcon.layer.masksToBounds = true
        profileIcon.layer.borderWidth = 2
     //   profileIcon.layer.borderColor = UIColor(hex: "#4A90E2")?.cgColor
        
        view.addSubview(profileIcon)
        
        NSLayoutConstraint.activate([
            profileIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 133),
            profileIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileIcon.widthAnchor.constraint(equalToConstant: 118),
            profileIcon.heightAnchor.constraint(equalToConstant: 118)
        ])
    }
    
    @objc private func profileIconTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage.circularImage(size: CGSize(width: 118, height: 118))
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage.circularImage(size: CGSize(width: 118, height: 118))
        }
        
        profileIcon.setImage(selectedImage, for: .normal)
    }
    
    @objc private func saveData() {
        guard let userId = Auth.auth().currentUser?.uid else {
            showAlert(title: "Error", message: "User not authenticated")
            return
        }
        
        guard validateFields() else { return }
        
        // Show loading indicator
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        saveButton.isEnabled = false
        
        // Convert image to Base64 string if exists
        var imageString: String? = nil
        if let image = selectedImage,
           let imageData = image.jpegData(compressionQuality: 0.5) {
            imageString = imageData.base64EncodedString()
        }
        
        let userData: [String: Any] = [
            "childName": nameField.text ?? "",
            "childAge": ageField.text ?? "",
            "childGender": genderField.text ?? "",
            "childBirthDate": dateField.text ?? "",
            "profileImage": imageString ?? "", // Base64 string or empty
            "lastUpdated": FieldValue.serverTimestamp()
        ]
        
        db.collection("users").document(userId).setData(userData, merge: true) { error in
            activityIndicator.stopAnimating()
            self.saveButton.isEnabled = true
            
            if let error = error {
                self.showAlert(title: "Error", message: "Failed to save data: \(error.localizedDescription)")
            } else {
                self.showAlert(title: "Success", message: "Child data saved successfully")
            }
        }
    }
    
    private func loadUserData() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userId).getDocument { snapshot, error in
            if let error = error {
                print("Error loading user data: \(error.localizedDescription)")
                return
            }
            
            guard let data = snapshot?.data() else { return }
            
            // Load text fields
            self.nameField.text = data["childName"] as? String
            self.ageField.text = data["childAge"] as? String
            self.genderField.text = data["childGender"] as? String
            self.dateField.text = data["childBirthDate"] as? String
            
            // Load profile image if exists
            if let base64String = data["profileImage"] as? String,
               !base64String.isEmpty,
               let imageData = Data(base64Encoded: base64String),
               let image = UIImage(data: imageData) {
                self.selectedImage = image
                self.profileIcon.setImage(image, for: .normal)
            }
            
            self.updateFilledState()
        }
    }
    
    private func validateFields() -> Bool {
        guard let name = nameField.text, !name.isEmpty,
              let age = ageField.text, !age.isEmpty,
              let gender = genderField.text, !gender.isEmpty,
              let dob = dateField.text, !dob.isEmpty else {
            showAlert(title: "Missing Information", message: "Please fill all fields")
            return false
        }
        
        if Int(age) == nil {
            showAlert(title: "Invalid Age", message: "Please enter a valid number for age")
            return false
        }
        
        return true
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }
    
   private func configureNameText() {
        nameText.text = "Full Name"
        nameText.textColor = UIColor(hex: "#292929")
        nameText.font = UIFont.boldSystemFont(ofSize: 10)
        nameText.textAlignment = .left
        nameText.translatesAutoresizingMaskIntoConstraints = false
        
       view.addSubview(nameText)
       NSLayoutConstraint.activate([
           nameText.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -6),
           nameText.leftAnchor.constraint(equalTo: nameField.leftAnchor, constant: 4)
       ])
    }
    
   private func configureNameField() {
        nameField.placeholder = "Enter your child's full name"
        nameField.layer.borderWidth = 1
        nameField.layer.cornerRadius = 8
        nameField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        nameField.setPadding(left: 40)
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView(image: UIImage(systemName: "person"))
        iconImageView.tintColor = .gray
        iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        iconImageView.contentMode = .scaleAspectFit
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        iconContainerView.addSubview(iconImageView)
        iconImageView.center = iconContainerView.center
        nameField.leftView = iconContainerView
        nameField.leftViewMode = .always
        
       view.addSubview(nameField)
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.widthAnchor.constraint(equalToConstant: 345),
            nameField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func configureAgeText() {
         ageText.text = "Age"
         ageText.textColor = UIColor(hex: "#292929")
         ageText.font = UIFont.boldSystemFont(ofSize: 10)
         ageText.textAlignment = .left
         ageText.translatesAutoresizingMaskIntoConstraints = false
         
        view.addSubview(ageText)
        NSLayoutConstraint.activate([
            ageText.bottomAnchor.constraint(equalTo: ageField.topAnchor, constant: -6),
            ageText.leftAnchor.constraint(equalTo: ageField.leftAnchor, constant: 4)
        ])
     }
     
    private func configureAgeField() {
         ageField.keyboardType = .numberPad
         ageField.placeholder = "Enter your child's age"
         ageField.layer.borderWidth = 1
         ageField.layer.cornerRadius = 8
         ageField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
         ageField.setPadding(left: 40)
         ageField.translatesAutoresizingMaskIntoConstraints = false
         
         let iconImageView = UIImageView(image: UIImage(systemName: "person"))
         iconImageView.tintColor = .gray
         iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
         iconImageView.contentMode = .scaleAspectFit
         
         let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
         iconContainerView.addSubview(iconImageView)
         iconImageView.center = iconContainerView.center
         ageField.leftView = iconContainerView
         ageField.leftViewMode = .always
         
        view.addSubview(ageField)
         NSLayoutConstraint.activate([
             ageField.topAnchor.constraint(equalTo: view.topAnchor, constant: 365),
             ageField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             ageField.widthAnchor.constraint(equalToConstant: 345),
             ageField.heightAnchor.constraint(equalToConstant: 48)
         ])
     }
     
    private func configureGenderText() {
         genderText.text = "Gender"
         genderText.textColor = UIColor(hex: "#292929")
         genderText.font = UIFont.boldSystemFont(ofSize: 10)
         genderText.textAlignment = .left
         genderText.translatesAutoresizingMaskIntoConstraints = false
         
        view.addSubview(genderText)
        NSLayoutConstraint.activate([
            genderText.bottomAnchor.constraint(equalTo: genderField.topAnchor, constant: -6),
            genderText.leftAnchor.constraint(equalTo: genderField.leftAnchor, constant: 4)
        ])
     }
    
    private func configureGenderField() {
        genderField.borderStyle = .none
        genderField.placeholder = "Select Gender"
        genderField.layer.borderWidth = 1
        genderField.layer.cornerRadius = 8
        genderField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        genderField.setPadding(left: 40)
        genderField.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView(image: UIImage(systemName: "person"))
        iconImageView.tintColor = .gray
        iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        iconImageView.contentMode = .scaleAspectFit
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        iconContainerView.addSubview(iconImageView)
        iconImageView.center = iconContainerView.center
        genderField.leftView = iconContainerView
        genderField.leftViewMode = .always
        
        view.addSubview(genderField)

        NSLayoutConstraint.activate([
            genderField.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            genderField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderField.widthAnchor.constraint(equalToConstant: 345),
            genderField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func setupGenderPicker() {
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderPicker.backgroundColor = .white
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(genderTapped))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true

        genderField.inputView = genderPicker
        genderField.inputAccessoryView = toolbar
    }

    @objc private func genderTapped() {
        view.endEditing(true)
    }
    
    private func configureDateText() {
         dateText.text = "Date of Birth"
         dateText.textColor = UIColor(hex: "#292929")
         dateText.font = UIFont.boldSystemFont(ofSize: 10)
         dateText.textAlignment = .left
         dateText.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(dateText)
        NSLayoutConstraint.activate([
            dateText.bottomAnchor.constraint(equalTo: dateField.topAnchor, constant: -6),
            dateText.leftAnchor.constraint(equalTo: dateField.leftAnchor, constant: 4)
        ])
     }
    
    private func configureDateField() {
        dateField.borderStyle = .none
        dateField.placeholder = "DD//MM//YYYY"
        dateField.layer.borderWidth = 1
        dateField.layer.cornerRadius = 8
        dateField.layer.borderColor = UIColor(hex: "#8D8D8D")?.cgColor
        dateField.translatesAutoresizingMaskIntoConstraints = false
        
        dateField.leftViewMode = .always
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        dateField.leftView = paddingView

        let iconImageView = UIImageView(image: UIImage(systemName: "calendar"))
        iconImageView.tintColor = .gray
        iconImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
        iconImageView.contentMode = .scaleAspectFit

        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        iconContainerView.addSubview(iconImageView)
        iconImageView.center = iconContainerView.center
        dateField.leftView = iconContainerView

        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)

        dateField.inputView = datePicker

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dateTapped))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        dateField.inputAccessoryView = toolbar

        view.addSubview(dateField)

        NSLayoutConstraint.activate([
            dateField.topAnchor.constraint(equalTo: view.topAnchor, constant: 535),
            dateField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateField.widthAnchor.constraint(equalToConstant: 345),
            dateField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc private func dateTapped() {
        view.endEditing(true)
    }

    @objc private func dateChanged(_ sender: UIDatePicker) {
        dateFormatter.dateStyle = .medium
        dateField.text = dateFormatter.string(from: sender.date)
        updateFilledState()
    }

    
    func configureSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = UIColor(hex: "#A7C7E7")
        saveButton.layer.cornerRadius = 8
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 345),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func saveButtonTapped() {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.saveButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               self.saveButton.transform = CGAffineTransform.identity
                           }
                       })
    }
    
    private func updateFilledState() {
        let isNameFilled = !(nameField.text?.isEmpty ?? true)
        let isAgeFilled = !(ageField.text?.isEmpty ?? true)
        let isGenderFilled = !(genderField.text?.isEmpty ?? true)
        let isDateFilled = !(dateField.text?.isEmpty ?? true)

        if isNameFilled && isAgeFilled && isGenderFilled && isDateFilled {
            saveButton.backgroundColor = UIColor(hex: "#3B82F6")
            saveButton.isEnabled = true
        } else {
            saveButton.backgroundColor = UIColor(hex: "#A7C7E7")
            saveButton.isEnabled = false
        }

        updateBorderColor(for: nameField, isFilled: isNameFilled)
        updateBorderColor(for: ageField, isFilled: isAgeFilled)
        updateBorderColor(for: genderField, isFilled: isGenderFilled)
        updateBorderColor(for: dateField, isFilled: isDateFilled)
    }

    private func updateBorderColor(for textField: UITextField, isFilled: Bool) {
        textField.layer.borderColor = isFilled ? UIColor(hex: "#3B82F6")?.cgColor : UIColor(hex: "#8D8D8D")?.cgColor
        textField.layer.borderWidth = 1.0
    }


    @objc func textFieldDidChange() {
        updateFilledState()
    }

    
    
    
}
    
    

extension AboutYourChildViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderField.text = genders[row]
        updateFilledState()
    }
}
