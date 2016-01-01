function [MSeq] = Basic_MSeqGen(MSeqGenPara)
% eg: x^5 + x^2 + x^1 with init x(0) = 1, x(2) = 1;
% SeqExp = [1 0 0 1 1 0]
% SeqSeed = [0 0 0 1 0 1]
    SeqLen = MSeqGenPara.SeqLen;
    SeqSeed = MSeqGenPara.SeqSeed;
    SeqExp = MSeqGenPara.SeqExp;
    if sum(abs(size(SeqExp) - size(SeqSeed)))
        % warning('[Basic_MSeqGen] parameter Error');
        error('[Basic_MSeqGen] parameter Error');
    end
    
    MSeq = zeros(1, SeqLen);
    for k = 1:SeqLen
        NextVal = mod(sum(SeqSeed .* SeqExp), 2);
        SeqSeed = [NextVal, SeqSeed(1:end-1)];
        MSeq(k) = NextVal;
    end
end

