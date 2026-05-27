<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Profilim</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="profile-page">

    <div class="profile-header">
        <h1>Profilim</h1>
        <p>Hesap bilgilerinizi ve kayıtlı adreslerinizi buradan görüntüleyebilirsiniz.</p>
    </div>

    <div class="profile-layout">

        <div class="profile-main-card">

            <h2>Kullanıcı Bilgileri</h2>

            <div class="profile-info-row">
                <span>Ad Soyad</span>
                <strong>${sessionScope.user.fullName}</strong>
            </div>

            <div class="profile-info-row">
                <span>E-posta</span>
                <strong>${sessionScope.user.email}</strong>
            </div>

            <div class="profile-info-row">
                <span>Rol</span>
                <strong>${sessionScope.user.role}</strong>
            </div>

            <a href="${pageContext.request.contextPath}/edit-profile"
               class="admin-link profile-edit-button">
                Profilimi Düzenle
            </a>

        </div>

        <div class="profile-support-card">

            <h2>Yardım Gerekirse</h2>

            <p>
                Siparişler, adresler veya hesapla ilgili bir sorun yaşarsanız
                mağaza yöneticisine ulaşabilirsiniz.
            </p>

            <a href="https://wa.me/905551112233"
               target="_blank"
               class="whatsapp-link">

                <span class="whatsapp-icon">☎</span>
                <span>WhatsApp Destek: +90 533 594 97 63</span>

            </a>

        </div>

    </div>

    <div class="profile-address-section">

        <div class="section-title-row">
            <h2>Adreslerim</h2>

            <a href="${pageContext.request.contextPath}/edit-profile"
               class="soft-action-link">
                Adresleri Düzenle
            </a>
        </div>

        <c:if test="${empty addresses}">
            <div class="empty-state">
                <h2>Kayıtlı adres yok</h2>
                <p>Adres eklemek için profil düzenleme sayfasına gidebilirsiniz.</p>
            </div>
        </c:if>

        <div class="address-grid">

            <c:forEach var="a" items="${addresses}">

                <div class="address-card">

                    <div class="address-card-top">
                        <h3>${a.title}</h3>

                        <c:if test="${a.defaultAddress}">
                            <span class="default-address-badge">
                                Varsayılan
                            </span>
                        </c:if>
                    </div>

                    <p>${a.address}</p>

                </div>

            </c:forEach>

        </div>

    </div>

    <a href="${pageContext.request.contextPath}/products"
       class="back-button profile-back-button">
        ← Ana Sayfaya Dön
    </a>

</div>

</body>
</html>