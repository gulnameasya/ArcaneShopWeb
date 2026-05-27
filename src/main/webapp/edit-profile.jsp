<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Profili Düzenle</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="profile-page">

    <div class="profile-header">

        <h1>Profili Düzenle</h1>

        <p>
            Hesap bilgilerinizi ve adreslerinizi
            buradan yönetebilirsiniz.
        </p>

    </div>

    <div class="edit-profile-layout">

        <div class="edit-profile-card">

            <h2>Kullanıcı Bilgileri</h2>

            <form action="${pageContext.request.contextPath}/update-profile"
                  method="post">

                <label>Ad Soyad</label>

                <input type="text"
                       name="fullName"
                       value="${sessionScope.user.fullName}"
                       required>

                <label>E-posta</label>

                <input type="email"
                       name="email"
                       value="${sessionScope.user.email}"
                       required>

                <label>Telefon</label>

                <input type="text"
                       name="phone"
                       value="${sessionScope.user.phone}">

                <label>Ana Adres</label>

                <textarea name="address">${sessionScope.user.address}</textarea>

                <button type="submit">
                    Profili Güncelle
                </button>

            </form>

        </div>

        <div class="edit-profile-card">

            <h2>Yeni Adres Ekle</h2>

            <form action="${pageContext.request.contextPath}/add-address"
                  method="post">

                <label>Adres Başlığı</label>

                <input type="text"
                       name="title"
                       placeholder="Ev, okul, aile evi..."
                       required>

                <label>Adres</label>

                <textarea name="address"
                          required></textarea>

                <label class="checkbox-row">

                    <input type="checkbox"
                           name="defaultAddress">

                    Varsayılan adres yap

                </label>

                <button type="submit">
                    Adres Ekle
                </button>

            </form>

        </div>

    </div>

    <div class="profile-address-section">

        <h2>Kayıtlı Adresler</h2>

        <div class="address-grid">

            <c:forEach var="a"
                       items="${addresses}">

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

                    <form action="${pageContext.request.contextPath}/delete-address"
                          method="post">

                        <input type="hidden"
                               name="id"
                               value="${a.id}">

                        <button type="submit"
                                class="delete-address-btn">

                            Adresi Sil

                        </button>

                    </form>

                </div>

            </c:forEach>

        </div>

    </div>

    <a href="${pageContext.request.contextPath}/profile"
       class="back-button profile-back-button">

        ← Profile Dön

    </a>

</div>

</body>
</html>