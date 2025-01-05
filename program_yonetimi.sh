#!/bin/bash

# 1. Diskteki Alanı Göster
function disk_alanini_goster() {
    # 'df' komutu ile disk kullanımını gösterir
    ALAN_BILGISI=$(df -h | grep -E "^/dev/")
    zenity --text-info --title="Disk Alanı" --width=400 --height=300 --filename=<(echo "$ALAN_BILGISI")
}

# 2. Diske Yedekle (depo.csv + kullanici.csv)
function diske_yedekle() {
    # Yedekleme işlemi için tarihli bir dosya adı oluşturuyoruz
    TARİH=$(date +'%Y-%m-%d_%H-%M-%S')
    YEDEK_DEPO="depo_$TARİH.csv"
    YEDEK_KULLANICI="kullanici_$TARİH.csv"
    
    # Yedekleme işlemini yapıyoruz
    cp depo.csv "$YEDEK_DEPO"
    cp kullanici.csv "$YEDEK_KULLANICI"

    # İlerleme çubuğu gösteriyoruz
    (
        for i in {1..10}; do
            echo $i
            sleep 0.5
        done
    ) | zenity --progress --title="İşlem Yapılıyor..." --text="Dosyalar diske yedekleniyor..." --percentage=0 --width=400 --height=100

    # Yedekleme başarı mesajı
    zenity --info --text="Yedekleme tamamlandı!\nYedek dosyalar: $YEDEK_DEPO ve $YEDEK_KULLANICI" --width=300
}

# 3. Hata Kayıtlarını Göster (log.csv)
function hata_kayitlarini_goster() {
    if [ ! -f log.csv ]; then
        zenity --error --text="Hata kayıtları bulunamadı!" --width=300
        return
    fi

    HATA_KAYITLARI=$(cat log.csv)
    zenity --text-info --title="Hata Kayıtları" --width=400 --height=300 --filename=<(echo "$HATA_KAYITLARI")
}

# Ana Menüye Ekleme (Program Yönetimi)
function program_yonetimi() {
    SECIM=$(zenity --list --title="Program Yönetimi" \
        --column="Seçenekler" \
        "Disk Alanını Göster" \
        "Dosyaları Yedekle" \
        "Hata Kayıtlarını Göster" \
        --width=400 --height=300)

    case $SECIM in
        "Disk Alanını Göster")
            disk_alanini_goster
            ;;
        "Dosyaları Yedekle")
            diske_yedekle
            ;;
        "Hata Kayıtlarını Göster")
            hata_kayitlarini_goster
            ;;
        *)
            zenity --error --text="Geçersiz seçim yaptınız." --width=300
            ;;
    esac
}
