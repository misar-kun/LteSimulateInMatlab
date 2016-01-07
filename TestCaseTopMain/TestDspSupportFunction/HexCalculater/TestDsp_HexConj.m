function TestDsp_HexConj()

    global TestCaseCfg;

    % Test HexConj
    TestCaseCfg.FunctionName = 'HexConj';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexComplexData = '0xFFFFFFFF';
    HexConjRef = '0x0001FFFF';
    [HexConjRet] = HexConj(HexComplexData);
    EXPECT_EQ(HexConjRef, HexConjRet);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexComplexData = ['0x0001ABCD'; '0xABCD0000'; '0xFFFF1234'];
    HexConjRef = ['0xFFFFABCD'; '0x54330000'; '0x00011234'];
    [HexConjRet] = HexConj(HexComplexData);
    EXPECT_EQ(HexConjRef, HexConjRet);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexComplexData = '0x0123456789ABCDEF';
    HexConjRef = '0xFEDCBA9989ABCDEF';
    [HexConjRet] = HexConj(HexComplexData);
    EXPECT_EQ(HexConjRef, HexConjRet);
    
end

