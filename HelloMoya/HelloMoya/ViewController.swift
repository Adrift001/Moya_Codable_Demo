//
//  ViewController.swift
//  HelloMoya
//
//  Created by Adrift on 2017/12/13.
//  Copyright © 2017年 Adrift. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class ViewController: UIViewController {

    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let provider = MoyaProvider<Httpbin>()
        provider.rx.request(.ip).mapForObject(IP.self).subscribe(onNext: { (ip) in
            print(ip.origin)
        }, onError: { (error) in
            print(error)
        }).disposed(by: bag)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

