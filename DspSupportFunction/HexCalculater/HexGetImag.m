function [HexImag] = HexGetImag(HexData)
    [Data] = BasicHexStrChk(HexData);        
    [m, n] = size(Data);
    if mod(n, 2)
        error('[HexGetImag] HexData Bit Num Must be Even');
    end

    ImagPart = Data(:, 1:n/2);
    HexImag = [repmat(['0x'], m, 1), ImagPart];
end
