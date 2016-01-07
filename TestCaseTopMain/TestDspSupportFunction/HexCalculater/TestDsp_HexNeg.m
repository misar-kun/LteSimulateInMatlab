function TestDsp_HexNeg()

    global TestCaseCfg;
    TestCaseCfg.FunctionName = 'HexNeg';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0001';
    HexNegRef = '0xFFFF';
    [HexNegRet] = HexNeg(HexData);
    EXPECT_EQ(HexNegRef, HexNegRet);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = ['0x0001'; '0x0000'; '0xFFFF'];
    HexNegRef = ['0xFFFF'; '0x0000'; '0x0001'];
    [HexNegRet] = HexNeg(HexData);
    EXPECT_EQ(HexNegRef, HexNegRet);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0000001';
    HexNegRef = '0xFFFFFFF';
    [HexNegRet] = HexNeg(HexData);
    EXPECT_EQ(HexNegRef, HexNegRet);
    
end
