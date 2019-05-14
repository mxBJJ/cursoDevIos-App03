//
//  ViewController.swift
//  Alcool ou Gaolina
//
//  Created by Max Mendes on 13/05/19.
//  Copyright © 2019 Curso iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var precoAlcool: UITextField!
    @IBOutlet weak var precoGasolina: UITextField!
    
    
    @IBAction func btnCalcular(_ sender: Any) {
        if let alcool = precoAlcool.text{
            if let gasolina = precoGasolina.text{
             var hasValidacao = self.validarCampos(precoAlcool: alcool, precoGasolina: gasolina)
                
                if hasValidacao == true{
                    let resposta = calcular(precoAlcool: alcool, precoGasolina: gasolina)
                    texto.textColor = UIColor.white
                    texto.text = "É melhor utilizar " + resposta + "!"
                }else{
                    texto.textColor = UIColor.red
                    texto.text  = "Preencha os campos corretamente."
                }
            }
        }
    }
    
    @IBAction func limparAlcool(_ sender: Any) {
        precoAlcool.text = ""
    }
    
    
    @IBAction func limparGasolina(_ sender: Any) {
        precoGasolina.text = ""
    }
    
    func validarCampos(precoAlcool:String, precoGasolina:String) -> Bool {
        if precoAlcool.isEmpty{
            return false
        }else if precoGasolina.isEmpty{
            return false
        }else{
            return true
        }
    }
    
    func calcular(precoAlcool:String, precoGasolina:String) -> String {
        let valorAlcool = Double(precoAlcool)!
        let valorGasolina = Double(precoGasolina)!
        
        let resultado = valorAlcool/valorGasolina
        
        if resultado >= 0.7{
            return "Gasolina"
        }else{
            return "Álcool"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }


}

