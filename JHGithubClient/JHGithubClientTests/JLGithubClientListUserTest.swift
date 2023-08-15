//
//  JLGithubClientListUserTest.swift
//  JHGithubClientTests
//
//  Created by Aaron on 2023/8/15.
//

import XCTest
import Combine
@testable import JHGithubClient

class MockURLProtocol: URLProtocol {
    static var mockResponse: (Data?, URLResponse?, Error?)?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let (data, response, error) = Self.mockResponse {
            if let data = data {
                self.client?.urlProtocol(self, didLoad: data)
            }
            if let response = response {
                self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            if let error = error {
                self.client?.urlProtocol(self, didFailWithError: error)
            }
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}

class LoadGitHubUsersRequestTests: XCTestCase {
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        // Inject the mock URLSession or replace the default URLSession here if needed
    }
    
    func testLoadGitHubUsersRequest() {
        guard let mockData = jsonString.data(using: .utf8) else {
            fatalError("Failed to convert JSON string to Data")
        }
        let mockResponse = HTTPURLResponse(url: URL(string: "https://api.github.com/users")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
        
        MockURLProtocol.mockResponse = (mockData, mockResponse, nil)
        
        let expectation = self.expectation(description: "LoadGitHubUsersRequest completes")
        let request = LoadGitHubUsersRequest(since: 0, perPage: 30, token: "")
        
        request.publisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Request failed with error: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { users in
                XCTAssertEqual(users.count, 30)
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}


let jsonString = """
[
  {
    "login": "user1",
    "id": 101,
    "node_id": "MDQ6VXNlcjE=",
    "avatar_url": "https://example.com/user1.jpg",
    "url": "https://api.github.com/users/user1",
    "type": "User",
    "site_admin": false
  },
  {
    "login": "user2",
    "id": 102,
    "node_id": "MDQ6VXNlcjE=",
    "avatar_url": "https://example.com/user2.jpg",
    "url": "https://api.github.com/users/user2",
    "type": "User",
    "site_admin": false
  }
]
"""
