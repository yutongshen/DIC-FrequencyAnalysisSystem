read -p "Input total logic elements :" logic
read -p "Input total memory bits    :" mem
read -p "Input total multiplier     :" mul
read -p "Input cycle time           :" time

if [ -d "FAS_${logic}_${mem}_${mul}_${time}" ]; then
    rm -r FAS_${logic}_${mem}_${mul}_${time}
    echo "remove FAS_${logic}_${mem}_${mul}_${time}"
fi

if [ ! -f "FAS.v" ]; then
    echo "Not found FAS.v"
    exit 1
fi

if [ ! -f "FIR.v" ]; then
    echo "Not found FIR.v"
    exit 1
fi

if [ ! -f "FFT.v" ]; then
    echo "Not found FFT.v"
    exit 1
fi

if [ ! -f "FFT_PE.v" ]; then
    echo "Not found FFT_PE.v"
    exit 1
fi

if [ ! -f "ANA.v" ]; then
    echo "Not found ANA.v"
    exit 1
fi

if [ ! -f "FAS.vo" ]; then
    echo "Not found FAS.vo"
    exit 1
fi

if [ ! -f "FAS_v.sdo" ]; then
    echo "Not found FAS_v.sdo"
    exit 1
fi

mkdir FAS_${logic}_${mem}_${mul}_${time}
echo "Creat FAS_${logic}_${mem}_${mul}_${time} Directory"
cp FAS.v FAS_${logic}_${mem}_${mul}_${time}/FAS.v
echo "Copy FAS.v"
cp FIR.v FAS_${logic}_${mem}_${mul}_${time}/FIR.v
echo "Copy FIR.v"
cp FFT.v FAS_${logic}_${mem}_${mul}_${time}/FFT.v
echo "Copy FFT.v"
cp FFT_PE.v FAS_${logic}_${mem}_${mul}_${time}/FFT_PE.v
echo "Copy FFT_PE.v"
cp ANA.v FAS_${logic}_${mem}_${mul}_${time}/ANA.v
echo "Copy ANA.v"
cp FAS.vo FAS_${logic}_${mem}_${mul}_${time}/FAS.vo
echo "Copy FAS.vo"
cp FAS_v.sdo FAS_${logic}_${mem}_${mul}_${time}/FAS_v.sdo
echo "Copy FAS_v.sdo"

echo "Success"
