# Carrefour CRM — E-Posta Kampanya ve KPI Analizi

Bu proje, Carrefour CRM verilerini kullanarak e-posta kampanyalarının yapısını, dönüşüm performansını ve Fransa segmentine ait bültenlerin (newsletter) KPI metriklerini analiz etmek amacıyla hazırlanmıştır.

## Kullanılan Teknolojiler
* **Veritabanı:** SQLite
* **Dil:** SQL (`SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `LIKE`, `LIMIT`, `CASE WHEN`)

## Takip Edilen Temel KPI'lar
* **Opening Rate:** `open_count / send_count`
* **Click Rate:** `click_count / send_count`
* **CTR (Click-Through Rate):** `click_count / open_count`
* **Revenue Per Mille (RPM):** `(revenue / send_count) * 1000`

## Proje Adımları & Öne Çıkan Analizler
1. **Veri Mimarisi ve Bütünlüğü:** `crf_email_campaign` tablosu oluşturuldu, birincil/yabancı anahtar ilişkileri ve `NULL` veri tipleri incelendi.
2. **Segmentasyon:** `LIKE 'fr_news_%'` filtrelemesi ile Fransa bültenleri ayrıştırıldı ve performans eğilimleri çıkarıldı.
3. **Varyasyon Karşılaştırması (A/B Testi):** `fr_news_extreme` kampanyasının 4 farklı versiyonu kıyaslandı; `campaign_id: 3003` varyasyonunun tüm oran bazlı metriklerde (CTR: %13.23, RPM: 124.00 €) en yüksek verimliliğe sahip olduğu belirlendi.
