<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Kategori Ekle</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-form-page">

    <div class="admin-form-card">

        <h1>Yeni Kategori Ekle</h1>

        <p class="form-subtitle">
            Mağazada kullanılacak yeni kategori oluşturun.
        </p>

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

        <div class="admin-bottom-link">

            <a href="${pageContext.request.contextPath}/admin-dashboard">

                ← Admin Paneline Dön

            </a>

        </div>

    </div>

</div>

</body>
</html>