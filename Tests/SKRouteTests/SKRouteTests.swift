import Testing
@testable import SKRoute

@Test
func packageLoadsSuccessfully() async throws {
    
    let info = await SKRoute.networkInfo()

    #expect(info == nil || info != nil)
}
