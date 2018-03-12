#!/bin/sh

name="FAS"
name2="FIR"
name3="FFT"
name4="FFT_PE"
name5="ANA"

echo "run $name project ..."

if [ -d "Documentary_category" ]; then
    rm -r Documentary_category
    echo "remove Documentary_category/"
fi
if [ -d "RTL_category" ]; then
    rm -r RTL_category
    echo "remove RTL_category"
fi
if [ -d "Gate-Level_category" ]; then
    rm -r Gate-Level_category
    echo "remove Gate-Level_category/"
fi
if [ -f "$name.vo" ]; then
    rm $name.vo
    echo "remove $name.vo"
fi
if [ -f "${name}_v.sdo" ]; then
    rm ${name}_v.sdo
    echo "remove ${name}_v.sdo"
fi
if [ -f "$name.v" ]; then
    rm $name.v
    echo "remove $name.v"
fi
if [ -f "$name2.v" ]; then
    rm $name2.v
    echo "remove $name2.v"
fi
if [ -f "$name3.v" ]; then
    rm $name3.v
    echo "remove $name3.v"
fi
if [ -f "$name4.v" ]; then
    rm $name4.v
    echo "remove $name4.v"
fi
if [ -f "$name5.v" ]; then
    rm $name5.v
    echo "remove $name5.v"
fi
unzip HW6_P76061386_沈育同_v*.zip
cp RTL_category/$name.v $name.v
echo "copy $name.v"
cp RTL_category/$name2.v $name2.v
echo "copy $name2.v"
cp RTL_category/$name3.v $name3.v
echo "copy $name3.v"
cp RTL_category/$name4.v $name4.v
echo "copy $name4.v"
cp RTL_category/$name5.v $name5.v
echo "copy $name5.v"
cp Gate-Level_category/${name}_v.sdo ${name}_v.sdo
echo "copy ${name}_v.sdo"
cp Gate-Level_category/$name.vo $name.vo
echo "copy $name.vo"
echo "successfully"
