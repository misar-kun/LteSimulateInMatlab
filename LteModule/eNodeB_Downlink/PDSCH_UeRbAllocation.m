function [UeRbSet] = PDSCH_UeRbAllocation(DownlinkSystemBandwidth, UeResourceAllocationInfo, UeDciNgapChoseFlag)
    
    if 1 == strcmpi('0x', UeResourceAllocationInfo(1:2))
        UeResourceAllocationInfo = UeResourceAllocationInfo(3:end);
    end

    P = RBGSizeGet(DownlinkSystemBandwidth);
    TypeVal = HexDataBitSpanGet(UeResourceAllocationInfo, [31,30,29], 32);
    if 0 == TypeVal
        UeRbSet = Type0RbReourceProc(UeResourceAllocationInfo, P);
    elseif 1 == TypeVal
        UeRbSet = Type1RbReourceProc(UeResourceAllocationInfo, P);
    elseif 2 == TypeVal
        UeRbSet = 0;
    elseif 3 == TypeVal
        UeRbSet = 0;
    end
    OutBandIdx = find(UeRbSet >= DownlinkSystemBandwidth);
    UeRbSet(OutBandIdx) = [];
end

function [UeRbSet] = Type1RbReourceProc(UeResourceAllocationInfo, P)
    Subset = HexDataBitSpanGet(UeResourceAllocationInfo, [24, 23], 32);
    ShiftFlag = HexDataBitSpanGet(UeResourceAllocationInfo, [22], 32);

end

function [UeRbSet] = Type0RbReourceProc(UeResourceAllocationInfo, P)
    UeRbSet = [];
    for BitLoop = 24:-1:0
        if HexDataBitSpanGet(UeResourceAllocationInfo, BitLoop, 32)
            NewRBG = (24 - BitLoop)*4 + [0:P-1];
            UeRbSet = [UeRbSet, NewRBG];
        end
    end
end

function [RetDec] = HexDataBitSpanGet(UeResourceAllocationInfo, HexBitSpan, BinLen)
    if nargin < 3
        BinLen = 32;
    end

    Hex2BinStr = dec2bin(hex2dec(UeResourceAllocationInfo), BinLen);
    BinIdx = BinLen - HexBitSpan;
    GetBinStr = Hex2BinStr(BinIdx);
    RetDec = bin2dec(GetBinStr);
end

function [P] = RBGSizeGet(DownlinkSystemBandwidth)
    if DownlinkSystemBandwidth <= 10
        P = 1;
    elseif DownlinkSystemBandwidth <= 26
        P = 2;
    elseif DownlinkSystemBandwidth <= 63
        P = 3;
    elseif DownlinkSystemBandwidth <= 110
        P = 4;
    else
       warning('Error DownlinkSystemBandwidth Val'); 
    end
end

