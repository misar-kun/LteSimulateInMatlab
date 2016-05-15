function TesetPDSCH_UeRbAllocation()

    global TestCaseCfg;

    % Test PDSCH_UeRbAllocation
    TestCaseCfg.FunctionName = 'PDSCH_UeRbAllocation';
    TestCaseCfg.TestCaseIdx = 0;
    %% TestCase1
    % Test Type0 100M
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DownlinkSystemBandwidth = 100;
    UeResourceAllocationInfo = '0x01000000';
    UeRbSetRef = [0:3];
    [UeRbSet] = PDSCH_UeRbAllocation(DownlinkSystemBandwidth, UeResourceAllocationInfo);
    EXPECT_EQ(UeRbSetRef, UeRbSet);
    
    %% TestCase2
    % Test Type0 50M
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DownlinkSystemBandwidth = 50;
    UeResourceAllocationInfo = '0x01000000';
    UeRbSetRef = [0:2];
    [UeRbSet] = PDSCH_UeRbAllocation(DownlinkSystemBandwidth, UeResourceAllocationInfo);
    EXPECT_EQ(UeRbSetRef, UeRbSet);
    
    %% TestCase3
    % Test Type1 100M Subset0 Shift0
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DownlinkSystemBandwidth = 100;
    UeResourceAllocationInfo = '0x20200000';
    UeRbSetRef = [0];
    [UeRbSet] = PDSCH_UeRbAllocation(DownlinkSystemBandwidth, UeResourceAllocationInfo);
    EXPECT_EQ(UeRbSetRef, UeRbSet);
    
    %% TestCase4
    % Test Type2 LVRB 100M
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DownlinkSystemBandwidth = 100;
    UeResourceAllocationInfo = '0x40000200';
    UeRbSetRef = [0, 1];
    [UeRbSet] = PDSCH_UeRbAllocation(DownlinkSystemBandwidth, UeResourceAllocationInfo);
    EXPECT_EQ(UeRbSetRef, UeRbSet);
    
    %% TestCase5
    % Test Type2 DVRB 100M
    TestCaseCfg.TestCaseIdx = TestCaseCfg.TestCaseIdx + 1;
    DownlinkSystemBandwidth = 100;
    UeResourceAllocationInfo = '0x40000100';
    UeDciNgapChoseFlag = 0;
    UeRbSetRef = [0, 1];
    [UeRbSet] = PDSCH_UeRbAllocation(DownlinkSystemBandwidth, UeResourceAllocationInfo, UeDciNgapChoseFlag);
    EXPECT_EQ(UeRbSetRef, UeRbSet);
    
end
