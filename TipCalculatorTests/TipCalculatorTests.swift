import UIKit
import XCTest

class TipCalculatorTests: XCTestCase {
    var tipCalculator: TipCalculatorModel?
    
    override func setUp() {
        super.setUp()
        tipCalculator = TipCalculatorModel(total: 100, taxPct: 0.2)
    }

    func testCalculationOfSubtotal() {
        XCTAssertEqualWithAccuracy(tipCalculator!.subtotal, (100 / (1.2)), 0.001)
        tipCalculator!.taxPct = 0.25
        XCTAssertEqualWithAccuracy(tipCalculator!.subtotal, (100 / (1.25)), 0.001)
        tipCalculator!.total = 150
        XCTAssertEqualWithAccuracy(tipCalculator!.subtotal, (150 / (1.25)), 0.001)
    }

    func testCalculateTipWithValidTipPct() {
        XCTAssertEqualWithAccuracy(tipCalculator!.calcTipWithTipPct(0), 0.0, 0.001)
        XCTAssertEqualWithAccuracy(tipCalculator!.calcTipWithTipPct(0.1), (0.1 * tipCalculator!.subtotal), 0.001)
        XCTAssertEqualWithAccuracy(tipCalculator!.calcTipWithTipPct(1.0), tipCalculator!.subtotal, 0.001)
    }
}