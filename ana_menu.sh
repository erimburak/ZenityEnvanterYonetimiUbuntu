#!/bin/bash

ROL=$(echo "$1" | tr '[:upper:]' '[:lower:]') # Rol parametresi küçük harfe dönüştürülüyor

# Fonksiyon dosyalarını dahil et
source ./urun_ekle.sh
source ./urun_listele.sh
source ./urun_guncelle.sh
source ./urun_sil.sh
source ./rapor_al.sh
source ./kullanici_yonetimi.sh # Kullanıcı yönetimi dosyasını dahil ediyoruz
source ./program_yonetimi.sh
# Rol kontrol fonksiyonu
function rol_kontrol() {
    YETKI_GEREKEN_ISLEM=$1
    if [[ "$ROL" != "yönetici" && "$YETKI_GEREKEN_ISLEM" != "Görüntüleme" ]]; then
        zenity --error --text="Bu işlem için yetkiniz bulunmamaktadır!" --width=300
        return 1
    fi
    return 0
}

# Menü
while true; do
    SECIM=$(zenity --list --title="Envanter Yönetim Sistemi" \
        --column="Seçenekler" \
        "Ürün Ekle" \
        "Ürün Listele" \
        "Ürün Güncelle" \
        "Ürün Sil" \
        "Rapor Al" \
        "Kullanıcı Yönetimi" \
	"Program Yönetimi" \
        "Çıkış" \
        --width=400 --height=300)

    case $SECIM in
        "Ürün Ekle")
            if rol_kontrol "Yönetici İşlemi"; then
                urun_ekle
            fi
            ;;
        "Ürün Listele")
            urun_listele
            ;;
        "Ürün Güncelle")
            if rol_kontrol "Yönetici İşlemi"; then
                urun_guncelle
            fi
            ;;
        "Ürün Sil")
            if rol_kontrol "Yönetici İşlemi"; then
                urun_sil
            fi
            ;;
        "Rapor Al")
            rapor_al
            ;;
        "Kullanıcı Yönetimi")
            if rol_kontrol "Yönetici İşlemi"; then
                kullanici_yonetimi
            fi
            ;;
	"Program Yönetimi")
	    if rol_kontrol "Yönetici İşlemi"; then
                program_yonetimi
	    fi
	    ;;
        "Çıkış")
            zenity --question --text="Çıkmak istediğinize emin misiniz?" --width=300
            if [ $? -eq 0 ]; then
                exit 0
            fi
            ;;
        *)
            zenity --error --text="Geçersiz seçim yaptınız." --width=300
            ;;
    esac
done
