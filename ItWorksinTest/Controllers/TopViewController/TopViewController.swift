//
//  TopViewController.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 04.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import UIKit

final class TopViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet private weak var tabBarView: TabBarView!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Private
    
    enum ListMode: Int {
        case best
        case discussed
    }
    
    private var listMode = ListMode.best
    
    private var topDataArray = [TopData]()
    private var topDataBestArray = [TopData]()
    private var topDataDiscussedArray = [TopData]()
    
}

// MARK: - Setup

private extension TopViewController {
    
    func setup() {
        setupNavigationBar()
        setupTabBarItems()
        setupTableView()
        setData()
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = .makeBackButton(
            target: self,
            action: #selector(backAction)
        )
        
        setTitle(AppStyle.ScreenType.top.title, andImage: AppStyle.NavigationBarButton.top.icon)
        
        let infoButton = UIBarButtonItem.makeButton(
            image: AppStyle.NavigationBarButton.info.icon,
            target: self,
            action: #selector(infoAction)
        )
        let addButton = UIBarButtonItem.makeButton(
            image: AppStyle.NavigationBarButton.add.icon,
            target: self,
            action: #selector(addAction)
        )
        navigationItem.rightBarButtonItems = [addButton, infoButton]
        
        addShadowToBar()
    }
    
}

// MARK: - Setup tabbar

private extension TopViewController {
    
    func setupTabBarItems() {
        tabBarView.delegate = self
        
        tabBarView.set(
            items: [
                TabBarView.Item(title: NSLocalizedString("Лучшее", comment: "tabbar")),
                TabBarView.Item(title: NSLocalizedString("Обсуждаемое", comment: "tabbar"))
            ]
        )
    }
    
}

// MARK: - TabBarViewDelegate

extension TopViewController: TabBarViewDelegate {
    
    func tabBarView(_ tabbBarView: TabBarView, didSelect index: Int) {
        let mode = ListMode(rawValue: index)!
        self.listMode = mode
        listModeType(mode, animated: true)
    }
    
    func listModeType(_ listMode: ListMode, animated: Bool) {
        switch listMode {
        case .best:
            topDataArray = topDataBestArray
        case .discussed:
            topDataArray = topDataDiscussedArray
        }
        
        tableView.reloadData()
    }
    
}

// MARK: - User interaction

private extension TopViewController {
    
    @objc
    func backAction() {
        navigationController?.navigationBar.barTintColor = AppStyle.ScreenType.main.color
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func infoAction() {
        print(#function)
    }
    
    @objc
    func addAction() {
        print(#function)
    }
    
}

// MARK: - Setup tableView

private extension TopViewController {
    
    func setupTableView() {
        tableView.register(nibForHeaderFooter: TopHeaderView.self)
        tableView.register(nib: TopTableViewCell.self)
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension TopViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return topDataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withClass: TopHeaderView.self)
        
        header.set(title: topDataArray[section].section)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topDataArray[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(class: TopTableViewCell.self, for: indexPath)
        
        let model = topDataArray[indexPath.section].data[indexPath.row]
        cell.set(model: model, index: indexPath.row + 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - Set

private extension TopViewController {
    
    func setData() {
        topDataBestArray.append(
            TopData(
                section: "Январь - Март 2020",
                data: [
                    TopModel(
                        countLikes: 251,
                        bigImage: "big_image_1",
                        smallImage: "small_image_1",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 220,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 141,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    ),
                    TopModel(
                        countLikes: 251,
                        bigImage: "big_image_1",
                        smallImage: "small_image_1",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 220,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 141,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    )
                ]
            )
        )
        
        topDataBestArray.append(
            TopData(
                section: "Апрель - Июль 2020",
                data: [
                    TopModel(
                        countLikes: 251,
                        bigImage: "big_image_1",
                        smallImage: "small_image_1",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 220,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 141,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    ),
                    TopModel(
                        countLikes: 251,
                        bigImage: "big_image_1",
                        smallImage: "small_image_1",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 220,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 141,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    )
                ]
            )
        )
        
        topDataDiscussedArray.append(
            TopData(
                section: "Сентябрь - Октябрь 2020",
                data: [
                    TopModel(
                        countLikes: 245,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 220,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 141,
                        bigImage: "big_image_1",
                        smallImage: "small_image_1",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    ),
                    TopModel(
                        countLikes: 251,
                        bigImage: "big_image_1",
                        smallImage: "small_image_1",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 220,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 141,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    )
                ]
            )
        )
        
        topDataDiscussedArray.append(
            TopData(
                section: "Ноябрь - Декабрь 2020",
                data: [
                    TopModel(
                        countLikes: 234,
                        bigImage: "big_image_1",
                        smallImage: "small_image_1",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 546,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 233,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    ),
                    TopModel(
                        countLikes: 345,
                        bigImage: "big_image_2",
                        smallImage: "small_image_2",
                        number: "A00000000011",
                        title: "How to feed a snake and preserve skin",
                        fullName: "Kyle Mccoy"
                    ),
                    TopModel(
                        countLikes: 220,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000012",
                        title: "50 Foods That Are Super Healthy",
                        fullName: "Wade Warren"
                    ),
                    TopModel(
                        countLikes: 141,
                        bigImage: "big_image_3",
                        smallImage: "small_image_3",
                        number: "A00000000017",
                        title: "Climb in mountain",
                        fullName: "Guy Hawkins"
                    )
                ]
            )
        )
        
        topDataArray = topDataBestArray
        
        tableView.reloadData()
    }
    
}
