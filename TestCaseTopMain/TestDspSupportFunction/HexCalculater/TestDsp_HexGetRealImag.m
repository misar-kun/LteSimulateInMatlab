function TestDsp_HexGetRealImag()

    global TestCaseCfg;

    % Test HexGetReal
    TestCaseCfg.FunctionName = 'HexGetReal';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0001FFFF';
    HexRealRef = '0xFFFF';
    [HexReal] = HexGetReal(HexData);
    EXPECT_EQ(HexRealRef, HexReal);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = ['0x0001ABCD'; '0xABCD0000'; '0xFFFF1234'];
    HexRealRef = ['0xABCD'; '0x0000'; '0x1234'];
    [HexReal] = HexGetReal(HexData);
    EXPECT_EQ(HexRealRef, HexReal);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0123456789ABCDEF';
    HexRealRef = '0x89ABCDEF';
    [HexReal] = HexGetReal(HexData);
    EXPECT_EQ(HexRealRef, HexReal);
    
    % Test HexGetImag
    TestCaseCfg.FunctionName = 'HexGetImag';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Basic Convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0001FFFF';
    HexImagRef = '0x0001';
    [HexImag] = HexGetImag(HexData);
    EXPECT_EQ(HexImagRef, HexImag);
    
    %% TestCase2
    % Test Vector Proc
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = ['0x0001ABCD'; '0xABCD0000'; '0xFFFF1234'];
    HexImagRef = ['0x0001'; '0xABCD'; '0xFFFF'];
    [HexImag] = HexGetImag(HexData);
    EXPECT_EQ(HexImagRef, HexImag);
    
    %% TestCase3
    % Test long convert
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    HexData = '0x0123456789ABCDEF';
    HexImagRef = '0x01234567';
    [HexImag] = HexGetImag(HexData);
    EXPECT_EQ(HexImagRef, HexImag);
    
end

