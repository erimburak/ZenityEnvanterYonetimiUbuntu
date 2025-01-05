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

![Ekran Görüntüsü - 2025-01-05 23-19-35](https://github.com/user-attachments/assets/1da134cc-a2b7-4213-9541-29dfebb81b3f)
![Ekran Görüntüsü - 2025-01-05 23-25-32](https://github.com/user-attachments/assets/52570ef1-c0b5-4efe-9af8-b0210360f9aa)


### Ürün Yönetimi

- **Ürün Ekleme:** Ürün bilgilerini girerek yeni ürün ekleyebilirsiniz.
  
  ![Ekran Görüntüsü - 2025-01-05 23-20-47](https://github.com/user-attachments/assets/d07229a7-cb05-489b-88a0-2435c265fd20)
  
- **Ürün Listeleme:** Tüm ürünleri listeleyebilir ve detaylarını görebilirsiniz.
  
  ![Ekran Görüntüsü - 2025-01-05 23-21-12](https://github.com/user-attachments/assets/e761fe75-8df7-4ee2-a9bc-88695747bfa9)
  
- **Ürün Güncelleme:** Mevcut ürün bilgilerini güncelleyebilirsiniz.
  
  ![Ekran Görüntüsü - 2025-01-05 23-37-59](https://github.com/user-attachments/assets/5b88bff6-275d-4559-8774-ca04016ae90a)
  
- **Ürün Silme:** Bir ürünü envanterden kaldırabilirsiniz.
  
  ![Ekran Görüntüsü - 2025-01-05 23-21-39](https://github.com/user-attachments/assets/4d43ac43-1905-4865-8585-1a889c492f7b)


### Kullanıcı Yönetimi (Yalnızca Yönetici Yetkisiyle)

- Yeni kullanıcı ekleme, mevcut kullanıcıların bilgilerini güncelleme veya kullanıcıyı silme işlemleri yapılabilir.

![Ekran Görüntüsü - 2025-01-05 23-22-54](https://github.com/user-attachments/assets/a6c0a1e2-9837-4e4f-a306-fbf03e033aa6)
![Ekran Görüntüsü - 2025-01-05 23-23-07](https://github.com/user-attachments/assets/bd5fda76-79f2-4a2a-ab91-5fd1f19c16c1)


### Program Yönetimi

- **Diskteki Alanı Göster:** Sistem ve dosyaların kapladığı alanı görüntüler.
- **Yedekleme:** Veri dosyalarını güvenli bir şekilde yedekler.
- **Hata Kayıtları:** Sistem sırasında oluşan hataları görüntüler.

![Ekran Görüntüsü - 2025-01-05 23-24-34](https://github.com/user-attachments/assets/9906a578-5650-459e-b0d7-b30f39aaaaae)
![Ekran Görüntüsü - 2025-01-05 23-24-42](https://github.com/user-attachments/assets/aacd86be-6540-4a3f-863c-43a7b090392d)
![Ekran Görüntüsü - 2025-01-05 23-24-54](https://github.com/user-attachments/assets/3328201d-9e0a-4b00-b8aa-94d0c19a3e99)


## Lisans

Bu proje MIT Lisansı ile lisanslanmıştır. Daha fazla bilgi için LICENSE dosyasını inceleyebilirsiniz.
---

Projenin detaylı açıklaması ve kullanım videosu için aşağıdaki bağlantıya göz atabilirsiniz:

[Youtube Tanıtım Videosu: https://youtu.be/v-ujWBoUsRI]
