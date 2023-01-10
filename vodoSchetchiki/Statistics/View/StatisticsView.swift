//
//  StatisticsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 12.12.2022.
//

import UIKit

class StatisticsView: UIView {
    
    //MARK: - Private prorperties
    
    var viewModel = StatisticsViewModel()
    var metersData: [MetersModel] = []
    
    private var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var thirdView: BaseStatisticsView = {
        let view = BaseStatisticsView()
        //        view.backgroundColor = .white
        //        view.layer.cornerRadius = 30
        //        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.layer.shadowRadius = 5
        //        view.layer.shadowOffset = CGSize(width: 1.3, height: 1.3)
        //        view.layer.shadowOpacity = 3
        //        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    
    private var mounthsView: XAxisView = {
        let view = XAxisView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var yAxisView: YAxisView = {
        let view = YAxisView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) var chartView: ChartView = {
        let view = ChartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let coldStatisticCollectionView: StatisticsCollectionView = {
        let layout = StatisticFlowLayout()
        let view = StatisticsCollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    //MARK: - Constraction
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        coldStatisticCollectionView.register(StatisticsColdWaterCollectionViewCell.self,
                                             forCellWithReuseIdentifier: "Cold")
        getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public function
    
    public func getData() {
        viewModel.getData { [weak self] model in
            guard let self else { return }
            self.metersData = model
            DispatchQueue.main.async {
                self.yAxisView.setupView(with: model)
                self.chartView.drawDashLines(with: model)
                self.chartView.drawChartColdMeter(with: model)
                self.chartView.drawChartHotMeter(with: model)
            }
            self.coldStatisticCollectionView.reloadData()
        } failture: { error in
            print(error.description)
        }
        
    }
    
    //MARK: - Private functions
    
    private func setupView() {
        backgroundColor = .white
        addSubview(secondView)
        addSubview(thirdView)
        addSubview(mounthsView)
        addSubview(yAxisView)
        addSubview(coldStatisticCollectionView)
        addSubview(chartView)
        
        NSLayoutConstraint.activate([
            
            secondView.topAnchor.constraint(equalTo: topAnchor),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100),
            
            thirdView.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            thirdView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            thirdView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            thirdView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            
            mounthsView.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 40),
            mounthsView.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -10),
            mounthsView.bottomAnchor.constraint(equalTo: thirdView.bottomAnchor, constant: -30),
            mounthsView.heightAnchor.constraint(equalToConstant: 10),
            
            yAxisView.topAnchor.constraint(equalTo: thirdView.topAnchor, constant: 30),
            yAxisView.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 10),
            yAxisView.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 3),
            yAxisView.heightAnchor.constraint(equalToConstant: 10),
            
            chartView.topAnchor.constraint(equalTo: yAxisView.topAnchor, constant: 0),
            chartView.leadingAnchor.constraint(equalTo: yAxisView.leadingAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: mounthsView.bottomAnchor, constant: -12),
            
//            coldStatisticCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
//            coldStatisticCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            coldStatisticCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            coldStatisticCollectionView.bottomAnchor.constraint(equalTo: chartView.topAnchor, constant: -30),
//            coldStatisticCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        self.coldStatisticCollectionView.delegate = self
        self.coldStatisticCollectionView.dataSource = self
    }
}

//MARK: - Extention

extension StatisticsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.meters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cold", for: indexPath) as? StatisticsColdWaterCollectionViewCell else { return UICollectionViewCell() }
        let model = viewModel.meters[indexPath.row]
        cell.configureCell(model)
        return cell
    }
}
