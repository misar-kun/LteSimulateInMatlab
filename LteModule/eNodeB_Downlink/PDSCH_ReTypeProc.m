function PDSCH_ReTypeProc(eNodeParaDl)

    global SubFrameFreqData;

    PortNum = eNodeParaDl.CellPara.PortNum;
    SubFrameFreqDataInit(PortNum);
end

function SubFrameFreqDataInit(PortNum)
    FreqPortInit.Data = zeros(1200, 14);
    FreqPortInit.Type = zeros(1200, 14);
    global SubFrameFreqData;
    for k = 1:PortNum
        SubFrameFreqData.FreqPort(k) = FreqPortInit;
    end
end
