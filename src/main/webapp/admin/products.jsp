<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Ürün Yönetimi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<h1>Ürün Yönetimi</h1>

<div class="product-grid">

    <c:forEach var="p" items="${products}">

        <div class="product-card">

            <img src="${p.imageUrl}"
                 alt="${p.name}"
                 class="product-image">

            <h3>${p.name}</h3>

            <p class="description">
                ${p.description}
            </p>

            <p class="price">
                ${p.price} TL
            </p>

            <p class="stock">
                Stok: ${p.stock}
            </p>

            <a href="${pageContext.request.contextPath}/edit-product?id=${p.id}">
                <button type="button">
                    Güncelle
                </button>
            </a>

            <br><br>

            <form action="${pageContext.request.contextPath}/delete-product"
                  method="post">

                <input type="hidden"
                       name="id"
                       value="${p.id}">

                <button type="submit">
                    Ürünü Sil
                </button>

            </form>

        </div>

    </c:forEach>

</div>

<br>

<div class="admin-bottom-link">

    <a href="${pageContext.request.contextPath}/admin-dashboard">

        ← Admin Paneline Dön

    </a>

</div>

</body>
</html>