function TestCaseTopMain()

    global TestCaseCfg;
    TestCaseCfg.ShowDetail = 1;
    TestCaseCfg.TestCaseRun = 0;
    TestCaseCfg.TestCaseRun = 0;
    TestCaseCfg.TestCasePass = 0;
    TestCaseCfg.TestCaseFail = 0;

    TestBasicFunction();


    PrintStr = sprintf('%7d    %8d    %8d\n', TestCaseCfg.TestCaseRun, ...
    TestCaseCfg.TestCasePass, TestCaseCfg.TestCaseFail);
    disp('CaseRun    CasePass    CaseFail');
    disp(PrintStr);
end
