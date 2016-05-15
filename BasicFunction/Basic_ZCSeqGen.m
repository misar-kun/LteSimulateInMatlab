function [ZCSeq] = Basic_ZCSeqGen(ZCSeqGenPara)
% Generate Zadoff-Chu Sequence
% SeqLen : Nzc
% SeqSeed : u
% CycleShift : Cv

    SeqLen = ZCSeqGenPara.SeqLen;
    SeqSeed = ZCSeqGenPara.SeqSeed;
    CycleShift = ZCSeqGenPara.CycleShift;
    if SeqLen == 0 || SeqSeed == 0
        % warning('[Basic_ZCSeqGen] parameter Error');
        error('[Basic_ZCSeqGen] parameter Error');
    end
    
    n = 0:SeqLen-1;
    SeqTemp = exp(-j * pi * SeqSeed * n.*(n+1) / SeqLen);
    ZCSeq = [SeqTemp(1 + CycleShift : end), SeqTemp(1:CycleShift)];
end

