function TestDsp_ComplexDec2Hex()
% aaa bb
    global TestCaseCfg;

    % Test ComplexDec2Hex
    TestCaseCfg.FunctionName = 'ComplexDec2Hex';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DecData = 3 + 5i;
    HexComplexRef = '0x00050003';
    [HexComplex] = ComplexDec2Hex(DecData);
    EXPECT_EQ(HexComplexRef, HexComplex);
    
    %% TestCase2
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DecData = 3 + 5i;
    HexComplexRef = '0x0005_0003';
    [HexComplex] = ComplexDec2Hex(DecData, 4, '_');
   EXPECT_EQ(HexComplexRef, HexComplex);
end
