function [HexReal] = HexGetReal(HexData)
    [Data] = BasicHexStrChk(HexData);        
    [m, n] = size(Data);

    if mod(n, 2)
        error('[HexGetReal] HexData Bit Num Must be Even');
    end

    RealPart = Data(:, n/2+1:end);
    HexReal = [repmat(['0x'], m, 1), RealPart];
end
