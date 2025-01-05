#!/bin/bash

# Kullanıcı dosyasını kontrol et ve başlangıç kullanıcılarını ekle
if [ ! -f kullanici.csv ] || [ ! -s kullanici.csv ]; then
    echo "kullanici_adi,sifre,rol,kilitli" > kullanici.csv
    echo "admin,admin123,yönetici,a" >> kullanici.csv
    echo "user1,password1,kullanıcı,a" >> kullanici.csv
    echo "user2,password2,kullanıcı,a" >> kullanici.csv
fi

# Giriş ekranı
for TRY in {1..3}; do
    KULLANICI=$(zenity --entry --text="Kullanıcı adınızı girin:" --title="Giriş" --width=300)
    if [ -z "$KULLANICI" ]; then
        zenity --error --text="Kullanıcı adı boş olamaz!" --width=300
        continue
    fi

    SIFRE=$(zenity --password --text="Şifrenizi girin:" --title="Giriş" --width=300)
    if [ -z "$SIFRE" ]; then
        zenity --error --text="Şifre boş olamaz!" --width=300
        continue
    fi

    # Kullanıcı doğrulama ve rolü alma
    USER_DATA=$(grep -i "^$KULLANICI," kullanici.csv)
    if [ -n "$USER_DATA" ]; then
        KULLANICI_SIFRE=$(echo "$USER_DATA" | cut -d',' -f2)
        ROL=$(echo "$USER_DATA" | cut -d',' -f3)
        KILITLI=$(echo "$USER_DATA" | cut -d',' -f4)

        if [ "$KILITLI" == "h" ]; then
            zenity --error --text="Hesabınız kilitli! Lütfen yöneticinizle iletişime geçin." --width=300
            exit 1
        fi

        if [ "$SIFRE" == "$KULLANICI_SIFRE" ]; then
            zenity --info --text="Giriş başarılı. Hoş geldiniz, $KULLANICI!" --width=300
            ./ana_menu.sh $ROL
            exit 0
        else
            zenity --error --text="Hatalı şifre!" --width=300
            echo "$(date),$KULLANICI,Hatalı giriş" >> log.csv
        fi
    else
        zenity --error --text="Kullanıcı bulunamadı!" --width=300
    fi
done

# 3 deneme sonrası hesap kilitleme
sed -i "s/^$KULLANICI,.*$/\0,h/" kullanici.csv
zenity --error --text="Çok fazla hatalı giriş denemesi. Hesabınız kilitlendi." --width=300
exit 1
