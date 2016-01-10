function [DecData] = Hex2Dec(HexData, SignFlag, FractionLen)
% SignFlag: [u, s] or [unsigned, signed]
% FractionLen: 0..N
    if nargin < 2
        SignFlag = 's';
    end
    if nargin < 3
        FractionLen = 0;
    end

    [Data] = BasicHexStrChk(HexData);
    [m, n] = size(Data);
    ConvConst = 2 ^ (4 * n);
    ConvConstHalf = ConvConst / 2;

    DecData = hex2dec(Data);
    if strcmpi('s', SignFlag) || strcmpi('signed', SignFlag)
        NegIdx = find(DecData >= ConvConstHalf);
        DecData(NegIdx) = DecData(NegIdx) - ConvConst;
    end
    DecData = DecData ./ 2^FractionLen;
end
