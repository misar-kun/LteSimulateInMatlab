function TestDsp_Dec2Hex()

    global TestCaseCfg;

    % Test Dec2Hex
    TestCaseCfg.FunctionName = 'Dec2Hex';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DecData = 1; 
    HexDataRef = '0x0001';
    [HexData] = Dec2Hex(DecData, 4);
    EXPECT_EQ(HexDataRef, HexData);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DecData = [-5.38875e3; 0; 1165];
    HexDataRef = ['0xABCD'; '0x0000'; '0x1234'];
    [HexData] = Dec2Hex(DecData, 4, 2);
    EXPECT_EQ(HexDataRef, HexData);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DecData = 430689775 / 2^4;
    HexDataRef = '0x19ABCDEF';
    [HexData] = Dec2Hex(DecData, 8, 4);
    EXPECT_EQ(HexDataRef, HexData);
end
    
