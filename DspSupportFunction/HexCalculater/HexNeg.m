function [HexRet] = HexNeg(HexData)
    PreStr = lower(HexData(:, 1:2));
    Data = HexData(:, 3:end);
    [m, n] = size(Data);
    formatStr = repmat(['0x'], m, 1);
    if sum(sum(formatStr - PreStr))
        error('[HexNeg] Hex Data Err! Use "0x/" as PreStr');
    end
        
    ConvConst = 2 ^ (4 * n);
    ConvConstHalf = ConvConst / 2;

    DecData = hex2dec(Data);
    PosIdx = find(DecData < ConvConstHalf & 0 < DecData);
    NegIdx = find(DecData >= ConvConstHalf);
    DecData(PosIdx) = ConvConst - DecData(PosIdx);
    DecData(NegIdx) = ConvConst - DecData(NegIdx);
    if sum(floor(DecData(NegIdx) / ConvConstHalf))
        DecData(NegIdx) = mod(DecData(NegIdx), ConvConstHalf);
        warning('[HexNeg] Convert Data overflow');
    end

    HexRet = [PreStr, dec2hex(DecData, n)];
end
