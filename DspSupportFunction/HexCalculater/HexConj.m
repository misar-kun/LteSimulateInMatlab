function [HexComplex] = HexConj(HexData)
    HexReal = HexGetReal(HexData);
    HexImag = HexGetImag(HexData);

    HexImag = HexNeg(HexImag);
    HexComplex = HexComplexGen(HexReal, HexImag);
end
