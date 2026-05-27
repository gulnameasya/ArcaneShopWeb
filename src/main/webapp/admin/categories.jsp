<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Kategori Yönetimi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-page">

    <div class="admin-header">
        <h1>Kategori Yönetimi</h1>
        <p>Kategorileri buradan ekleyebilir, görüntüleyebilir ve silebilirsiniz.</p>
    </div>

    <div class="admin-form-card category-create-card">

        <h2>Yeni Kategori Ekle</h2>

        <form action="${pageContext.request.contextPath}/add-category"
              method="post">

            <label>Kategori Adı</label>
            <input type="text"
                   name="name"
                   required>

            <label>Açıklama</label>
            <textarea name="description"></textarea>

            <button type="submit">
                Kategori Ekle
            </button>

        </form>

    </div>

    <div class="admin-grid category-management-grid">

        <c:forEach var="c" items="${categories}">

            <div class="admin-card">

                <h3>${c.name}</h3>

                <p>${c.description}</p>
                <a href="${pageContext.request.contextPath}/edit-category?id=${c.id}"
                    class="edit-button">

                     Düzenle

                </a>
                <p class="category-status">
                    Durum: Aktif
                </p>

                <form action="${pageContext.request.contextPath}/delete-category"
                      method="post">

                    <input type="hidden"
                           name="id"
                           value="${c.id}">

                    <button type="submit"
                            class="delete-btn">

                        Kategoriyi Sil

                    </button>

                </form>

            </div>

        </c:forEach>

    </div>

    <<div class="admin-bottom-link">

         <a href="${pageContext.request.contextPath}/admin-dashboard">

             ← Admin Paneline Dön

         </a>

     </div>

</div>

</body>
</html>