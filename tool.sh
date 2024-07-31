#!/usr/bin/bash


onnx_filename=$1
filename=${onnx_filename%.*}

/usr/src/tensorrt/bin/trtexec --onnx="$onnx_filename" --fp16 --noDataTransfers --saveEngine="$filename".plan  --inputIOFormats=fp16:chw  --outputIOFormats=fp16:chw --useCudaGraph  > "$filename".log
/usr/src/tensorrt/bin/trtexec --loadEngine="$filename".plan --useCudaGraph --noDataTransfers --warmUp=5000 > "$filename".log