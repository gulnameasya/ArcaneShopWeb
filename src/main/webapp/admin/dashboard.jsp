<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Admin Panel</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-page">

    <div class="admin-header admin-dashboard-header">

        <h1>Admin Paneli</h1>

        <p>
            Mağaza yönetimi, ürünler, kategoriler,
            siparişler ve kullanıcı işlemleri
            buradan kontrol edilir.
        </p>

    </div>

    <div class="admin-grid modern-admin-grid">

        <div class="admin-card admin-purple">

            <div class="admin-card-top">
                <h3>Ürün Ekle</h3>
                <span class="admin-badge">Ürün</span>
            </div>

            <p>
                Mağazaya yeni ürün ekleyin.
            </p>

            <a href="${pageContext.request.contextPath}/add-product"
               class="admin-link">

                Ürün Ekle

            </a>

        </div>

        <div class="admin-card admin-blue">

            <div class="admin-card-top">
                <h3>Ürünleri Yönet</h3>
                <span class="admin-badge">Yönetim</span>
            </div>

            <p>
                Ürünleri güncelleyin
                veya kaldırın.
            </p>

            <a href="${pageContext.request.contextPath}/admin-products"
               class="admin-link">

                Ürünleri Yönet

            </a>

        </div>

        <div class="admin-card admin-gold">

            <div class="admin-card-top">
                <h3>Kategori Yönetimi</h3>
                <span class="admin-badge">Kategori</span>
            </div>

            <p>
                Kategorileri görüntüleyin,
                ekleyin ve silin.
            </p>

            <a href="${pageContext.request.contextPath}/admin-categories"
               class="admin-link">

                Kategorileri Yönet

            </a>

        </div>

        <div class="admin-card admin-red">

            <div class="admin-card-top">
                <h3>Sipariş Yönetimi</h3>
                <span class="admin-badge">Sipariş</span>
            </div>

            <p>
                Sipariş durumlarını yönetin.
            </p>

            <a href="${pageContext.request.contextPath}/admin-orders"
               class="admin-link">

                Siparişleri Gör

            </a>

        </div>

        <div class="admin-card admin-dark">

            <div class="admin-card-top">
                <h3>Kullanıcı Yönetimi</h3>
                <span class="admin-badge">Kullanıcı</span>
            </div>

            <p>
                Sistemdeki kullanıcıları görüntüleyin.
            </p>

            <a href="${pageContext.request.contextPath}/admin-users"
               class="admin-link">

                Kullanıcıları Gör

            </a>

        </div>

    </div>

    <div class="admin-bottom-link">

        <a href="${pageContext.request.contextPath}/products">
            ← Siteye Dön
        </a>

    </div>

</div>

</body>
</html>