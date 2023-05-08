//
//  ViewController.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 02/05/2023.
//

//TODO: imports should be in alphabetical order

import UIKit
import SVGKit
import Alamofire
import Kingfisher

// TODO: Give a specific for controller that defines what does it do
// RepositoyListViewController
class ViewController: UIViewController {

    // TODO: use decriptive names

    @IBOutlet weak var pbuttonImageView: UIImageView!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var activityIndicatorView: UIView?

    private var numberOfAvailableLanguages = 7

    // TODO: Dont use force unwrapping

    var repoList: [Repo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // TODO: Move this to scene delegate
        let navController = UINavigationController(rootViewController: self)
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = navController
            window.makeKeyAndVisible()
        }
        
        
        let api = GetGithubPublicRepoAPI()
        showActivityIndicator()
        api.getAPI { [weak self] repositories in
            self?.repoList = repositories
            DispatchQueue.main.async {
                   self?.tableView.reloadData()
                   self?.hideActivityIndicator()
               }
        }
        
        
        let textField = textFieldView.subviews.first as! UITextField
        textField.borderStyle = .none
        // TODO: Save colors in Assets
        textField.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1.0)
        // TODO: Save strings in localizable files
        textField.placeholder = NSLocalizedString("search", comment: "")


        // TODO: Use extensions to shorten method calls
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
        tableView.separatorStyle = .none

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        pbuttonImageView.isUserInteractionEnabled = true
        pbuttonImageView.addGestureRecognizer(tapGesture)

        textFieldView.layer.cornerRadius = 10

        // TODO: Remove commented code
//        NSLayoutConstraint.activate([
//            searchBarView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.155),
//            tableView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.845),
////            searchBarView.widthAnchor.constraint(equalTo: searchBarStackView.widthAnchor, multiplier: 0.8)
//        ])
        
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar
        navigationController?.navigationBar.isHidden = true
    }

    
    func showActivityIndicator() {
        activityIndicatorView = UIView(frame: self.view.bounds)
        activityIndicatorView?.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityIndicatorView!.center
        activityIndicator.startAnimating()
        activityIndicatorView?.addSubview(activityIndicator)
        self.view.addSubview(activityIndicatorView!)
    }
    
    func hideActivityIndicator() {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil
    }


    // TODO: Be more specific. Which view is tapped?
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SecondaryViewController") as! SecondaryViewController
        navigationController?.pushViewController(destinationVC, animated: true)

    }

}

// TODO: Conform to each protocol in a different extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let repoList {
            return repoList.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let repo: Repo = repoList[indexPath.section]

        // TODO: Remove force casting
        let profilePicImageView = cell.profilePicView.subviews.first as! UIImageView

        // TODO: Remove force unwrapping. Use guard

        let imageUrl = URL(string: repo.avatar_url)!
        let resource = ImageResource(downloadURL: imageUrl)
        profilePicImageView.kf.indicatorType = .activity
        profilePicImageView.kf.setImage(with: resource)
        profilePicImageView.isUserInteractionEnabled = false

        cell.nameLabel.text = repo.name


        let programmingLanguageLabel = cell.programmingLangView.subviews.first as! UILabel
        // TODO: Dont use magic numbers
        programmingLanguageLabel.text = programmingLanguages[Int.random(in: 0..<7)]
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
