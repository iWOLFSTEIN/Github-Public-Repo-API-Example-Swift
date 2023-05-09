//
//  RepositoryListViewModel.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 09/05/2023.
//

import Foundation

class RepositoryListViewModel {
    private var repoListApi: GetGithubPublicRepoAPI!
    var bindRepoViewModelToRepoView: (() -> Void) = {}
    var repoList: [Repo] = [] {
        didSet {
            self.bindRepoViewModelToRepoView()
        }
    }
    
    init() {
        self.repoListApi = GetGithubPublicRepoAPI()
        getReposData()
    }
    
    func getReposData() {
        self.repoListApi.getRepositoriesAPI { [weak self] repositories in
            self?.repoList = repositories
        }
    }
}
