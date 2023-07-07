//
//  Rewind.swift
//  Mobilix
//
//  Created by Werner Mona on 04/05/2023.
//

import Foundation
import SwiftUI

enum Category {
    case limited
    case normal
}

struct Reward: Identifiable {
    var id: UUID = UUID()
    var title: String
    var company: String
    var neededPoints: Int
    var image: String
    var category: Category
    var detail: String
}

let legumesEmma = Reward(
    title: "Panier légumes",
    company: "Chez Emma",
    neededPoints: 700,
    image: "veggyBasket",
    category: Category.limited,
    detail: "Chez Emma, ce n'est que des fruits et légumes de saison. Profites d'un panier de légumes généreux pour 2 personnes. Régale-toi bien !")

let beerJoe = Reward(
    title: "1 bière artisanale",
    company: "Chez Joe",
    neededPoints: 400,
    image: "beer",
    category: Category.normal,
    detail: "Cave à bières artisanales, le bar Chez Joe est un véritable lieu de pèlerinage pour les amateurs de bières de caractère. Viens découvrir un lieu incroyable autour d'une dégustation délicate et savoureuse.")

let oneMonthVelo = Reward(
    title: "Abonnement 1 mois",
    company: "Vélo'v",
    neededPoints: 3000,
    image: "velov",
    category: Category.normal,
    detail: "Rendez vous à la borne Vélo'v, partenaire Mobilix pour profiter d'une sortie sportive et écoresponsable qui te sont précieusement offerts grâce à tes points cumulés !")

let myVelov = Reward(
    title: "My Vélo'v 1mois",
    company: "Vélo'v",
    neededPoints: 5000,
    image: "bicycle",
    category: Category.normal,
    detail: "My Vélo'v, est un vélo à assitance électrique 100% personnel. Tu as le privilège de pouvoir le tester 1 mois grâce à tes nombreux points cumulés ! ")

let petitdejFika = Reward(
    title: "1 formule petit-déj",
    company: "Café Fika",
    neededPoints: 400,
    image: "breakfast",
    category: Category.normal,
    detail: "Si on pouvait résumer en deux mots un endroit chic et cosy, le Café Fika en serait la définition ! Idéal pour partager un moment décontracté avec ton petit déjeuner offert !")

let oneHourTier = Reward(
    title: "Trottinette 1h offerte",
    company: "Tier",
    neededPoints: 700,
    image: "tier",
    category: Category.normal,
    detail: "Avec Tier c'est parti pour bouger sans polluer ! Découvres la ville autrement et profite d'une heure de trottinette gratuite !")

let yogaZen = Reward(
    title: "1 session Yoga",
    company: "Espace Zen",
    neededPoints: 3000,
    image: "yoga",
    category: Category.normal,
    detail: "Viens profiter d'une session de Yoga offerte pour garder la forme tout en restant zen et détendu grâce à tes points Mobilix ! ")

let legumes = Reward(
    title: "-30% légumes",
    company: "Chez Emma",
    neededPoints: 400,
    image: "vegetables",
    category: Category.normal,
    detail: "Producteur Responsable, Chez Emma est l'endroit idéal pour consommer frais et régional ! Viens vite profiter de ta récompense de -30% sur les légumes ")

let sortieVelo = Reward(
    title: "Visite guidée à vélo",
    company: "ONLYLYON",
    neededPoints: 2000,
    image: "sortieVelo",
    category: Category.normal,
    detail: "Découvrir ou redécouvrir Lyon sans se fatiguer grâce à un vélo à assistance électrique avec l'un de nos guides certifiés et amoureux de la ville.")

var rewardsList: [Reward] = [beerJoe, myVelov, petitdejFika, yogaZen, oneMonthVelo, oneHourTier, legumes, sortieVelo]
