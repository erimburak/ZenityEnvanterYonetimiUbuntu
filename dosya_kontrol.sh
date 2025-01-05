#!/bin/bash

# Gerekli dosyaların adları
DEPO_FILE="depo.csv"
KULLANICI_FILE="kullanici.csv"
LOG_FILE="log.csv"

# Dosya kontrol ve oluşturma
for FILE in "$DEPO_FILE" "$KULLANICI_FILE" "$LOG_FILE"; do
    if [ ! -f "$FILE" ]; then
        touch "$FILE" # Dosya oluştur
        echo "$FILE oluşturuldu."
    else
        echo "$FILE zaten mevcut."
    fi
done

# Başlangıç mesajı
zenity --info --text="Gerekli dosyalar kontrol edildi ve hazır." --width=300

