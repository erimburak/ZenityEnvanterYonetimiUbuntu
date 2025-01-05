#!/bin/bash

# Ürün Ekle Fonksiyonu
function urun_ekle() {
    # Kullanıcıdan ürün bilgilerini al
    YENI_URUN=$(zenity --forms --title="Ürün Ekle" \
        --text="Ürün bilgilerini girin:" \
        --add-entry="Ürün Adı" \
        --add-entry="Stok Miktarı" \
        --add-entry="Birim Fiyatı" \
        --add-entry="Kategori" \
        --width=400)

    # Kullanıcı işlemi iptal ederse
    if [ -z "$YENI_URUN" ]; then
        zenity --error --text="Ürün ekleme işlemi iptal edildi." --width=300
        return
    fi

    # Bilgileri ayırma
    URUN_ADI=$(echo "$YENI_URUN" | cut -d'|' -f1)
    STOK=$(echo "$YENI_URUN" | cut -d'|' -f2)
    FIYAT=$(echo "$YENI_URUN" | cut -d'|' -f3)
    KATEGORI=$(echo "$YENI_URUN" | cut -d'|' -f4)

    # Doğrulama: Alanların boş olup olmadığı
    if [[ -z "$URUN_ADI" || -z "$STOK" || -z "$FIYAT" || -z "$KATEGORI" ]]; then
        zenity --error --text="Tüm alanlar doldurulmalıdır!" --width=300
        return
    fi

    # Doğrulama: Boşluk kontrolü
    if [[ "$URUN_ADI" =~ \  || "$KATEGORI" =~ \  ]]; then
        zenity --error --text="Ürün adı ve kategori boşluk içeremez!" --width=300
        return
    fi

    # Doğrulama: Stok ve fiyat formatı
    if ! [[ "$STOK" =~ ^[0-9]+$ ]] || ! [[ "$FIYAT" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        zenity --error --text="Stok miktarı ve fiyat pozitif sayılar olmalıdır!" --width=300
        return
    fi

    # Ürün adıyla aynı bir ürün var mı kontrolü (büyük/küçük harf duyarsız)
    if grep -iq ",$URUN_ADI," depo.csv; then
        zenity --error --text="Bu ürün adıyla başka bir kayıt bulunmaktadır. Lütfen farklı bir ad giriniz." --width=300
        # Hata log kaydını yap
        echo "$(date "+%Y-%m-%d %H:%M:%S") - Ürün Ekleme Hatası: '$URUN_ADI' zaten mevcut." >> log.csv
        return
    fi

    # İlerleme çubuğu göster
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
    ) | zenity --progress --title="Ürün Ekleme" --text="Ürün ekleniyor..." --percentage=0 --width=400

    # Depoya yazma
    URUN_NO=$(($(tail -n 1 depo.csv | cut -d',' -f1 2>/dev/null) + 1))
    [ -z "$URUN_NO" ] && URUN_NO=1
    echo "$URUN_NO,$URUN_ADI,$STOK,$FIYAT,$KATEGORI" >> depo.csv

    # Log dosyasına işlem kaydı yaz
    echo "$(date "+%Y-%m-%d %H:%M:%S") - Ürün Eklendi: $URUN_ADI, Stok: $STOK, Fiyat: $FIYAT, Kategori: $KATEGORI" >> log.csv

    # İşlem sonucu mesajı
    zenity --info --text="Ürün başarıyla eklendi!" --width=300
}
