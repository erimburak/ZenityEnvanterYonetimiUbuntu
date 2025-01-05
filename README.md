# Zenity Envanter Yönetimi Sistemi

Bu proje, Ubuntu işletim sisteminde Zenity araçlarını kullanarak kullanıcı dostu bir grafik arayüz sunan bir envanter yönetim sistemi geliştirmeyi amaçlamaktadır. Proje, ürün ve kullanıcı yönetimini destekleyen çeşitli özellikler sunar.

## Proje Özellikleri

- **Ürün Yönetimi:**
  - Ürün ekleme, listeleme, güncelleme ve silme işlemleri.
  - Raporlama: Stokta azalan ürünler ve en yüksek stok miktarına sahip ürünlerin raporlanması.

- **Kullanıcı Yönetimi:**
  - Yeni kullanıcı ekleme, listeleme, güncelleme ve silme işlemleri.
  - Kullanıcı rolleri: Yönetici ve kullanıcı seviyesinde yetkilendirme.

- **Program Yönetimi:**
  - Diskteki alanı görüntüleme.
  - Veri dosyalarını yedekleme.
  - Hata kayıtlarını görüntüleme.

- **Güvenlik ve Doğrulama:**
  - CSV dosyalarının kontrolü ve otomatik oluşturulması.
  - Veri giriş doğrulaması.
  - Hatalı işlemlerin loglanması ve kullanıcıya geri bildirim verilmesi.

## Gerekli Kurulumlar

Projeyi çalıştırmak için aşağıdaki adımları izleyin:

1. **Ubuntu Üzerinde Zenity Kurulumu:**
   ```bash
   sudo apt update
   sudo apt install zenity
   ```

2. **Depoyu Klonlayın:**
   ```bash
   git clone https://github.com/erimburak/ZenityEnvanterYonetimiUbuntu.git
   ```

3. **Çalıştırma:**
   Klonladığınız dizine giderek aşağıdaki komutu çalıştırın:
   ```bash
   ./ana_menu.sh
   ```

## Sistem Kullanımı

### Giriş Ekranı

Kullanıcı adı ve şifre girerek sisteme giriş yapabilirsiniz. Yönetici ve kullanıcı rollerine göre yetkilendirme yapılmaktadır.

**Fotoğraf**

### Ürün Yönetimi

- **Ürün Ekleme:** Ürün bilgilerini girerek yeni ürün ekleyebilirsiniz.
- **Ürün Listeleme:** Tüm ürünleri listeleyebilir ve detaylarını görebilirsiniz.
- **Ürün Güncelleme:** Mevcut ürün bilgilerini güncelleyebilirsiniz.
- **Ürün Silme:** Bir ürünü envanterden kaldırabilirsiniz.

**Fotoğraf**

### Kullanıcı Yönetimi (Yalnızca Yönetici Yetkisiyle)

- Yeni kullanıcı ekleme, mevcut kullanıcıların bilgilerini güncelleme veya kullanıcıyı silme işlemleri yapılabilir.

**Fotoğraf**

### Program Yönetimi

- **Diskteki Alanı Göster:** Sistem ve dosyaların kapladığı alanı görüntüler.
- **Yedekleme:** Veri dosyalarını güvenli bir şekilde yedekler.
- **Hata Kayıtları:** Sistem sırasında oluşan hataları görüntüler.

**Fotoğraf**

## Lisans

Bu proje MIT Lisansı ile lisanslanmıştır. Daha fazla bilgi için LICENSE dosyasını inceleyebilirsiniz.

---

Geliştirici: [erimburak](https://github.com/erimburak)

Projenin detaylı açıklaması ve kullanım videosu için aşağıdaki bağlantıya göz atabilirsiniz:

[Youtube Tanıtım Videosu](#)
