//
//  ViewController.swift
//  Conversores
//
//  Created by Anne Victoria Batista Auzier on 05/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField! // insere valor
    
    @IBOutlet weak var btUnit1: UIButton! // esquerdo
    @IBOutlet weak var btUnit2: UIButton! // direito
    
    @IBOutlet weak var lbUnit: UILabel! // titulo
    @IBOutlet weak var lbResult: UILabel! // label dos resultados
    @IBOutlet weak var lbResultUnit: UILabel! // label final
    
    /*
     mudar o texto do titulo ok
     alpha do botao ok
     permanecer o valor inserido automaticamente ok
     conversao
     atualizar na label final
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBAction func showNext(_ sender: UIButton) {
     
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libras", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Dólar", for: .normal)
                btUnit2.setTitle("Real", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit2.setTitle("Farenheint", for: .normal)
                btUnit1.setTitle("Celsius", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text! {
            case "Temperatura":
                calcTemp()
            case "Peso":
                calcPeso()
            case "Moeda":
                calcMoeda()
            default:
                calcDist()
        }
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%0.2f", result)
    }
    
    func calcTemp() {
        guard let temperatura = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Farenheint"
            lbResult.text = String((temperatura * 1.8) + 32.0)
        }else{
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperatura - 32.0 ) / 1.8)
        }
    }
    func calcPeso() {
        guard let peso = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Libras"
            lbResult.text = String(peso / 2.20462)
            
        }else{
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(peso * 2.20462)
        }
    }
    func calcMoeda() {
        guard let moeda = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Real"
            lbResult.text = String(moeda * 5.45)
           
        }else{
            lbResultUnit.text = "Dólar"
            lbResult.text = String(moeda / 5.45)
        }
    }
    func calcDist() {
        guard let distancia = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Kilômetro"
            lbResult.text = String(distancia / 1000)
           
        }else{
            lbResultUnit.text = "Metro"
            lbResult.text = String(distancia * 1000)
        }
    }

}
