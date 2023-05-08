//
//  ViewController.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 02/05/2023.
//

import Alamofire
import Kingfisher
import SVGKit
import UIKit

class RepositoyListViewController: UIViewController {
    
    @IBOutlet weak var preferrencebuttonImageView: UIImageView!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var activityIndicatorView: UIView?
    
    private var numberOfAvailableLanguages = 7
    
    var repoList: [Repo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let api = GetGithubPublicRepoAPI()
        showActivityIndicator()
        api.getRepositoriesAPI { [weak self] repositories in
            self?.repoList = repositories
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.hideActivityIndicator()
            }
        }
        
        let textField = textFieldView.subviews.first as! UITextField
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named: "textfieldBackgroundColor")
        textField.placeholder = NSLocalizedString("search", comment: "")
        
        let tableViewCellNib = UINib(nibName: RepoTableViewCell.nibName, bundle: nil)
        tableView.register(tableViewCellNib, forCellReuseIdentifier: RepoTableViewCell.reusableCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
        tableView.separatorStyle = .none
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlePreferrenceButtonTap(_:)))
        preferrencebuttonImageView.isUserInteractionEnabled = true
        preferrencebuttonImageView.addGestureRecognizer(tapGesture)
        
        textFieldView.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func handlePreferrenceButtonTap(_ gesture: UITapGestureRecognizer) {
        
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "PreferrenceViewController") as! PreferrenceViewController
        navigationController?.pushViewController(destinationVC, animated: true)
        
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
}

extension RepositoyListViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return repoList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.reusableCellIdentifier, for: indexPath) as! RepoTableViewCell
        let repo: Repo = repoList[indexPath.section]
        
        let profilePicImageView = cell.profilePicUIImage!
                
        guard let imageUrl = URL(string: repo.avatar_url) else {
            return cell
        }
        let resource = ImageResource(downloadURL: imageUrl)
        profilePicImageView.kf.indicatorType = .activity
        profilePicImageView.kf.setImage(with: resource)
        profilePicImageView.isUserInteractionEnabled = false
        
        cell.nameLabel.text = repo.name
        
        let programmingLanguageLabel = cell.programmingLangView.subviews.first as! UILabel
        programmingLanguageLabel.text = programmingLanguages[Int.random(in: 0..<numberOfAvailableLanguages)]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300 + 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
}

extension RepositoyListViewController: UITableViewDataSource{
    
}
