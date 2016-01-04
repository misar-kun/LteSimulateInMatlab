global SubFrameFreqData;

%% Paramater Init
% global eNodePara;
eNodeParaDl.CellPara.PortNum = 4;
eNodeParaDl.CellPara.ActiveUeNum = 1;
eNodeParaDl.UePara.Ue(1).RbResource= '00000000';

PDSCH_ReTypeProc(eNodeParaDl)

