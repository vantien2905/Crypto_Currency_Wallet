//
//  NotInternetViewController.swift
//  Crypto_Currency_Wallet
//
//  Created by Tien Dinh on 15/06/2021.
//

import UIKit

class LostInternetViewController: UIViewController {
    
    let defaultPadding = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        ReachabilityHelper.shared.reachability.subscribeEvents(self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        ReachabilityHelper.shared.reachability.unsubscribeEvents(self)
    }

    private func configureViews() {
        view.backgroundColor = .white
        let imageView = UIImageView(image: IMG.lost_connection_logo.image)
        
        let title = UILabel().build {
            $0.text = L10n.notInternetTitle
            $0.font = UIFont.boldSystemFont(ofSize: 26)
            $0.textAlignment = .center
        }
        
        let subtitle = UILabel().build {
            $0.text = L10n.notInternetContent
            $0.numberOfLines = 0
            $0.font = UIFont.systemFont(ofSize: 17)
            $0.textAlignment = .center
        }
        
        let button = UIButton().build {
            $0.setTitle(L10n.notInternetAction, for: .normal)
            $0.backgroundColor = AppColor.search
            $0.addTarget(self,
                         action: #selector(openSettingTaped),
                         for: .touchUpInside)
        }
        
        view.addSubviews([imageView, title, subtitle, button])
        
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(220)
        }
        
        button.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(40)
            $0.top.equalTo(imageView.snp.bottom).inset(-40)
        }
        
        subtitle.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultPadding)
            $0.bottom.equalTo(imageView.snp.top).inset(-defaultPadding)
        }
        
        title.snp.makeConstraints {
            $0.bottom.equalTo(subtitle.snp.top).inset(-defaultPadding)
            $0.height.equalTo(31)
            $0.leading.trailing.equalToSuperview().inset(defaultPadding)
        }
    }
    
    @objc func openSettingTaped() {
        ReachabilityHelper.openSetting()
    }
}

extension LostInternetViewController: ReachabilityServiceEvents {
    func reachabilityService(
        _ service: ReachabilityService,
        status: ReachabilityService.Status) {
        switch status {
        case .notReachable:
            break
        default:
            dismiss()
        }
    }
}

