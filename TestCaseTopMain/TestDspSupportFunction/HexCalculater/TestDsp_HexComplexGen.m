function TestDsp_HexComplexGen()

    global TestCaseCfg;

    % Test HexComplexGen
    TestCaseCfg.FunctionName = 'HexComplexGen';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexReal = '0xFFFF';
    HexImag = '0x0001';
    HexComplexRef = '0x0001FFFF';
    [HexComplex] = HexComplexGen(HexReal, HexImag);
    EXPECT_EQ(HexComplexRef, HexComplex);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexReal = ['0xABCD'; '0x0000'; '0x1234'];
    HexImag = ['0x0001'; '0xABCD'; '0xFFFF'];
    HexComplexRef = ['0x0001ABCD'; '0xABCD0000'; '0xFFFF1234'];
    [HexReal] = HexComplexGen(HexReal, HexImag);
    EXPECT_EQ(HexComplexRef, HexReal);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexReal = '0x89ABCDEF';
    HexImag = '0x01234567';
    HexComplexRef = '0x0123456789ABCDEF';
    [HexReal] = HexComplexGen(HexReal, HexImag);
    EXPECT_EQ(HexComplexRef, HexReal);
    
end

