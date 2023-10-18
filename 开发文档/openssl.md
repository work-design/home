# 加密解密基础知识

## OpenSSL 生成 RSA 密钥对

* 先生成私钥：`openssl rsa -out test_private.pem`， 默认生成 2048 位
* 基于已生成的私钥导出公钥： `openssl rsa -in test_private.pem -pubout -out test_pub.pem`

## 加密算法

* 非对称加密算法： `RSA`
* 对称加密算法：
  * `AES`：现代常用，比较先进
  * `DES`: 推荐使用 AES
  * `SM4`: 国密算法
* Hash 加密


## 对称加密算法

#### 加密模式

