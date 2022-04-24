//
//  DetailsViewModelTests.swift
//  leboncoinTests
//
//  Created by Saiefeddine HAYOUNI on 27/04/2022.
//


import XCTest
@testable import leboncoin

class DetailsViewModelTests: XCTestCase {

    var viewModel: DetailsViewModel!
    
    let listingModel = listingEntity(image: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/4e72a204a34524ce0c6e7cc8b3826f2749138570.jpg"),
                                   name: "Joli meuble commode tiroir mirroir ancien",
                                   date: "2019-11-05T15:56:35+0000",
                                   description: "",
                                   price: 35,
                                   isUrgent: true,
                                   category: Categories(rawValue: 6))
 
    override func setUp() {
        viewModel = DetailsViewModel(item: listingModel)

    }
    
    func test__ItemImageShouldBeEqualToViewModelImage() throws {
        XCTAssertEqual(viewModel.image , listingModel.image)
    }
    func test__ItemDescriptionShouldBeEqualToViewModelDescription() throws {
        XCTAssertEqual(viewModel.description , listingModel.description)
    }
    func test__ItemCategoryShouldBeEqualToViewModelCategory() throws {
        XCTAssertEqual(viewModel.category , listingModel.category)
    }
    func test__ItemINameShouldBeEqualToViewModelName() throws {
        XCTAssertEqual(viewModel.name , listingModel.name)
    }
    func test__ItemDateShouldBeEqualToViewModelDate() throws {
        XCTAssertEqual(viewModel.date , listingModel.date)
    }
}
