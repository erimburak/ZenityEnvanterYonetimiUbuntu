#!/bin/bash

function urun_guncelle() {
    # Güncellenecek ürünün adı
    URUN_ADI=$(zenity --entry --title="Ürün Güncelle" \
        --text="Güncellemek istediğiniz ürünün adını girin:" \
        --width=300)

    if [ -z "$URUN_ADI" ]; then
        zenity --error --text="Ürün adı girilmedi, işlem iptal edildi." --width=300
        return
    fi

    # Ürünü ara
    SATIR=$(grep -i ",$URUN_ADI," depo.csv)
    if [ -z "$SATIR" ]; then
        zenity --error --text="Ürün bulunamadı!" --width=300
        return
    fi

    # Mevcut bilgileri ayır
    URUN_NO=$(echo "$SATIR" | cut -d',' -f1)
    URUN_ADI_MEVCUT=$(echo "$SATIR" | cut -d',' -f2)
    STOK=$(echo "$SATIR" | cut -d',' -f3)
    FIYAT=$(echo "$SATIR" | cut -d',' -f4)
    KATEGORI=$(echo "$SATIR" | cut -d',' -f5)

    # İlerleme çubuğu başlat
    ( 
        echo "10" 
        sleep 1
        echo "20" 
        sleep 1
        echo "30" 
        sleep 1
        echo "40" 
        sleep 1
        echo "50" 
        sleep 1
        echo "60" 
        sleep 1
        echo "70" 
        sleep 1
        echo "80" 
        sleep 1
        echo "90" 
        sleep 1
        echo "100"
    ) | zenity --progress --title="Ürün Güncelleme" --text="Güncelleme işlemi devam ediyor..." --percentage=0 --width=400

    # Güncellenecek bilgileri al
    YENI_STOK=$(zenity --entry --title="Stok Güncelle" \
        --text="Mevcut Stok: $STOK\nYeni stok miktarını girin:" --width=300)
    if [ -z "$YENI_STOK" ] || ! [[ "$YENI_STOK" =~ ^[0-9]+$ ]]; then
        zenity --error --text="Geçerli bir stok miktarı girilmedi!" --width=300
        return
    fi

    YENI_FIYAT=$(zenity --entry --title="Fiyat Güncelle" \
        --text="Mevcut Fiyat: $FIYAT\nYeni fiyatı girin:" --width=300)
    if [ -z "$YENI_FIYAT" ] || ! [[ "$YENI_FIYAT" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        zenity --error --text="Geçerli bir fiyat girilmedi!" --width=300
        return
    fi

    YENI_KATEGORI=$(zenity --entry --title="Kategori Güncelle" \
        --text="Mevcut Kategori: $KATEGORI\nYeni kategoriyi girin:" --width=300)
    if [ -z "$YENI_KATEGORI" ]; then
        zenity --error --text="Kategori boş olamaz!" --width=300
        return
    fi

    # Eski satırı sil ve yeni satırı ekle
    sed -i "/^$URUN_NO,/d" depo.csv
    echo "$URUN_NO,$URUN_ADI_MEVCUT,$YENI_STOK,$YENI_FIYAT,$YENI_KATEGORI" >> depo.csv

    # Dosyayı ürün numarasına göre sırala
    sort -t',' -k1 -n depo.csv -o depo.csv

    # Başarı mesajı
    zenity --info --text="Ürün başarıyla güncellendi ve sıralandı!" --width=300

    # Log kaydı
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Ürün güncellendi: $URUN_ADI_MEVCUT" >> log.csv
}
