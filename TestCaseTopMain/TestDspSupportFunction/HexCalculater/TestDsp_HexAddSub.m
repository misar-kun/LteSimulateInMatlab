function TestDsp_HexAddSub()

    global TestCaseCfg;

    % Test HexAdd
    TestCaseCfg.FunctionName = 'HexAdd';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = '0x0001';
    HexData2 = '0x0001';
    HexSumRef = '0x0002';
    HexSumExtRef = '0x00002';
    [HexSum, HexSumExt] = HexAdd(HexData1, HexData2);
    EXPECT_EQ(HexSumRef, HexSum);
    EXPECT_EQ(HexSumExtRef, HexSumExt);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = ['0xFFFF'; '0x7FFE'; '0xFFFF'];
    HexData2 = ['0xFFFF'; '0x0002'; '0x8000'];
    HexSumRef = ['0xFFFE'; '0x8000'; '0x7FFF'];
    HexSumExtRef = ['0x1FFFE'; '0x08000'; '0x17FFF'];
    [HexSum, HexSumExt] = HexAdd(HexData1, HexData2, 'u', 'SatOff');
    EXPECT_EQ(HexSumRef, HexSum);
    EXPECT_EQ(HexSumExtRef, HexSumExt);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = ['0xFFFF'; '0x7FFE'; '0xFFFF'];
    HexData2 = ['0xFFFF'; '0x0002'; '0x8000'];
    HexSumRef = ['0xFFFE'; '0x7FFF'; '0x8000'];
    HexSumExtRef = ['0xFFFFE'; '0x08000'; '0xF7FFF'];
    [HexSum, HexSumExt] = HexAdd(HexData1, HexData2, 's', 'SatOn');
    EXPECT_EQ(HexSumRef, HexSum);
    EXPECT_EQ(HexSumExtRef, HexSumExt);
    

    % Test HexSub
    TestCaseCfg.FunctionName = 'HexSub';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = '0x0001';
    HexData2 = '0xFFFF';
    HexSubRef = '0x0002';
    HexSubExtRef = '0x00002';
    [HexSubAns, HexSubExt] = HexSub(HexData1, HexData2);
    EXPECT_EQ(HexSubRef, HexSubAns);
    EXPECT_EQ(HexSubExtRef, HexSubExt);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = ['0x0000'; '0x7FFE'; '0xFFFF'];
    HexData2 = ['0xFFFF'; '0x0002'; '0x8000'];
    HexSubRef = ['0x0001'; '0x7FFC'; '0x7FFF'];
    HexSubExtRef = ['0xF0001'; '0x07FFC'; '0x07FFF'];
    [HexSubAns, HexSubExt] = HexSub(HexData1, HexData2, 'u', 'SatOff');
    EXPECT_EQ(HexSubRef, HexSubAns);
    EXPECT_EQ(HexSubExtRef, HexSubExt);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData1 = ['0xFFFF'; '0x7FFE'; '0x8000'];
    HexData2 = ['0x0001'; '0xFFFE'; '0x0001'];
    HexSubRef = ['0xFFFE'; '0x7FFF'; '0x8000'];
    HexSubExtRef = ['0xFFFFE'; '0x08000'; '0xF7FFF'];
    [HexSubAns, HexSubExt] = HexSub(HexData1, HexData2, 's', 'SatOn');
    EXPECT_EQ(HexSubRef, HexSubAns);
    EXPECT_EQ(HexSubExtRef, HexSubExt);
end
    
