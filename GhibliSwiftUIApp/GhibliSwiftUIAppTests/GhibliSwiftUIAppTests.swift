//
//  GhibliSwiftUIAppTests.swift
//  GhibliSwiftUIAppTests
//
//  Created by Jancy on 3/28/26.
//

import Testing
@testable import GhibliSwiftUIApp


struct GhibliSwiftUIAppTests {

    @MainActor
    @Test func testInitialState() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let service = MockGhibliService()
        let viewModel = SearchFilmsViewModel(service: service)
        
        #expect(viewModel.state.data == nil)
        
        if case .idle = viewModel.state {
            
        } else {
            Issue.record("Expected idle state")
        }
    }
    
    @MainActor
    @Test("Search with query filters results")
    func testSearchWithQuery() async {
        let service = MockGhibliService()
        let viewModel = SearchFilmsViewModel(service: service)
        
        await viewModel.fetch(for: "Totoro")
        
        #expect(viewModel.state.data?.count == 1)
        #expect(viewModel.state.data?.first?.title == "My Neighbor Totoro")
    }

}
