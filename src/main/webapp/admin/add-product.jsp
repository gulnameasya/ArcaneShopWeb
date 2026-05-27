<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Ürün Ekle</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-form-page">
    <div class="admin-form-card">

        <h1>Yeni Ürün Ekle</h1>

        <p class="form-subtitle">
            Mağazaya yeni bir ürün eklemek için bilgileri doldurun.
        </p>

        <form action="${pageContext.request.contextPath}/add-product"
              method="post"
              enctype="multipart/form-data">

            <label>Ürün Adı</label>
            <input type="text" name="name" required>

            <label>Açıklama</label>
            <textarea name="description"></textarea>

            <label>Kategori</label>
            <select name="categoryId" required>
                <option value="">Kategori Seç</option>

                <c:forEach var="c" items="${categories}">
                    <option value="${c.id}">
                        ${c.name}
                    </option>
                </c:forEach>
            </select>

            <div class="form-row">
                <div>
                    <label>Fiyat</label>
                    <input type="number" step="0.01" name="price" required>
                </div>

                <div>
                    <label>Stok</label>
                    <input type="number" name="stock" required>
                </div>
            </div>

            <label>Bilgisayardan Görsel Seç</label>
            <input type="file" name="imageFile">

            <label>veya Görsel URL Gir</label>
            <input type="text" name="imageUrl" placeholder="https://example.com/image.jpg">

            <button type="submit">Ürün Ekle</button>

        </form>

        <a href="${pageContext.request.contextPath}/admin-dashboard"
           class="back-button form-back-button">
            ← Admin Panel
        </a>

    </div>
</div>

</body>
</html>