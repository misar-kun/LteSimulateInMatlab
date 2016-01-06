global SubFrameFreqData;

%% Paramater Init
% global eNodePara;
eNodeParaDl.CellPara.PortNum = 4;
eNodeParaDl.CellPara.ActiveUeNum = 1;
eNodeParaDl.CellPara.BandWith = 100;
eNodeParaDl.CellPara.DuplexType = 100;
eNodeParaDl.UePara.Ue(1).RbResourceAllocation= '00000000';
eNodeParaDl.UePara.Ue(1).TmMode= 1;

PDSCH_ReTypeProc(eNodeParaDl)

