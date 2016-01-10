function [HexData] = Dec2Hex(DecData, HexNumLen, FractionLen)
% HexNumLen: Convert Output HexNum
% FractionLen: 0..N
    if nargin < 2
       HexNumLen = ceil((log2(max(abs(DecData))) + 1)/4);
    end
    if nargin < 3
        FractionLen = 0;
    end

    ConvConst = 2 ^ (4 * HexNumLen);
    DecDataTmp = floor(DecData * 2^FractionLen);
    if DecData*2^FractionLen ~= DecDataTmp
        warning('[Dec2Hex] Err FractionLen is not suit for DecData');
    end       
    DecData = DecDataTmp;
    NegIdx = find(DecData < 0);
    DecData(NegIdx) = DecData(NegIdx) + ConvConst;
    HexData = [repmat(['0x'], length(DecData), 1), dec2hex(DecData, HexNumLen)];
end
