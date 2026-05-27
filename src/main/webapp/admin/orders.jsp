<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Sipariş Yönetimi</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-page">

    <div class="admin-header">

        <h1>Sipariş Yönetimi</h1>

        <p>
            Tüm kullanıcı siparişlerini
            buradan yönetebilirsiniz.
        </p>

    </div>

    <div class="orders-grid">

        <c:forEach var="o"
                   items="${orders}">

            <div class="order-card">

                <div class="order-top">

                    <h3>
                        Sipariş #${o.id}
                    </h3>

                    <span class="status-badge">
                        ${o.status}
                    </span>

                </div>

                <div class="order-info">

                    <p>
                        <strong>Kullanıcı ID:</strong>
                        ${o.userId}
                    </p>

                    <p>
                        <strong>Tarih:</strong>
                        ${o.orderDate}
                    </p>

                    <p class="order-total">
                        <fmt:formatNumber value="${o.totalAmount}"
                                          type="number"
                                          minFractionDigits="2"
                                          maxFractionDigits="2" />
                        TL
                    </p>

                </div>

                <a href="${pageContext.request.contextPath}/order-detail?id=${o.id}"
                   class="detail-button">

                    Detayı Gör

                </a>

                <form action="${pageContext.request.contextPath}/update-order-status"
                      method="post"
                      class="status-form">

                    <input type="hidden"
                           name="id"
                           value="${o.id}">

                    <select name="status">

                        <option value="Beklemede"
                                <c:if test="${o.status == 'Beklemede'}">selected</c:if>>
                            Beklemede
                        </option>

                        <option value="Hazırlanıyor"
                                <c:if test="${o.status == 'Hazırlanıyor'}">selected</c:if>>
                            Hazırlanıyor
                        </option>

                        <option value="Kargoya Verildi"
                                <c:if test="${o.status == 'Kargoya Verildi'}">selected</c:if>>
                            Kargoya Verildi
                        </option>

                        <option value="Teslim Edildi"
                                <c:if test="${o.status == 'Teslim Edildi'}">selected</c:if>>
                            Teslim Edildi
                        </option>

                        <option value="İptal Edildi"
                                <c:if test="${o.status == 'İptal Edildi'}">selected</c:if>>
                            İptal Edildi
                        </option>

                    </select>

                    <button type="submit">
                        Güncelle
                    </button>

                </form>

            </div>

        </c:forEach>

    </div>

    <div class="admin-bottom-link">

        <a href="${pageContext.request.contextPath}/admin-dashboard">

            ← Admin Paneline Dön

        </a>

    </div>

</div>

</body>
</html>