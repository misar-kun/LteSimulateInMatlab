function [HexComplex] = HexComplexGen(HexReal, HexImag)
    [DataReal] = BasicHexStrChk(HexReal);
    [DataImag] = BasicHexStrChk(HexImag);
    HexComplex = [repmat('0x', size(DataReal, 1), 1), DataImag, DataReal];
end

