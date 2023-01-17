//
//  HomeViewController.swift
//  netflixClone
//
//  Created by Waseem Ali on 15/11/2022.
//

import UIKit


class Person {
 
     var friend:Person?
    let name:String

    init(name: String) {
            self.name = name
        print("\(name) is initialized")
    }

    deinit {
        print("\(name) is deinitialized")
    }
    
}

enum Sections : Int {
    
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated  = 4
    
    
    
}

class HomeViewController: UIViewController{
    
    let sectionTitle : [String] = ["Trending Movies","Trending TV","Popular","Upcoming Movies","Top rated"]
    
    private let homeFeedTable: UITableView = {

        let table = UITableView(frame: .zero, style: .grouped)
       
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor  = .systemBackground
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        view.addSubview(homeFeedTable)
        let headerVeiw = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 400))
        
        homeFeedTable.tableHeaderView = headerVeiw
        configureNavBar()
//        getTrendingMovies()
        
//        var bob:Person? = Person(name: "Bob");
//        var alic:Person? = Person(name: "Alice");
//        bob?.friend = alic
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
        
    }
    
    
    func configureNavBar()  {
        
        var image = UIImage(named: "netflix_logo")
        image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("offset top")
//        print(scrollView.contentOffset.y)
//        print("default offet")
        let defaultoffset = view.safeAreaInsets.top
//        print(defaultoffset)
        let offset = scrollView.contentOffset.y + defaultoffset
//        print(-offset)
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
        
    }
    func getTrendingMovies()  {
        
        ApiCaller.shared.getTrendingMovies {( Result) in
            print("1 result");
            switch Result{
                
            case .success(let results):
                print(results)
            case .failure(let error):
                print(error)
            }
        }
        ApiCaller.shared.getTrendingTvs {( Result) in
            print("2 result");

            switch Result{
                
            case .success(let results):
                print(results)
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier , for:  indexPath)  as! CollectionViewTableViewCell
        
        switch indexPath.section {
        case Sections.TrendingTv.rawValue:
            ApiCaller.shared.getTrendingTvs {( Result) in
                print("1 result");
                switch Result{
                    
                case .success(let results):
                    cell.configure(with: results)
                case .failure(let error):
                    print(error)
                }
            }
            
        case Sections.TrendingMovies.rawValue:
            ApiCaller.shared.getTrendingMovies {( Result) in
                print("1 result");
                switch Result{
                    
                case .success(let results):
                    cell.configure(with: results)
                case .failure(let error):
                    print(error)
                }
            }
            
        case Sections.Upcoming.rawValue:
            ApiCaller.shared.getUpcoming {( Result) in
                print("1 result");
                switch Result{
                    
                case .success(let results):
                    cell.configure(with: results)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Popular.rawValue:
            ApiCaller.shared.getPopular{( Result) in
                print("1 result");
                switch Result{
                    
                case .success(let results):
                    cell.configure(with: results)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.TopRated.rawValue:
            ApiCaller.shared.getTopRated{( Result) in
                print("1 result");
                switch Result{
                    
                case .success(let results):
                    cell.configure(with: results)
                case .failure(let error):
                    print(error)
                }
            }
        default:
            return UITableViewCell()
        }
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitle[section ]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame  = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height:  header.bounds.height )
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        
    }
    
    
}
