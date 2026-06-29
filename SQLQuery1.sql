SELECT 
    Invoice,
    StockCode,
    Description AS Urun_Adi,
    Quantity,
    -- Excel doğrudan sayı algılasın diye noktayı virgüle çeviriyoruz:
    REPLACE(CAST(Price AS VARCHAR), '.', ',') AS Price,
    Customer_ID AS Musteri_Numarasi,
    Country AS Ulke_Adi,
    REPLACE(CAST((CAST(Quantity AS FLOAT) * CAST(Price AS FLOAT)) AS VARCHAR), '.', ',') AS Satir_Ciro,
    LEFT(CONVERT(VARCHAR, InvoiceDate, 120), 7) AS Yil_Ay,
    -- Tarihi sadece Gün.Ay.Yıl formatında tekil bırakıyoruz, böylece Excel'de asla çift yazmayacak:
    CONVERT(VARCHAR, InvoiceDate, 104) AS InvoiceDate
FROM online_retail_II
WHERE Customer_ID IS NOT NULL 
  AND Description IS NOT NULL
  AND Country IS NOT NULL
  AND CAST(Quantity AS FLOAT) > 0 
  AND CAST(Price AS FLOAT) > 0
  AND Invoice NOT LIKE 'C%';