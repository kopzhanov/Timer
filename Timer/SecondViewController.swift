//
//  SecondViewController.swift
//  Timer
//
//  Created by Alikhan Kopzhanov on 25.05.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var time = 0
    var startTime = 0
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = timeToString(time)
        startTime = time
        // Do any additional setup after loading the view.
    }
    
    @objc func countTimer(){
        time -= 1
        label.text = timeToString(time)
        if time == 0 {
            timer.invalidate()
            isTimerRunning = false
        }
    }
    
    @IBAction func playPauseTimer(_ sender: Any) {
        if !isTimerRunning{
            if time == 0 || isTimerRunning{
                return
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
        } else {
            timer.invalidate()
            isTimerRunning = false
        }
        
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        time = startTime
        label.text = timeToString(time)
    }
    
    func timeToString (_ intTime: Int) -> String{
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
