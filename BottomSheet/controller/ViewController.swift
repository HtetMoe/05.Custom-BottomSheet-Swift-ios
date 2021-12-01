//
//  ViewController.swift
//  BottomSheet
//  https://www.youtube.com/watch?v=3LHXJCkfzIQ
//  Created by Htet Moe Phyu on 01/12/2021.

import UIKit
class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnShowHide: UIButton!
    
    //constraint
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    private var isShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnShowHide.layer.cornerRadius = 16
        btnShowHide.clipsToBounds     = true
        
        bottomView.layer.cornerRadius  = 20
        bottomView.clipsToBounds      = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.trailingConstraint.constant = self.view.frame.width
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        if(isShow){
            //do hide
            UIView.animate(withDuration: 0.3) {
                self.bottomViewHeightConstraint.constant = 0
                self.trailingConstraint.constant        = self.view.frame.width
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.isShow = false
            }
        }
        else{
            //do show
            UIView.animate(withDuration: 0.1) {
                self.bottomViewHeightConstraint.constant = 420
                self.trailingConstraint.constant = 10
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.isShow = true
                
                //for bounce animation
                //UIView.animate(withDuration: 0.1) {
                //    self.bottomViewHeightConstraint.constant = 400
                //    self.view.layoutIfNeeded()
                //} completion: { (status) in}
            }
        }
    }//close btn pressed
}

