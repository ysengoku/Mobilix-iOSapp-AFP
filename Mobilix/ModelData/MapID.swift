//
//  MapID.swift
//  Mobilix
//
//  Created by Werner Mona on 04/05/2023.
//

import Foundation
import CoreLocation


/*enum Mobility {
    case bicycle
    case scooter
    case car
}*/

struct Place : Identifiable {
    var id = UUID()
    var title : String
    var description : String
    var latitude : Double
    var longitude : Double
    var adress : String = "Adresse de mon evenement"
    var mobility : Mobility
    var points: Int
    var logo: String
    var type : String
}

        
var place1: Place = Place(
    title: "Vélo'v",
    description: "Vélo en libre service, disponible 24h sur 24 et 7 jours sur 7 dans la Métropole de  Lyon. Après ton trajet, il doit être rendu dans l'une des 428 stations.",
    latitude: 45.7571765,
    longitude: 4.896809,
    adress: "34 rue Antoine Primat, 69100 Villeurbanne",
    mobility : .bicycle,
    points: 15,
    logo: "velov3",
    type: "ce vélo")

var place2: Place = Place(
    title: "Vélo'v",
    description: "Vélo en libre service, disponible 24h sur 24 et 7 jours sur 7 dans la Métropole de  Lyon. Après ton trajet, il doit être rendu dans l'une des 428 stations.",
    latitude: 45.760506282974454,
    longitude: 4.852023861403225,
    adress: "190 Rue Garibaldi, 69003 Lyon",
    mobility : .bicycle,
    points: 15,
    logo: "velov3",
type: "ce vélo")

var place3: Place = Place(
    title: "Vélo'v",
    description: "Vélo en libre service, disponible 24h sur 24 et 7 jours sur 7 dans la Métropole de  Lyon. Après ton trajet, il doit être rendu dans l'une des 428 stations.",
    latitude: 45.74698701154571,
    longitude: 4.8408860754018646,
    adress: "55 Rue Saint-Jérôme, 69007 Lyon",
    mobility : .bicycle,
    points: 15,
    logo: "velov3",
type: "ce vélo")

var place4: Place = Place(
    title: "Vélo'v",
    description: "Vélo en libre service, disponible 24h sur 24 et 7 jours sur 7 dans la Métropole de  Lyon. Après ton trajet, il doit être rendu dans l'une des 428 stations.",
    latitude: 45.76666664276239,
    longitude: 4.863475678902791,
    adress: "55 Rue Bellecombe, 69006 Lyon",
    mobility : .bicycle,
    points: 15,
    logo: "velov3",
type: "ce vélo")

var place5: Place = Place(
    title: "Tier",
    description: "Trottinettes éléctriques en libre-service. Après ton trajet, elle doit être stationnée dans des aires dédiées, 271 stations reparties sur Lyon et Villeurbanne.",
    latitude: 45.74110565632399,
    longitude: 4.864239437029534,
    adress: "63 bis Rue Villon, 69008 Lyon",
    mobility: .scooter,
    points: 20,
    logo: "tier2",
type: "cette trottinette")
        
var place6: Place = Place(
    title: "Dott",
    description: "Trottinettes éléctriques en libre-service. Après ton trajet, elle doit être stationnée dans des aires dédiées, 271 stations reparties sur Lyon et Villeurbanne.",
    latitude: 45.762628566249575,
    longitude: 4.82714336256191,
    adress : "2 Place Neuve Saint-Jean, 69005 Lyon",
    mobility: .scooter,
    points: 20,
    logo: "dott1",
type: "cette trottinette")

var place7: Place = Place(
    title: "Dott",
    description: "Trottinettes éléctriques en libre-service. Après ton trajet, elle doit être stationnée dans des aires dédiées, 271 stations reparties sur Lyon et Villeurbanne.",
    latitude: 45.74107832706299,
    longitude: 4.819292410030465,
    adress : "101 Cours Charlemagne, 69002 Lyon",
    mobility: .scooter,
    points: 20,
    logo: "dott1",
type: "cette trottinette")

var place8: Place = Place(
    title: "Tier",
    description: "Trottinettes éléctriques en libre-service. Après ton trajet, elle doit être stationnée dans des aires dédiées, 271 stations reparties sur Lyon et Villeurbanne.",
    latitude: 45.75151992824593,
    longitude: 4.877783270583209,
    adress : "1 Rue Jules Verne, 69003 Lyon",
    mobility: .scooter,
    points: 20,
    logo: "tier2",
type: "cette trotinette")

var place9: Place = Place(
    title: "Citiz",
    description: "Voitures électriques en libre-service à votre disposition 24h/24 disponibles dans plus de 100 stations dans la Métropole de Lyon.",
    latitude: 45.792413,
    longitude: 4.835244,
    adress : "3 Promenade de la Nigritelle Noire, 69100 Villeurbanne",
    mobility: .car,
    points: 25,
    logo: "citiz1",
type: "cette voiture")

var place10: Place = Place(
    title: "Citiz",
    description: "Voitures électriques en libre-service à votre disposition 24h/24 disponibles dans plus de 100 stations dans la Métropole de Lyon.",
    latitude: 45.77717055328226,
    longitude: 4.836935931937578,
    adress : "37 Rue d'Ivry, 69004 Lyon",
    mobility: .car,
    points: 25,
    logo: "citiz1",
type: "cette voiture")

var place11: Place = Place(
    title: "Citiz",
    description: "Voitures électriques en libre-service à votre disposition 24h/24 ddisponibles dans plus de 100 stations dans la Métropole de Lyon.",
    latitude: 45.74644364373526,
    longitude: 4.84991488665151,
    adress : "359 Rue Garibaldi, 69007 Lyon",
    mobility: .car,
    points: 25,
    logo: "citiz1",
type: "cette voiture")

var place12: Place = Place(
    title: "Citiz",
    description: "Voitures électriques en libre-service à votre disposition 24h/24 disponibles dans plus de 100 stations dans la Métropole de Lyon.",
    latitude: 45.792413,
    longitude: 4.835244,
    adress : "1 Boulevard Paul Doumer, 69300 Caluire-et-Cuire",
    mobility: .car,
    points: 25,
    logo: "citiz1",
type: "cette voiture")
        

var places: [Place] = [place1, place2, place3, place4, place5, place6, place7, place8, place9, place10, place11, place12]

