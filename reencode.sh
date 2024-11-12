#!/bin/bash

# 创建一个results_reencoded目录来存放重新编码后的视频文件
mkdir -p results_reencoded

# 遍历results目录下的所有mp4文件
for file in results/*.mp4; do
    # 获取文件名，不包含路径和扩展名
    filename=$(basename "$file" .mp4)
    
    # 重新编码并保存到新的文件夹
    ffmpeg -i "$file" -vcodec libx264 -acodec aac -strict -2 "results_reencoded/${filename}_reencoded.mp4"
    
    echo "Re-encoded: $file -> results_reencoded/${filename}_reencoded.mp4"
done

echo "All files re-encoded successfully."