function TestBasic_ZCSeqGen()

    global TestCaseCfg;
    TestCaseCfg.FunctionName = 'Basic_ZCSeqGen';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % x(i+5) = (x(i+3) + x(i)) mod 2
    % x(0) = 0, x(1) = 0, x(2) = 0, x(3) = 0, x(4) = 1
    % 0 <= i <= 25
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    ZCSeqGenPara.SeqLen = 2;
    ZCSeqGenPara.SeqSeed = 1;
    ZCSeqGenPara.CycleShift = 0;
    ZCSeqRef = [1, -1];
    [ZCSeq] = Basic_ZCSeqGen(ZCSeqGenPara);
    EXPECT_NEAR(ZCSeqRef, ZCSeq);
    
end
