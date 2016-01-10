function TestDsp_Hex2Dec()

    global TestCaseCfg;

    % Test Hex2Dec
    TestCaseCfg.FunctionName = 'Hex2Dec';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0001';
    DecDataRef = 1;
    [DecData] = Hex2Dec(HexData);
    EXPECT_EQ(DecDataRef, DecData);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = ['0xABCD'; '0x0000'; '0x1234'];
    DecDataRef = [-5.38875e3; 0; 1165];
    [DecData] = Hex2Dec(HexData, 's', 2);
    EXPECT_EQ(DecDataRef, DecData);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x19ABCDEF';
    DecDataRef = 430689775 / 2^4;
    [DecData] = Hex2Dec(HexData, 'u', 4);
    EXPECT_EQ(DecDataRef, DecData);
end
    
