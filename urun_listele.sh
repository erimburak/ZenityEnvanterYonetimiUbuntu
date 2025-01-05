#!/bin/bash

function urun_listele() {
    # Depo dosyasını kontrol et
    if [ ! -f depo.csv ] || [ ! -s depo.csv ]; then
        zenity --error --text="Depo boş veya dosya bulunamadı!" --width=300
        return
    fi

    # İlerleme çubuğu göstermek için simülasyon
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
    ) | zenity --progress --title="Ürün Listeleme" --text="Ürünler listeleniyor..." --percentage=0 --width=400

    # Ürünleri bir değişkene oku
    LISTE=$(awk -F',' 'BEGIN { printf "Ürün No | Ürün Adı | Stok | Fiyat | Kategori\n" } 
        { printf "%-8s | %-10s | %-4s | %-6s | %-10s\n", $1, $2, $3, $4, $5 }' depo.csv)

    # Listeyi göster
    zenity --text-info --title="Ürün Listesi" \
        --filename=<(echo "$LISTE") \
        --width=600 --height=400
}
