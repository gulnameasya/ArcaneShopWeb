<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Siparişlerim</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="orders-page">

    <div class="orders-header">
        <h1>Siparişlerim</h1>
        <p>Geçmiş siparişlerinizi buradan takip edebilirsiniz.</p>
    </div>

    <c:if test="${empty orders}">
        <div class="empty-state">
            <h2>Henüz siparişiniz yok</h2>
            <p>Sepetinize ürün ekleyerek ilk siparişinizi oluşturabilirsiniz.</p>
        </div>
    </c:if>

    <div class="orders-list">

        <c:forEach var="o" items="${orders}">

            <div class="order-card">

                <div class="order-main">
                    <h3>Sipariş No: ${o.id}</h3>

                    <p>
                        ${o.orderDate}
                    </p>
                </div>

                <div class="order-detail">
                    <span>Toplam</span>

                    <b>
                        <fmt:formatNumber value="${o.totalAmount}"
                                          type="number"
                                          minFractionDigits="2"
                                          maxFractionDigits="2" />
                        TL
                    </b>
                </div>

                <div class="order-actions">

                    <div class="order-status">
                        ${o.status}
                    </div>
                    <a href="${pageContext.request.contextPath}/order-detail?id=${o.id}"
                       class="detail-button">

                        Detayı Gör

                    </a>

                    <c:if test="${o.status == 'Beklemede'}">

                        <form action="cancel-order"
                              method="post">

                            <input type="hidden"
                                   name="orderId"
                                   value="${o.id}">

                            <button type="submit"
                                    class="cancel-order-btn">

                                Siparişi İptal Et

                            </button>

                        </form>

                    </c:if>

                </div>

            </div>

        </c:forEach>

    </div>

    <a href="${pageContext.request.contextPath}/products" class="back-button">
        ← Ana Sayfaya Dön
    </a>

</div>

</body>
</html>