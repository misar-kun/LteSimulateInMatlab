function TestCaseTopMain()
    global TestCaseRunAll;
    global TestCasePass;
    global TestCaseFail;

    TestCaseRunAll = 0;
    TestCasePass = 0;
    TestCaseFail = 0;


    TestBasicFunction();


    PrintStr = sprintf('%7d    %8d    %8d\n', TestCaseRunAll, TestCasePass, TestCaseFail);
    disp('CaseRun    CasePass    CaseFail');
    disp(PrintStr);
end
