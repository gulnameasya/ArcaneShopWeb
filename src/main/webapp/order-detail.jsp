<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Sipariş Detayı</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="orders-page">

    <div class="orders-header">

        <h1>Sipariş Detayı</h1>

        <p>
            Sipariş içerisindeki ürünler
        </p>

    </div>

    <div class="orders-list">

        <c:forEach var="item"
                   items="${items}">

            <div class="order-card">

                <div class="order-main">

                    <h3>
                        ${item.productName}
                    </h3>

                    <p>
                        Ürün ID:
                        ${item.productId}
                    </p>

                </div>

                <div class="order-detail">

                    <p>
                        <strong>Adet:</strong>
                        ${item.quantity}
                    </p>

                    <p>
                        <strong>Birim Fiyat:</strong>

                        <fmt:formatNumber
                                value="${item.unitPrice}"
                                type="number"
                                minFractionDigits="2"
                                maxFractionDigits="2" />

                        TL
                    </p>

                    <p>
                        <strong>Ara Toplam:</strong>

                        <fmt:formatNumber
                                value="${item.subtotal}"
                                type="number"
                                minFractionDigits="2"
                                maxFractionDigits="2" />

                        TL
                    </p>

                </div>

            </div>

        </c:forEach>

    </div>

    <a href="${pageContext.request.contextPath}/my-orders"
       class="back-button">

        ← Siparişlerim

    </a>

</div>

</body>
</html>