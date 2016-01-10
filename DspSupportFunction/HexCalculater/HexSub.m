function [Sub, SubExtended] = HexSub(HexData1, HexData2, SignFlag, SaturateFlag)
% SignFlag: [u, s] or [unsigned, signed]
% SaturateFlag: ['SatOff', 'SatOn'].
% Sub/SubExtended are Singed Value.
    if nargin < 3
        SignFlag = 's';
    end
    if nargin < 4
        SaturateFlag = 'SatOff';
    end

    DecData1 = Hex2Dec(HexData1, SignFlag);
    DecData2 = Hex2Dec(HexData2, SignFlag);
    DecSub = DecData1 - DecData2;

    n = size(HexData1, 2) - 2;
    SubExtended = Dec2Hex(DecSub, n+1);
    
    if strcmpi(SaturateFlag, 'SatOff')
        Sub = SubExtended;
        Sub(:, 3) = [];
    else
        ConvConst = 2 ^ (4 * n);
        ConvConstHalf = ConvConst / 2;
        OverFlowPositiveIdx = find(DecSub >= ConvConstHalf);
        DecSub(OverFlowPositiveIdx) = ConvConstHalf - 1;
        OverFlowNegativeIdx = find(DecSub < -ConvConstHalf);
        DecSub(OverFlowNegativeIdx) = -ConvConstHalf;
        Sub= Dec2Hex(DecSub, n);
    end
end
