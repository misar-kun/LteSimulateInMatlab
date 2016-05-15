function ErrCnt = EXPECT_NEAR(a, b, abs_error)
    global TestCaseCfg;
    TestCaseCfg.TestCaseRun = TestCaseCfg.TestCaseRun + 1;

    if nargin < 3
        abs_error = 1e-10;
    end

    SizeDiff = sum(abs(size(a) - size(b)));
    OutSpan = length(find(max(max(abs(a - b))) >  abs_error));
    ErrCnt = SizeDiff + OutSpan;
    if 0 == ErrCnt
        TestCaseCfg.TestCasePass = TestCaseCfg.TestCasePass + 1;
    else
        TestCaseCfg.TestCaseFail = TestCaseCfg.TestCaseFail + 1;
    end
    
    if 1 == TestCaseCfg.ShowDetail
        if ErrCnt
            CmpStr = 'Failed';
        else
            CmpStr = 'Pass';
        end
            
        PrintStr = sprintf('%s::Case%d  %s', TestCaseCfg.FunctionName, TestCaseCfg.TestCaseIdx, CmpStr);
        disp(PrintStr);
    end
end
