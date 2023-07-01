//
//  main.swift
//  Study_week2
//
//  Created by Whales on 2023/05/06.
//

// MARK: 실험 1: 타입을 정의해봅시다. 실험 2: 인스턴스가 서로 객체지향적으로 소통할 수 있도록 해봅시다.

var kobe: ShopManager = ShopManager(name: "Korea", price: 1000)
var moon: ShopManager = ShopManager(name: "America", price: 500)

var dasan: Camper = Camper()

try dasan.buy(from: kobe)
try dasan.buy(from: kobe)
try dasan.buy(from: moon)
