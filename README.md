# ZenityEnvanterYonetimiUbuntu

Bu proje, **Zenity** araçlarını kullanarak ürün ekleme, listeleme, güncelleme, silme ve raporlama gibi işlemleri gerçekleştiren kullanıcı dostu bir envanter yönetim sistemidir. Proje, kullanıcı rolleri ve veri doğrulama gibi özelliklerle geliştirilmiştir. Yönetici ve kullanıcıların farklı yetkilere sahip olduğu bu sistem, hem terminal kullanımı hem de görsel arayüz sağlama amacı taşır.

---

## Özellikler

### Kullanıcı Rolleri
- **Yönetici:** Ürün ekleme, güncelleme, silme ve kullanıcı yönetimi yapabilir.
- **Kullanıcı:** Ürünleri görüntüleyebilir ve rapor alabilir.

### Fonksiyonlar
1. **Ürün Yönetimi**
   - Ürün ekleme
   - Ürün listeleme
   - Ürün güncelleme
   - Ürün silme

2. **Raporlama**
   - Stokta azalan ürünler
   - En yüksek stok miktarına sahip ürünler

3. **Kullanıcı Yönetimi**
   - Yeni kullanıcı ekleme
   - Kullanıcı listeleme
   - Kullanıcı güncelleme
   - Kullanıcı silme

4. **Program Yönetimi**
   - Diskteki alanı gösterme
   - Veri dosyalarını yedekleme
   - Hata kayıtlarını görüntüleme

5. **Güvenlik ve Veri Doğrulama**
   - Şifre yönetimi
   - Veri girişinde doğrulama ve hata mesajları
   - Kritik işlemler için onay penceresi

---

## Kurulum

1. **Gerekli Ortam:**
   - Linux işletim sistemi
   - Zenity kurulu olmalıdır.

2. **Kurulum Adımları:**
   ```bash
   git clone https://github.com/kullaniciadi/inventory-management-system.git
   cd inventory-management-system
   chmod +x *.sh
   ```

3. **Çalıştırma:**
   Ana menüyü çalıştırmak için:
   ```bash
   ./ana_menü.sh
   ```

---

## Kullanım

### Giriş Ekranı
Kullanıcı adı ve şifre ile sisteme giriş yapılır.

**Fotoğraf**

### Ürün Ekleme
Zenity'nin **--forms** seçeneği kullanılarak ürün bilgileri girilir ve kaydedilir.

**Fotoğraf**

### Ürün Listeleme
Zenity'nin **--text-info** seçeneği ile tüm ürünler görüntülenir.

**Fotoğraf**

### Ürün Güncelleme
Kullanıcıdan güncellenecek ürün bilgileri alınarak değişiklikler kaydedilir.

**Fotoğraf**

### Ürün Silme
Zenity'nin **--question** seçeneği ile kullanıcıdan onay alınarak ürün silinir.

**Fotoğraf**

### Raporlama
Stok durumu ile ilgili raporlar alınabilir.

**Fotoğraf**

### Kullanıcı Yönetimi
Yönetici tarafından kullanıcı ekleme, güncelleme ve silme işlemleri yapılabilir.

**Fotoğraf**

### Program Yönetimi
Disk alanını görüntüleme, veri yedekleme ve hata kayıtlarını inceleme işlemleri yapılabilir.

**Fotoğraf**

---

## Hata Yönetimi
- Hatalar **log.csv** dosyasına kaydedilir.
- Hatalar kullanıcıya **--error** mesajıyla bildirilir.

---

## Video Anlatım
Sistemin kullanımıyla ilgili video anlatımı için [buraya tıklayın](https://youtu.be/video-link).

---

## Lisans
Bu proje MIT lisansı altında lisanslanmıştır.

---

## Katkıda Bulunma
Katkılarınızı bekliyoruz! Lütfen bir pull request oluşturun veya issue açın.

