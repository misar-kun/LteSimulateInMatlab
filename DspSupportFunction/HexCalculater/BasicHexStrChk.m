function [Data] = BaiscHexStrChk(HexData)
    % if lower(HexData(1,2)) == 'x'
    if 1
        PreStr = lower(HexData(:, 1:2));
        Data = HexData(:, 3:end);
        [m, n] = size(Data);
        formatStr = repmat(['0x'], m, 1);
        if sum(sum(formatStr - PreStr))
            error('[HexNeg] Hex Data Err! Use "0x" as PreStr');
        end
        hex2dec(Data);
    else
        Data = HexData;
    end
end
