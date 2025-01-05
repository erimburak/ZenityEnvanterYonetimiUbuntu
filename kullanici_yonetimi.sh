#!/bin/bash

# Kullanıcı dosyasını kontrol et ve başlangıç kullanıcılarını ekle
if [ ! -f kullanici.csv ] || [ ! -s kullanici.csv ]; then
    echo "kullanici_adi,sifre,rol,kilitli" > kullanici.csv
    echo "admin,admin123,yönetici,a" >> kullanici.csv
    echo "user1,password1,kullanıcı,a" >> kullanici.csv
    echo "user2,password2,kullanıcı,a" >> kullanici.csv
fi

# Kullanıcı ekleme fonksiyonu
function kullanici_ekle() {
    KULLANICI_ADI=$(zenity --entry --title="Yeni Kullanıcı Ekle" --text="Kullanıcı adı girin:" --width=300)
    if [ -z "$KULLANICI_ADI" ]; then
        zenity --error --text="Kullanıcı adı boş olamaz!" --width=300
        return
    fi

    SIFRE=$(zenity --password --title="Yeni Kullanıcı Ekle" --text="Şifre girin:" --width=300)
    if [ -z "$SIFRE" ]; then
        zenity --error --text="Şifre boş olamaz!" --width=300
        return
    fi

    ROL=$(zenity --list --title="Rol Seçimi" --column="Roller" --width=300 --height=200 "yönetici" "kullanıcı")
    if [ -z "$ROL" ]; then
        zenity --error --text="Rol seçimi yapılmadı!" --width=300
        return
    fi

    # Kullanıcıyı dosyaya ekle
    echo "$KULLANICI_ADI,$SIFRE,$ROL,a" >> kullanici.csv
    zenity --info --text="Kullanıcı başarıyla eklendi!" --width=300
}

# Kullanıcıları listeleme fonksiyonu
function kullanici_listele() {
    if [ ! -f kullanici.csv ] || [ ! -s kullanici.csv ]; then
        zenity --error --text="Kullanıcılar dosyası boş veya bulunamadı!" --width=300
        return
    fi

    LISTE=$(awk -F',' '{ printf "Kullanıcı Adı: %-15s | Rol: %-9s | Durum: %-6s\n", $1, $3, ($4 == "a" ? "Aktif" : "Kilitli") }' kullanici.csv)
    zenity --text-info --title="Kullanıcı Listesi" --width=400 --height=300 --filename=<(echo "$LISTE")
}

# Kullanıcı güncelleme fonksiyonu
function kullanici_guncelle() {
    KULLANICI_ADI=$(zenity --entry --title="Kullanıcı Güncelle" --text="Güncellemek istediğiniz kullanıcı adını girin:" --width=300)
    if [ -z "$KULLANICI_ADI" ]; then
        zenity --error --text="Kullanıcı adı girilmedi!" --width=300
        return
    fi

    SATIR=$(grep -i "^$KULLANICI_ADI," kullanici.csv)
    if [ -z "$SATIR" ]; then
        zenity --error --text="Kullanıcı bulunamadı!" --width=300
        return
    fi

    # Yeni şifre girme
    YENI_SIFRE=$(zenity --password --title="Yeni Şifre" --text="Yeni şifreyi girin:" --width=300)
    if [ -z "$YENI_SIFRE" ]; then
        zenity --error --text="Yeni şifre boş olamaz!" --width=300
        return
    fi

    # Yeni rol seçme
    YENI_ROL=$(zenity --list --title="Yeni Rol" --column="Roller" --width=300 --height=200 "yönetici" "kullanıcı")
    if [ -z "$YENI_ROL" ]; then
        zenity --error --text="Rol seçimi yapılmadı!" --width=300
        return
    fi

    # Kullanıcıyı güncelle
    sed -i "s/^$KULLANICI_ADI,.*,.*$/$KULLANICI_ADI,$YENI_SIFRE,$YENI_ROL,a/" kullanici.csv
    zenity --info --text="Kullanıcı başarıyla güncellendi!" --width=300
}

# Kullanıcı silme fonksiyonu
function kullanici_sil() {
    KULLANICI_ADI=$(zenity --entry --title="Kullanıcı Sil" --text="Silmek istediğiniz kullanıcı adını girin:" --width=300)
    if [ -z "$KULLANICI_ADI" ]; then
        zenity --error --text="Kullanıcı adı girilmedi!" --width=300
        return
    fi

    SATIR=$(grep -i "^$KULLANICI_ADI," kullanici.csv)
    if [ -z "$SATIR" ]; then
        zenity --error --text="Kullanıcı bulunamadı!" --width=300
        return
    fi

    # Kullanıcıyı silme onayı
    zenity --question --text="Bu kullanıcıyı silmek istediğinize emin misiniz?" --width=300
    if [ $? -eq 0 ]; then
        sed -i "/^$KULLANICI_ADI,/d" kullanici.csv
        zenity --info --text="Kullanıcı başarıyla silindi!" --width=300
    else
        zenity --info --text="Silme işlemi iptal edildi." --width=300
    fi
}


# Kilitli kullanıcıların kilidini açma
function kullanici_kilidini_ac() {
    KULLANICI_ADI=$(zenity --entry --title="Kilitli Kullanıcıyı Aç" --text="Kilitli kullanıcı adını girin:" --width=300)
    if [ -z "$KULLANICI_ADI" ]; then
        zenity --error --text="Kullanıcı adı girilmedi!" --width=300
        return
    fi

    SATIR=$(grep -i "^$KULLANICI_ADI,.*,.*,h" kullanici.csv)
    if [ -z "$SATIR" ]; then
        zenity --error --text="Kilitli kullanıcı bulunamadı veya kullanıcı zaten aktif!" --width=300
        return
    fi

    # Kullanıcının kilidini aç
    sed -i "s/^$KULLANICI_ADI,\(.*\),\(.*\),h$/$KULLANICI_ADI,\1,\2,a/" kullanici.csv
    if [ $? -eq 0 ]; then
        zenity --info --text="Kullanıcı kilidi başarıyla açıldı!" --width=300
    else
        zenity --error --text="Kullanıcı kilidi açılamadı!" --width=300
    fi
}

# Kullanıcı yönetimi fonksiyonu
function kullanici_yonetimi() {
    SECIM=$(zenity --list --title="Kullanıcı Yönetimi" \
        --column="Seçenekler" \
        "Yeni Kullanıcı Ekle" \
        "Kullanıcıları Listele" \
        "Kullanıcı Güncelle" \
        "Kullanıcı Silme" \
        "Kilitli Kullanıcıları Listele" \
        "Kullanıcı Kilidini Aç" \
        --width=400 --height=300)

    case $SECIM in
        "Yeni Kullanıcı Ekle")
            kullanici_ekle
            ;;
        "Kullanıcıları Listele")
            kullanici_listele
            ;;
        "Kullanıcı Güncelle")
            kullanici_guncelle
            ;;
        "Kullanıcı Silme")
            kullanici_sil
            ;;
        "Kilitli Kullanıcıları Listele")
            kullanici_listele
            ;;
        "Kullanıcı Kilidini Aç")
            kullanici_kilidini_ac
            ;;
        *)
            zenity --error --text="Geçersiz seçim yaptınız." --width=300
            ;;
    esac
}
