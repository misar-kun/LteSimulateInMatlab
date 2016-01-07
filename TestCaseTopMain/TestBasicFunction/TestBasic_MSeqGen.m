function TestBasic_MSeqGen()

    global TestCaseCfg;
    TestCaseCfg.FunctionName = 'Basic_MSeqGen';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % x(i+5) = (x(i+3) + x(i)) mod 2
    % x(0) = 0, x(1) = 0, x(2) = 0, x(3) = 0, x(4) = 1
    % 0 <= i <= 25
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    MSeqGenPara.SeqExp = [0 1 0 0 1];
    MSeqGenPara.SeqSeed = [1 0 0 0 0];
    MSeqGenPara.SeqLen = 5;
    MSeqRef = [0 1 0 1 1];
    [MSeq] = Basic_MSeqGen(MSeqGenPara);
    EXPECT_EQ(MSeqRef, MSeq);
    
end
