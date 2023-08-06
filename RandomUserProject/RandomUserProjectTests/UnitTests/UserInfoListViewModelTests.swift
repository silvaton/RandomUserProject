//
//  UserInfoListViewModelTests.swift
//  RandomUserProjectTests
//
//  Created by Ton Silva on 6/8/23.
//

import XCTest
@testable import RandomUserProject

final class UserInfoListViewModelTests: XCTestCase {
    var viewModel: UserInfoListViewModel!
    var mockNetwork: MockNetwork!
    
    func testFetchDataSuccess() {
            viewModel = UserInfoListViewModel()
            mockNetwork = MockNetwork()
            viewModel.network = mockNetwork
            mockNetwork.shouldSucceed = true
            
            let expectation = XCTestExpectation(description: "Fetch data success")
            
            viewModel.fetchData()
                        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                XCTAssertFalse(self.viewModel.isLoading, "isLoading should be false after network fetch.")
                XCTAssertTrue(self.viewModel.users.count > 0, "Users should be populated after successful fetch.")
                XCTAssertTrue(self.viewModel.errorMessage.isEmpty, "errorMessage should be empty after successful fetch.")
                
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5.0)
        }
        
        func testFetchDataFailure() {
            viewModel = UserInfoListViewModel()
            mockNetwork = MockNetwork()
            viewModel.network = mockNetwork
            mockNetwork.shouldSucceed = false
            
            let expectation = XCTestExpectation(description: "Fetch data failure")
            
            viewModel.fetchData()
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                XCTAssertFalse(self.viewModel.isLoading, "isLoading should be false after network fetch.")
                XCTAssertTrue(self.viewModel.users.isEmpty, "Users should be empty after failed fetch.")
                XCTAssertFalse(self.viewModel.errorMessage.isEmpty, "errorMessage should contain error message after failed fetch.")
                
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 5.0)
        }
    
    func testAddToBlacklist() {
         viewModel = UserInfoListViewModel()
         let userIDToAdd = "user123"
         
         XCTAssertFalse(viewModel.isUserBlackListed(userID: userIDToAdd), "User should not be blacklisted initially.")
         
         viewModel.addToBlackList(userID: userIDToAdd)
         
         XCTAssertTrue(viewModel.isUserBlackListed(userID: userIDToAdd), "User should be blacklisted after adding.")
     }
     
     func testRemoveFromBlacklist() {
         viewModel = UserInfoListViewModel()
         let userIDToAdd = "user123"
         
         viewModel.addToBlackList(userID: userIDToAdd)
         XCTAssertTrue(viewModel.isUserBlackListed(userID: userIDToAdd), "User should be blacklisted initially.")
         
         viewModel.removeFromBlacklist(userID: userIDToAdd)
         
         XCTAssertFalse(viewModel.isUserBlackListed(userID: userIDToAdd), "User should not be blacklisted after removal.")
     }

    override func tearDownWithError() throws {
        viewModel = nil
        mockNetwork = nil
    }

}
