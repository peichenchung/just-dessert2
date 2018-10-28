# Just Dessert 2.0

ALPHA Camp Demo Day 2 Project

Just Dessert 2.0 is a simple solution for matching "individual" pastry chef and customers who would enjoy unique desserts.

吃甜甜2.0是專門為`個人`甜點賣家所推出的甜點集資平台

---

## 緣由

對個人賣家而言，如果只為了賣1,2個甜點就製作、或是相反地必須大量生產製作，都是很為難的事。

另外，也由於個人甜點賣家的資訊搜尋不易，難以宣傳，一般人很難找到這些資訊，

因此吃甜甜2.0的宗旨就是幫助這些個人甜點賣家去找到喜歡獨特甜點的消費者。


## 目標

* 以甜點集資的方式，讓賣家能自行設定集到多少數量（且不能超賣）才製作

* 取貨方式以面交為主，解決個人賣家較難準備包裝及寄送的問題

---

## Getting started

`git clone https://github.com/revichung/just-dessert2.git`

`cd just-dessert2`

`bundle install`

`rails db:migrate`

`rails db:seed`

---

## 疑難排解

If you get error messages showing:

`File to import not found or unreadable: bulma/sass/utilities/_all.sass.`

Please follow below 2 steps:

`brew install yarn`

`yarn add bulma`

or

`npm install bulma`

---

## IG登入

目前已部署上Heroku `https://just-dessert2.herokuapp.com/`

由於還是 Sandbox Mode

限定登入IG帳號：

帳號: justdessert1013
密碼: alphacamp2018

---

## 圖片

賣家建立新的甜點集資時
1. 可上傳一張主圖(carrierwave)
2. 另可上傳一張商品介紹圖(carrierwave)
3. 可填入一張IG商品照的網址(進入商品頁後可看到該圖片)

carrierwave圖片上傳連至Amazon S3

---

## 第三方API

1. Instagram
2. Google maps
3. 智付通

