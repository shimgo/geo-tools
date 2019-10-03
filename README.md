# geo-tools

# 準備
GOOGLE_API_KEY環境変数にAPIキーをセット

# 使い方
## ジオコーディング
geocoding.rb内に住所の配列を書いて下記を実行
```
ruby geocoding.rb
```

## 経路計算
### 順番が決まっていて時間と距離を出したい場合
```
curl 'http://router.project-osrm.org/route/v1/driving/13.388860,52.517037;13.397634,52.529407;13.428555,52.523219'
```
レスポンス  
distance: The distance traveled by the route, in float meters.  
duration: The estimated travel time, in float number of seconds.

### googleマップで経路を確認する
高速道路指定のオプションはないみたい（https://developers.google.com/maps/documentation/urls/guide)
```
https://www.google.com/maps/dir/?api=1&origin=35.706831,139.6286903&destination=35.6718985,139.6138034&waypoints=35.698688,139.6369792|35.697776,139.6460967|35.7007036,139.65477
```
