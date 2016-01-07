function TestDsp_HexNeg()

    global TestCaseCfg;
    TestCaseCfg.FunctionName = 'HexNeg';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0001';
    HexRetRef = '0xFFFF';
    [HexRet] = HexNeg(HexData);
    EXPECT_EQ(HexRetRef, HexRet);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = ['0x0001'; '0x0000'; '0xFFFF'];
    HexRetRef = ['0xFFFF'; '0x0000'; '0x0001'];
    [HexRet] = HexNeg(HexData);
    EXPECT_EQ(HexRetRef, HexRet);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x00001';
    HexRetRef = '0xFFFFF';
    [HexRet] = HexNeg(HexData);
    EXPECT_EQ(HexRetRef, HexRet);
    
end
