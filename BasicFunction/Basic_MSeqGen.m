function [MSeq] = Basic_MSeqGen(MSeqGenPar)
% eg: x^5 + x^2 + x^1 with init x(0) = 1, x(2) = 1;
% SeqExp = [1 0 0 1 1 0]
% SeqSeed = [0 0 0 1 0 1]
    SeqLen = MSeqGenPar.SeqLen;
    SeqSeed = MSeqGenPar.SeqSeed;
    SeqExp = MSeqGenPar.SeqExp;
    if sum(abs(size(SeqExp) - size(SeqSeed)))
        warn('__FUNCTION__ parameter Error');

    MSeq = [];
end
