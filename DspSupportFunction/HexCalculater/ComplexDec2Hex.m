function [ComplexHex] = ComplexDec2Hex(DecData, HexNumLen, Split)
    if nargin < 2
        HexNumLen = 4;
    end
    if nargin < 3
        Split = '';
    end
    FractionLen = 0;
    HexReal = Dec2Hex(real(DecData), HexNumLen, FractionLen);
    HexImag = Dec2Hex(imag(DecData), HexNumLen, FractionLen);

    SplitMat = repmat(Split, size(HexReal, 1), 1);

    ComplexHex = [HexImag, SplitMat, HexReal(:, 3:end)];
end
