#!/bin/bash

# Stokta Azalan Ürünler (Eşik değeri sağlanmalı)
function rapor_stok_azalan() {
    # Eşik değeri 100
    ESIK_DEGER=100
    LISTE=$(awk -F',' -v esik=$ESIK_DEGER '{ if ($3 < esik) print $0 }' depo.csv)

    if [ -z "$LISTE" ]; then
        zenity --info --text="Stokta azalan ürün yok." --width=300
        return
    fi

    # Listeyi göster
    zenity --text-info --title="Stokta Azalan Ürünler" \
        --filename=<(echo "$LISTE") \
        --width=600 --height=400
}

# En Yüksek Stok Miktarına Sahip Ürünler (Eşik değeri sağlanmalı)
function rapor_stok_yuksek() {
    # Eşik değeri 200
    ESIK_DEGER=200
    LISTE=$(awk -F',' -v esik=$ESIK_DEGER '{ if ($3 > esik) print $0 }' depo.csv)

    if [ -z "$LISTE" ]; then
        zenity --info --text="En yüksek stok miktarına sahip ürün yok." --width=300
        return
    fi

    # Listeyi göster
    zenity --text-info --title="En Yüksek Stok Miktarına Sahip Ürünler" \
        --filename=<(echo "$LISTE") \
        --width=600 --height=400
}

# Ana Menüdeki Rapor Al Seçeneği
function rapor_al() {
    SECIM=$(zenity --list --title="Rapor Seçimi" \
        --column="Seçenekler" \
        "Stokta Azalan Ürünler" \
        "En Yüksek Stok Miktarına Sahip Ürünler" \
        "Çıkış" \
        --width=400 --height=300)

    case $SECIM in
        "Stokta Azalan Ürünler")
            # İlerleme çubuğu başlatılıyor
            (
                for i in {1..10}; do
                    echo $i
                    sleep 0.5
                done
            ) | zenity --progress --title="İşlem Yapılıyor..." --text="Stokta azalan ürünler raporlanıyor..." --percentage=0 --width=400 --height=100
            rapor_stok_azalan
            ;;
        "En Yüksek Stok Miktarına Sahip Ürünler")
            # İlerleme çubuğu başlatılıyor
            (
                for i in {1..10}; do
                    echo $i
                    sleep 0.5
                done
            ) | zenity --progress --title="İşlem Yapılıyor..." --text="En yüksek stok miktarına sahip ürünler raporlanıyor..." --percentage=0 --width=400 --height=100
            rapor_stok_yuksek
            ;;
        "Çıkış")
            return
            ;;
        *)
            zenity --error --text="Geçersiz seçim yaptınız." --width=300
            ;;
    esac
}
