//
//  ViewController.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 02/05/2023.
//

import UIKit
import SVGKit

class ViewController: UIViewController {
    @IBOutlet weak var preferenceButtonView: UIView!
    
    @IBOutlet weak var pbuttonImageView: UIImageView!
    //    @IBOutlet weak var searchBarStackView: UIStackView!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a new instance of UINavigationController with self as the root view controller
          let navController = UINavigationController(rootViewController: self)

          // Set the navigation controller as the root view controller of the window
          if let window = UIApplication.shared.windows.first {
            window.rootViewController = navController
            window.makeKeyAndVisible()
          }
        
        let textField = textFieldView.subviews.first as! UITextField
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1.0)
        textField.placeholder = "Search..."
        
        
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
        tableView.separatorStyle = .none
        
        
        
    let pbuttonSvgImage = SVGKImage(named: "pbutton")
    pbuttonImageView.image = pbuttonSvgImage?.uiImage
        pbuttonImageView.backgroundColor = .red
        
        
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    pbuttonImageView.isUserInteractionEnabled = true
    pbuttonImageView.addGestureRecognizer(tapGesture)


        
        textFieldView.layer.cornerRadius = 10
        preferenceButtonView.layer.cornerRadius = 10

        
//        NSLayoutConstraint.activate([
//            searchBarView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.155),
//            tableView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.845),
////            searchBarView.widthAnchor.constraint(equalTo: searchBarStackView.widthAnchor, multiplier: 0.8)
//        ])
        
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SecondaryViewController") as! SecondaryViewController
                    navigationController?.pushViewController(destinationVC, animated: true)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar
        navigationController?.navigationBar.isHidden = true
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }

   
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 300 + 5 // add 10 points of spacing to the cell height
       }
       
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
           view.backgroundColor = .clear
           return view
       }
       
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 5 // set the height of the spacing view to 10 points
       }
}
