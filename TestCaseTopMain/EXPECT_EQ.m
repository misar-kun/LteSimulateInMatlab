function ErrCnt = EXPECT_EQ(a, b)
    global TestCaseCfg;
    TestCaseCfg.TestCaseRun = + 1;

    ErrCnt = sum(abs(size(a) - size(b))) + sum(abs(a - b));
    if 0 == ErrCnt 
        TestCaseCfg.TestCasePass = + 1;
    else
        TestCaseCfg.TestCaseFail = + 1;
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
