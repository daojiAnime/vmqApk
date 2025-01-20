#!/bin/bash

store_dir=.
store_file_name=my-release-key.jks
password=vmq-fastapi  # 与实际输入密码一致
alias=my-key-alias

# 检查 jdk 是否安装
if ! command -v keytool &> /dev/null; then
    echo "keytool 未安装，请先安装 jdk"
    exit 1
fi

# 生成签名文件
keytool -genkey -v -keystore $store_dir/$store_file_name -keyalg RSA -keysize 2048 -validity 10000 -alias $alias
if [ $? -ne 0 ]; then
    echo "生成签名文件失败"
    exit 1
fi

echo "生成签名文件成功"
echo "\nSTORE_FILE_NAME=$store_dir/$store_file_name" >> local.properties
echo "KEY_PASSWORD=$password" >> local.properties
echo "STORE_ALIAS=$alias" >> local.properties
