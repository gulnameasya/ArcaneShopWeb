<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Ürün Güncelle</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-form-page">
    <div class="admin-form-card">

        <h1>Ürün Güncelle</h1>

        <form action="${pageContext.request.contextPath}/update-product"
              method="post"
              enctype="multipart/form-data">

            <input type="hidden"
                   name="id"
                   value="${product.id}">

            <input type="hidden"
                   name="oldImageUrl"
                   value="${product.imageUrl}">

            <label>Ürün Adı</label>
            <input type="text"
                   name="name"
                   value="${product.name}"
                   required>

            <label>Açıklama</label>
            <textarea name="description">${product.description}</textarea>

            <label>Kategori</label>
            <select name="categoryId" required>
                <option value="">Kategori Seç</option>

                <c:forEach var="c" items="${categories}">
                    <option value="${c.id}"
                        <c:if test="${c.id == product.categoryId}">
                            selected
                        </c:if>>
                        ${c.name}
                    </option>
                </c:forEach>
            </select>

            <label>Fiyat</label>
            <input type="number"
                   step="0.01"
                   name="price"
                   value="${product.price}"
                   required>

            <label>Stok</label>
            <input type="number"
                   name="stock"
                   value="${product.stock}"
                   required>

            <label>Mevcut Görsel</label>

            <c:if test="${not empty product.imageUrl}">
                <img src="${pageContext.request.contextPath}/${product.imageUrl}"
                     alt="${product.name}"
                     class="edit-product-preview">
            </c:if>

            <label>Yeni Görsel Dosyası</label>
            <input type="file"
                   name="imageFile"
                   accept="image/*">

            <label>veya Görsel URL</label>
            <input type="text"
                   name="imageUrl"
                   value="${product.imageUrl}">

            <button type="submit">
                Güncelle
            </button>

        </form>

        <div class="admin-bottom-link">

            <a href="${pageContext.request.contextPath}/admin-products">
                ← Ürün Yönetimine Dön
            </a>

        </div>

    </div>
</div>

</body>
</html>