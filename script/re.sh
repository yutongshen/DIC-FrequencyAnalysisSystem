read -p "Do you want to restore file ? (y/n)" sure
if [ "${sure}" == "Y" ] || [ "${sure}" == "y" ]; then
    read -p "Input total logic elements :" logic
    read -p "Input total memory bits    :" mem
    read -p "Input total multiplier     :" mul
    read -p "Input cycle time           :" time
    if [ -d "FAS_${logic}_${mem}_${mul}_${time}" ]; then
        if [ ! -f "FAS_${logic}_${mem}_${mul}_${time}/FAS.v" ]; then
            echo "Not found FAS_${logic}_${mem}_${mul}_${time}/FAS.v"
            exit 1
        fi
        if [ ! -f "FAS_${logic}_${mem}_${mul}_${time}/FIR.v" ]; then
            echo "Not found FAS_${logic}_${mem}_${mul}_${time}/FIR.v"
            exit 1
        fi
        if [ ! -f "FAS_${logic}_${mem}_${mul}_${time}/FFT.v" ]; then
            echo "Not found FAS_${logic}_${mem}_${mul}_${time}/FFT.v"
            exit 1
        fi
        if [ ! -f "FAS_${logic}_${mem}_${mul}_${time}/FFT_PE.v" ]; then
            echo "Not found FAS_${logic}_${mem}_${mul}_${time}/FFT_PE.v"
            exit 1
        fi
        cp FAS_${logic}_${mem}_${mul}_${time}/FAS.v FAS.v
        echo "Restore FAS.v"
        cp FAS_${logic}_${mem}_${mul}_${time}/FIR.v FIR.v
        echo "Restore FIR.v"
        cp FAS_${logic}_${mem}_${mul}_${time}/FFT.v FFT.v
        echo "Restore FFT.v"
        cp FAS_${logic}_${mem}_${mul}_${time}/FFT_PE.v FFT_PE.v
        echo "Restore FFT_PE.v"
    else
        echo "Not found FAS_${logic}_${mem}_${mul}_${time}"
        exit 1
    fi
else
    echo "Bye~"
    exit 0
fi

echo "Success"
