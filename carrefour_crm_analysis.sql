-- ==============================================================================
-- PROJE ADI: Carrefour CRM — E-Posta Kampanya ve KPI Analizi
-- Yazar: Barışcan Tosyalı
-- Veritabanı Engine: SQLite
-- Açıklama: Carrefour e-posta kampanya verilerinin temizlenmesi, segmentasyonu,
--           KPI bazlı performans ölçümü (Fransa bültenleri & A/B testi) ve 
--           pazarlama karar destek analizlerini içerir.
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- GÖREV 2 & 3: TABLO OLUŞTURMA VE VERİ YÜKLEME (SCHEMA & DDL)
-- ------------------------------------------------------------------------------

-- Varsa eski tabloyu kaldırıp sıfırdan oluşturuyoruz
DROP TABLE IF EXISTS crf_email_campaign;

CREATE TABLE crf_email_campaign (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    campaign_id INTEGER,
    campaign_title TEXT,
    send_count INTEGER,
    open_count INTEGER,
    click_count INTEGER,
    revenue NUMERIC
);

-- Veri setinin eklenmesi (80 satır)
INSERT INTO crf_email_campaign
(campaign_id, campaign_title, send_count, open_count, click_count, revenue)
VALUES
-- LOW NULL BLOCK (30 rows)
(1661,'fr_news_fete_nat',9,NULL,NULL,NULL),
(1722,'fr_news_kitchen',11,NULL,NULL,NULL),
(1707,'fr_news_summer',11,NULL,NULL,NULL),
(1624,'fr_news_home',7,NULL,NULL,NULL),
(1691,'fr_news_sale',10,NULL,NULL,NULL),
(1681,'fr_news_bento',10,NULL,NULL,NULL),
(1652,'fr_news_discount',9,NULL,NULL,NULL),
(1728,'fr_news_cotton',12,1,NULL,NULL),
(1741,'fr_news_apero',11,1,NULL,NULL),
(1751,'fr_news_food',17,1,NULL,NULL),
(1638,'fr_news_sale',7,1,NULL,NULL),
(968,'crm_back_in_stock',1,1,NULL,NULL),
(1645,'fr_news_shine',9,1,NULL,NULL),
(1616,'fr_news_sale',8,1,NULL,NULL),
(1639,'fr_news_sale_followup',8,1,NULL,NULL),
(1672,'fr_news_sale_last',8,2,NULL,NULL),
(1692,'fr_news_sale_final',8,2,NULL,NULL),
(1714,'fr_news_nuts',11,2,NULL,NULL),
(1699,'fr_news_drinks',8,2,NULL,NULL),
(1623,'fr_news_home',8,2,NULL,NULL),
(2001,'fr_news_fete_nat',10,NULL,NULL,NULL),
(2002,'fr_news_kitchen',12,NULL,NULL,NULL),
(2003,'fr_news_summer',12,NULL,NULL,NULL),
(2004,'fr_news_home',8,NULL,NULL,NULL),
(2005,'fr_news_sale',11,NULL,NULL,NULL),
(2006,'fr_news_bento',11,NULL,NULL,NULL),
(2007,'fr_news_discount',10,NULL,NULL,NULL),
(2008,'fr_news_cotton',13,1,NULL,NULL),
(2009,'fr_news_apero',12,1,NULL,NULL),
(2010,'fr_news_food',18,1,NULL,NULL),
-- MID SMALL (20 rows)
(1627,'fr_news_basket',28,11,4,NULL),
(1610,'fr_news_basket',110,24,6,NULL),
(1605,'fr_news_corse',260,55,16,42),
(1627,'fr_news_basket',30,12,5,NULL),
(1610,'fr_news_basket',115,25,7,NULL),
(1605,'fr_news_corse',270,58,17,45),
(1627,'fr_news_basket',32,13,6,NULL),
(1610,'fr_news_basket',120,26,8,NULL),
(1605,'fr_news_corse',280,60,18,48),
(1627,'fr_news_basket',35,14,7,NULL),
(1610,'fr_news_basket',125,27,9,NULL),
(1605,'fr_news_corse',290,62,19,50),
(1627,'fr_news_basket',36,15,8,NULL),
(1610,'fr_news_basket',130,28,10,NULL),
(1605,'fr_news_corse',300,65,20,52),
(1627,'fr_news_basket',38,16,9,NULL),
(1610,'fr_news_basket',135,29,11,NULL),
(1605,'fr_news_corse',310,68,21,55),
(1627,'fr_news_basket',40,17,10,NULL),
(1610,'fr_news_basket',140,30,12,NULL),
-- MID HIGH (25 rows)
(1648,'fr_news_animals',88000,18000,1050,1300),
(1686,'fr_news_summer',98000,21000,1600,5800),
(1700,'fr_news_kids',16000,2600,270,1800),
(1637,'fr_news_champion',54000,11000,1050,4500),
(1609,'fr_news_mif',110000,22000,2400,7200),
(1648,'fr_news_animals',90000,18500,1100,1400),
(1686,'fr_news_summer',100000,21500,1650,6000),
(1700,'fr_news_kids',15500,2500,260,1750),
(1637,'fr_news_champion',55000,11200,1100,4600),
(1609,'fr_news_mif',115000,23000,2500,7500),
(1648,'fr_news_animals',87000,17800,1080,1350),
(1686,'fr_news_summer',97000,20500,1550,5700),
(1700,'fr_news_kids',15800,2550,265,1780),
(1637,'fr_news_champion',56000,11500,1120,4700),
(1609,'fr_news_mif',112000,22500,2450,7300),
(1648,'fr_news_animals',89000,18200,1150,1450),
(1686,'fr_news_summer',99000,21200,1620,5900),
(1700,'fr_news_kids',16200,2650,275,1820),
(1637,'fr_news_champion',57000,11800,1150,4800),
(1609,'fr_news_mif',118000,23500,2550,7800),
(1648,'fr_news_animals',91000,18800,1200,1500),
(1686,'fr_news_summer',101000,22000,1700,6200),
(1700,'fr_news_kids',16500,2700,280,1850),
(1637,'fr_news_champion',58000,12000,1180,4900),
(1609,'fr_news_mif',120000,24000,2600,8000),
-- EXTREME / EDGE (5 rows)
(3001,'fr_news_zero',0,0,0,0),
(3002,'fr_news_extreme',130000,32000,4200,16000),
(3003,'fr_news_extreme',125000,31000,4100,15500),
(3004,'fr_news_extreme',135000,33000,4300,16500),
(3005,'fr_news_extreme',128000,31500,4150,15800);

-- Tablo bütünlüğü doğrulama
SELECT COUNT(*) AS toplam_satir_sayisi FROM crf_email_campaign;


-- ------------------------------------------------------------------------------
-- GÖREV 4: KAMPANYA ANALİZLERİ (SIRALAMA, GRUPLAMA, FİLTRELEME)
-- ------------------------------------------------------------------------------

-- Adım 4.1: Kampanyaları gönderilen mail sayısına göre azalan sırada sıralama
SELECT 
    campaign_id,
    campaign_title,
    send_count
FROM crf_email_campaign
ORDER BY send_count DESC;

-- Adım 4.2: Kampanya başlığı bazında toplam gönderim hacmi analizi
SELECT 
    campaign_title,
    SUM(send_count) AS toplam_gonderim
FROM crf_email_campaign
GROUP BY campaign_title
ORDER BY toplam_gonderim DESC;

-- Adım 4.3: Tekrar etmeyen benzersiz kampanya isimlerinin ayrıştırılması
SELECT DISTINCT 
    campaign_id,
    campaign_title
FROM crf_email_campaign;

-- Adım 4.4: 10.000'den fazla açılmaya sahip yüksek hacimli kampanyalar
SELECT 
    campaign_id,
    campaign_title,
    send_count,
    open_count
FROM crf_email_campaign
WHERE open_count > 10000
ORDER BY open_count DESC;


-- ------------------------------------------------------------------------------
-- GÖREV 5: SEGMENTASYON VE LİMİTLEME (LIMIT, WHERE, LIKE)
-- ------------------------------------------------------------------------------

-- Adım 5.1: En çok tıklama alan ilk 10 kampanya
SELECT 
    campaign_id,
    campaign_title,
    send_count,
    open_count,
    click_count
FROM crf_email_campaign
ORDER BY click_count DESC
LIMIT 10;

-- Adım 5.2: 'fr_news_summer' kampanyasının özel incelenmesi
SELECT 
    campaign_id,
    campaign_title,
    send_count,
    open_count,
    click_count
FROM crf_email_campaign
WHERE campaign_title = 'fr_news_summer';

-- Adım 5.3: Fransa segmentindeki tüm bültenlerin pattern ('fr_%') ile filtrelenmesi
SELECT *
FROM crf_email_campaign
WHERE campaign_title LIKE 'fr_%'
ORDER BY send_count DESC;


-- ------------------------------------------------------------------------------
-- GÖREV 6: FRANSA NEWSLETTER KPI HESAPLAMALARI
-- ------------------------------------------------------------------------------
-- KPI Formülleri:
-- opening_rate = open_count / send_count
-- click_rate   = click_count / send_count
-- CTR          = click_count / open_count
-- RPM          = (revenue / send_count) * 1000

SELECT 
    id,
    campaign_id,
    campaign_title,
    send_count,
    open_count,
    click_count,
    revenue,
    
    -- Opening Rate
    ROUND(
        CASE WHEN send_count > 0 THEN (open_count * 1.0) / send_count ELSE 0 END, 
        4
    ) AS opening_rate,
    
    -- Click Rate
    ROUND(
        CASE WHEN send_count > 0 THEN (click_count * 1.0) / send_count ELSE 0 END, 
        4
    ) AS click_rate,
    
    -- CTR (Click-Through Rate)
    ROUND(
        CASE WHEN open_count > 0 THEN (click_count * 1.0) / open_count ELSE 0 END, 
        4
    ) AS CTR,
    
    -- Revenue Per Mille (RPM)
    ROUND(
        CASE WHEN send_count > 0 THEN ((revenue * 1.0) / send_count) * 1000 ELSE 0 END, 
        2
    ) AS revenue_per_mille

FROM crf_email_campaign
WHERE campaign_title LIKE 'fr_news_%'
ORDER BY send_count DESC;


-- ------------------------------------------------------------------------------
-- GÖREV 7: VARYASYON (A/B TESTİ) ANALİZİ — fr_news_extreme KARŞILAŞTIRMASI
-- ------------------------------------------------------------------------------

SELECT 
    id,
    campaign_id,
    campaign_title,
    send_count,
    open_count,
    click_count,
    revenue,
    ROUND((open_count * 1.0) / send_count, 4) AS opening_rate,
    ROUND((click_count * 1.0) / send_count, 4) AS click_rate,
    ROUND((click_count * 1.0) / open_count, 4) AS CTR,
    ROUND(((revenue * 1.0) / send_count) * 1000, 2) AS revenue_per_mille
FROM crf_email_campaign
WHERE campaign_title = 'fr_news_extreme'
ORDER BY campaign_id ASC;

-- SONUÇ DEĞERLENDİRMESİ:
-- 'fr_news_extreme' varyasyonları arasında campaign_id: 3003;
-- %24.80 Opening Rate, %3.28 Click Rate, %13.23 CTR ve 124.00 € RPM ile 
-- en yüksek verimliliğe sahip A/B versiyonu seçilmiştir.