function [HexNeg] = HexNeg(HexData)
    [Data] = BasicHexStrChk(HexData);        
    [m, n] = size(Data);
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

    HexNeg = [repmat(['0x'], m, 1), dec2hex(DecData, n)];
end
