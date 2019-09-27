//
//  RestaurantesController.swift
//  Restaurantes
//
//  Created by Alumno on 9/25/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class RestaurantesController : UIViewController, UITableViewDataSource, UITableViewDelegate{
    var restaurantes : [Restaurante] = []
    
    override func viewDidLoad() {
        restaurantes.append(Restaurante(nombre: "restaurante 1" ,direccion: "Calle 1 #203", telefono: "5184786324", descripcion: "Restaurante de la calle 1"))
        restaurantes.append(Restaurante(nombre: "restaurante 2" ,direccion: "Calle 2 #622", telefono: "3124679821", descripcion: "Restaurante de la calle 2"))
        restaurantes.append(Restaurante(nombre: "restaurante 3" ,direccion: "Calle 3 #873", telefono: "5410239750", descripcion: "Restaurante de la calle 3"))
        restaurantes.append(Restaurante(nombre: "restaurante 4" ,direccion: "Calle 4 #762", telefono: "0312407548", descripcion: "Restaurante de la calle 4"))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaRestaurante")
        celda?.textLabel?.text = restaurantes[indexPath.row].nombre
        return celda!
    }
    
    

    @IBOutlet weak var TVRestaurantes: UITableView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToDetalleRestaurante" {
            let destino = segue.destination as? DetalleRestauranteController
            destino?.restaurante = restaurantes[TVRestaurantes.indexPathForSelectedRow!.row]
        }
    }
}
