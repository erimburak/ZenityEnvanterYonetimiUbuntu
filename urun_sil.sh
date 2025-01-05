#!/bin/bash

function urun_sil() {
    # Silinecek ürünün adı
    URUN_ADI=$(zenity --entry --title="Ürün Sil" \
        --text="Silmek istediğiniz ürünün adını girin:" \
        --width=300)

    if [ -z "$URUN_ADI" ]; then
        zenity --error --text="Ürün adı girilmedi, işlem iptal edildi." --width=300
        return
    fi

    # Ürün adı içinde özel karakterler varsa onları düzgün şekilde işlemek için escape et
    URUN_ADI_ESCAPED=$(echo "$URUN_ADI" | sed 's/[][\.*^$/]/\\&/g')

    # Ürünü ara (büyük/küçük harf duyarsız arama yapmak için -i seçeneği kullanılıyor)
    SATIR=$(grep -i ",$URUN_ADI_ESCAPED," depo.csv)
    if [ -z "$SATIR" ]; then
        zenity --error --text="Ürün bulunamadı!" --width=300
        return
    fi

    # Silme onayı
    zenity --question --text="Bu ürünü silmek istediğinize emin misiniz?\n\n$SATIR" --width=400
    if [ $? -ne 0 ]; then
        zenity --info --text="Silme işlemi iptal edildi." --width=300
        return
    fi

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
    ) | zenity --progress --title="Ürün Silme" --text="Silme işlemi devam ediyor..." --percentage=0 --width=400

    # Ürünü sil (yine büyük/küçük harf duyarsız arama yapılıyor)
    sed -i "/,$URUN_ADI_ESCAPED,/Id" depo.csv

    # Ürün numaralarını yeniden sıralama
    awk -F',' 'BEGIN {OFS=","} { $1=NR; print $0 }' depo.csv > depo_tmp.csv && mv depo_tmp.csv depo.csv

    # Dosyayı ürün numarasına göre sırala
    sort -t',' -k1 -n depo.csv -o depo.csv

    # Silme işlemi sonrası başarı mesajı
    zenity --info --text="Ürün başarıyla silindi ve ürün numaraları güncellendi!" --width=300

    # Log kaydı
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Ürün silindi: $URUN_ADI" >> log.csv
}
