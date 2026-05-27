<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>${product.name}</title>

    <link rel="stylesheet"
          href="css/style.css">
</head>
<body>

<div class="detail-page">

    <div class="detail-card">

        <div class="detail-image-side">

            <img src="${product.imageUrl}"
                 alt="${product.name}"
                 class="detail-image">

        </div>

        <div class="detail-content">

            <h1>${product.name}</h1>

            <p class="detail-description">
                ${product.description}
            </p>

            <p class="detail-price">
                ${product.price} TL
            </p>

            <c:choose>

                <c:when test="${product.stock > 0}">

                    <p class="detail-stock">
                        Stokta ${product.stock} adet kaldı
                    </p>

                    <form action="cart"
                          method="post">

                        <input type="hidden"
                               name="id"
                               value="${product.id}">

                        <button type="submit"
                                class="card-button">

                            Sepete Ekle

                        </button>

                    </form>

                </c:when>

                <c:otherwise>

                    <p class="out-of-stock">
                        Stokta kalmadı
                    </p>

                    <button type="button"
                            class="card-button disabled-button"
                            disabled>

                        Tükendi

                    </button>

                </c:otherwise>

            </c:choose>

            <a href="products"
               class="back-button">

                ← Ürünlere Dön

            </a>

        </div>

    </div>

</div>

</body>
</html>