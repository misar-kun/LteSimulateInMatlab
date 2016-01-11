function [MultAns] = HexMult(HexData1, HexData2, SignFlag, vps)
% SignFlag: [ss, su, us, uu]
% Sum/SumExtended are Singed Value.
    if nargin < 3
        SignFlag = 'ss';
    end
    if nargin < 4
        vps = 0;
    end

    DecData1 = Hex2Dec(HexData1, SignFlag(1));
    DecData2 = Hex2Dec(HexData2, SignFlag(2));
    DecMult = floor(DecData1 .* DecData2 .* 2^vps);

    n = size(HexData1, 2) + size(HexData2, 2) - 4;
    MultAns = Dec2Hex(DecMult, n);
end
