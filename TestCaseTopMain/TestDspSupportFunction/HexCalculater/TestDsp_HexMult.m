function TestDsp_HexMult()

    global TestCaseCfg;

    % Test HexMult
    TestCaseCfg.FunctionName = 'HexMult';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = '0x0001';
    HexData2 = '0x0001';
    HexMultRef = '0x00000001';
    [HexMultAns] = HexMult(HexData1, HexData2);
    EXPECT_EQ(HexMultRef, HexMultAns);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = ['0xFFFF'; '0xFFFE'; '0x0001'];
    HexData2 = ['0xFFFF'; '0x0002'; '0x8000'];
    HexMultRef = ['0x00000002'; '0xFFFFFFF8'; '0xFFFF0000'];
    [HexMultAns] = HexMult(HexData1, HexData2, 'ss', 1);
    EXPECT_EQ(HexMultRef, HexMultAns);
end
