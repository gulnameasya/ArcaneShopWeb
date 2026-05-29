# ArcaneShopWeb

Java MVC mimarisi kullanılarak geliştirilmiş temel düzeyde bir e-ticaret web uygulamasıdır.

Bu proje Web Programlama dersi final projesi kapsamında geliştirilmiştir.

## Projenin Amacı

Projenin amacı kullanıcıların ürünleri görüntüleyebilmesi, kategoriye göre filtreleyebilmesi, sepete ürün ekleyebilmesi ve sipariş oluşturabilmesini sağlamaktır.

Ayrıca yönetici tarafında ürün, kategori, sipariş ve kullanıcı yönetimi yapılabilmektedir.

---

## Kullanılan Teknolojiler

* Java
* Servlet
* JSP
* JSTL
* HTML
* CSS
* PostgreSQL
* JDBC
* Apache Tomcat

---

## Proje Mimarisi

Proje MVC (Model - View - Controller) mimarisi kullanılarak geliştirilmiştir.

### Model

Verileri temsil eden sınıflar:

* User
* Product
* Category
* Order
* OrderItem
* CartItem

### Controller (Servlet)

İstekleri yöneten sınıflar:

* ProductServlet
* LoginServlet
* RegisterServlet
* CartServlet
* OrderServlet
* AdminProductServlet
* AdminCategoryServlet
* AdminOrderServlet

### View (JSP)

Kullanıcıya gösterilen sayfalar:

* products.jsp
* product-detail.jsp
* cart.jsp
* login.jsp
* register.jsp
* my-orders.jsp
* admin-dashboard.jsp

---

## Özellikler

### Kullanıcı Tarafı

* Ürün listeleme
* Kategori filtreleme
* Ürün detay görüntüleme
* Kullanıcı kayıt sistemi
* Kullanıcı giriş sistemi
* Sepete ürün ekleme
* Sepetten ürün çıkarma
* Sipariş oluşturma
* Sipariş görüntüleme

### Yönetici Paneli

* Admin giriş sistemi
* Ürün ekleme
* Ürün güncelleme
* Ürün silme
* Kategori ekleme
* Kategori güncelleme
* Kategori silme
* Sipariş yönetimi
* Kullanıcı görüntüleme

---

## Veritabanı Tabloları

### users

Kullanıcı bilgilerini tutar.

### categories

Kategori bilgilerini tutar.

### products

Ürün bilgilerini tutar.

### orders

Sipariş bilgilerini tutar.

### order_items

Sipariş içerisindeki ürünleri tutar.

---

## Kurulum

### 1. PostgreSQL Veritabanı Oluşturma

PostgreSQL üzerinde yeni bir veritabanı oluşturun.

Örnek:

```sql
CREATE DATABASE arcaneshop;
```

### 2. SQL Dosyasını Çalıştırma

Projede bulunan SQL scriptini çalıştırın.

Bu işlem tabloları ve örnek verileri oluşturacaktır.

### 3. Veritabanı Bağlantı Ayarları

DBConnection.java dosyasındaki bağlantı bilgilerini düzenleyin.

```java
private static final String URL =
"jdbc:postgresql://localhost:5432/arcaneshop";

private static final String USER =
"postgres";

private static final String PASSWORD =
"şifreniz";
```

### 4. Tomcat ile Çalıştırma

Projeyi Apache Tomcat üzerinde çalıştırın.

Uygulama varsayılan olarak aşağıdaki adres üzerinden erişilebilir:

```text
http://localhost:9090/ArcaneShopWeb
```

---

## Ekran Görüntüleri

### Ana Sayfa

Ana sayfada aktif ürünler listelenmektedir.

### Ürün Detay Sayfası

Ürün detayları ve stok bilgileri görüntülenmektedir.

### Sepet Sayfası

Sepet içerisindeki ürünler ve toplam tutar gösterilmektedir.

### Admin Paneli

Ürün, kategori, sipariş ve kullanıcı yönetimi yapılabilmektedir.

---

## Karşılaşılan Problemler

Proje geliştirme sürecinde özellikle:

* PostgreSQL bağlantı yönetimi
* Servlet yönlendirmeleri
* Session yönetimi
* JSTL kullanımı

konularında çeşitli problemlerle karşılaşılmıştır.

Özellikle bağlantıların kapatılmaması nedeniyle:

```text
FATAL: sorry, too many clients already
```

hatası alınmış ve bağlantı yönetimi düzenlenerek çözülmüştür.

---

## Geliştirici

Asya Çakır

Ondokuz Mayıs Üniversitesi

Bilgisayar Mühendisliği

Web Programlama Final Projesi

2026
