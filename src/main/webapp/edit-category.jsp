<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Kategori Düzenle</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-page">

    <div class="admin-header">

        <h1>Kategori Düzenle</h1>

    </div>

    <form action="${pageContext.request.contextPath}/update-category"
          method="post"
          class="admin-form">

        <input type="hidden"
               name="id"
               value="${category.id}">

        <label>Kategori Adı</label>

        <input type="text"
               name="name"
               value="${category.name}"
               required>

        <label>Açıklama</label>

        <textarea name="description"
                  rows="5">${category.description}</textarea>

        <button type="submit">
            Güncelle
        </button>

    </form>

</div>

</body>
</html>