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
