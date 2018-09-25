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

備註：這樣設定的原因，是因為我們的賣家為個人賣家，
因此若沒有募到一定數量，製作不划算；
反之，若賣超過一定數量，個人做不來。

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

由於還是 Sandbox Mode

目前設定可由本地端localhost:3000登入

限定IG帳號：

帳號: justdessert1013
密碼: alphacamp2018

---

## IG照片

目前甜點個人賣家建立新的甜點集資時

可選擇上傳一張圖片(carrierwave)

也可填入一張IG商品照的網址

進入該甜點集資畫面時可以看到該IG商品照

! 可以同時上傳一張照片也填入IG照片網址
! 此時在吃甜甜網站首頁會看到上傳的照片
! 進入甜點集資頁面則會兩張商品照都看到

---

## 第三方API

1. Instagram
2. Google maps

---

專案管理看板連結

https://trello.com/b/mqsCSioi/


