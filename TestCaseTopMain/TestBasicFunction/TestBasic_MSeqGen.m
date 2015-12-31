function TestBasic_MSeqGen()
    FunctionName = 'Basic_MSeqGen';
    TestCaseIdx = 0;
    %% TestCase1
    % x(i+5) = (x(i+3) + x(i)) mod 2
    % x(0) = 0, x(1) = 0, x(2) = 0, x(3) = 0, x(4) = 1
    % 0 <= i <= 25
    TestCaseIdx = TestCaseIdx + 1;
    MSeqGenPara.SeqExp = [0 1 0 0 1];
    MSeqGenPara.SeqSeed = [1 0 0 0 0];
    MSeqGenPara.SeqLen = 26;
    MSeqRef = [];
    MSeq = Basic_MSeqGen(MSeqGenPara);
    ASSERT_EQU(MSeqRef, MSeq);
    
end
