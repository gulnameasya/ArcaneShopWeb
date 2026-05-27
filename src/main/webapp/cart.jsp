<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Sepet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="cart-page">

    <div class="cart-header-card">
        <h1>Sepetim</h1>
        <p>Seçtiğiniz ürünleri buradan düzenleyebilir ve siparişinizi tamamlayabilirsiniz.</p>
    </div>

    <c:set var="totalPrice" value="0" />

    <c:if test="${empty products}">
        <div class="empty-state">
            <h2>Sepetiniz boş</h2>
            <p>Henüz bir ürün seçmediniz.</p>

            <a href="${pageContext.request.contextPath}/products"
               class="back-button cart-empty-button">
                Alışverişe Başla
            </a>
        </div>
    </c:if>

    <c:if test="${not empty products}">

        <div class="cart-layout">

            <div class="cart-items">

                <c:forEach var="p" items="${products}">

                    <div class="cart-item-card">

                        <img src="${p.imageUrl}"
                             alt="${p.name}"
                             class="cart-item-image">

                        <div class="cart-item-content">

                            <h3>${p.name}</h3>

                            <div class="cart-info-row">
                                <span>Birim Fiyat</span>
                                <strong>
                                    <fmt:formatNumber value="${p.price}"
                                                      type="number"
                                                      minFractionDigits="2"
                                                      maxFractionDigits="2" />
                                    TL
                                </strong>
                            </div>

                            <div class="cart-info-row">
                                <span>Adet</span>

                                <div class="quantity-controls compact-quantity">

                                    <form action="${pageContext.request.contextPath}/remove"
                                          method="post">

                                        <input type="hidden"
                                               name="id"
                                               value="${p.id}">

                                        <button type="submit"
                                                class="qty-btn danger-qty">
                                            −
                                        </button>

                                    </form>

                                    <span class="quantity-badge">
                                        ${cartMap[p.id]}
                                    </span>

                                    <form action="${pageContext.request.contextPath}/cart"
                                          method="post">

                                        <input type="hidden"
                                               name="id"
                                               value="${p.id}">

                                        <button type="submit"
                                                class="qty-btn">
                                            +
                                        </button>

                                    </form>

                                </div>
                            </div>

                            <div class="cart-info-row subtotal-row">
                                <span>Ara Toplam</span>
                                <strong>
                                    <fmt:formatNumber value="${p.price * cartMap[p.id]}"
                                                      type="number"
                                                      minFractionDigits="2"
                                                      maxFractionDigits="2" />
                                    TL
                                </strong>
                            </div>

                            <c:set var="totalPrice"
                                   value="${totalPrice + (p.price * cartMap[p.id])}" />

                        </div>

                    </div>

                </c:forEach>

            </div>

            <div class="cart-side-summary">

                <h2>Sipariş Özeti</h2>

                <div class="summary-line">
                    <span>Ürün Sayısı</span>

                    <strong>
                        <c:set var="totalQuantity" value="0" />

                        <c:forEach var="item" items="${cartMap}">
                            <c:set var="totalQuantity"
                                   value="${totalQuantity + item.value}" />
                        </c:forEach>

                        ${totalQuantity}
                    </strong>
                </div>

                <div class="summary-line total-line">
                    <span>Genel Toplam</span>

                    <strong>
                        <fmt:formatNumber value="${totalPrice}"
                                          type="number"
                                          minFractionDigits="2"
                                          maxFractionDigits="2" />
                        TL
                    </strong>
                </div>

                <form action="${pageContext.request.contextPath}/checkout"
                      method="post"
                      class="checkout-form">

                    <button type="submit"
                            class="checkout-button">
                        Siparişi Tamamla
                    </button>

                </form>

                <a href="${pageContext.request.contextPath}/products"
                   class="back-button cart-back-button">
                    Alışverişe Devam
                </a>

            </div>

        </div>

    </c:if>

</div>

<div id="magic-loader-container">
    <div class="magic-loader"></div>
</div>

<script>
    const checkoutForm = document.querySelector(".checkout-form");

    if (checkoutForm) {
        checkoutForm.addEventListener("submit", function(event) {
            event.preventDefault();

            document
                .getElementById("magic-loader-container")
                .classList.add("show-loader");

            setTimeout(function() {
                checkoutForm.submit();
            }, 900);
        });
    }
</script>

</body>
</html>