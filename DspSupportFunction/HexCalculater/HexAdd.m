function [Sum, SumExtended] = HexAdd(HexData1, HexData2, SignFlag, SaturateFlag)
% SignFlag: [u, s] or [unsigned, signed]
% SaturateFlag: ['SatOff', 'SatOn'].
% Sum/SumExtended are Singed Value.
    if nargin < 3
        SignFlag = 's';
    end
    if nargin < 4
        SaturateFlag = 'SatOff';
    end

    DecData1 = Hex2Dec(HexData1, SignFlag);
    DecData2 = Hex2Dec(HexData2, SignFlag);
    DecSum = DecData1 + DecData2;

    n = size(HexData1, 2) - 2;
    SumExtended = Dec2Hex(DecSum, n+1);
    
    if strcmpi(SaturateFlag, 'SatOff')
        Sum = SumExtended;
        Sum(:, 3) = [];
    else
        ConvConst = 2 ^ (4 * n);
        ConvConstHalf = ConvConst / 2;
        OverFlowPositiveIdx = find(DecSum >= ConvConstHalf);
        DecSum(OverFlowPositiveIdx) = ConvConstHalf - 1;
        OverFlowNegativeIdx = find(DecSum < -ConvConstHalf);
        DecSum(OverFlowNegativeIdx) = -ConvConstHalf;
        Sum= Dec2Hex(DecSum, n);
    end
end
