<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Arcane Shop</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">

    <div class="logo">
        Arcane Shop
    </div>

    <div class="nav-links">

        <a href="products" class="nav-item" title="Ürünler">
            <span class="nav-icon">⌂</span>
            <span class="nav-text">Ürünler</span>
        </a>

        <a href="cart-page" class="nav-item" title="Sepet">
            <span class="nav-icon">◇</span>
            <span class="nav-text">Sepet</span>
        </a>

        <c:if test="${not empty sessionScope.user}">
            <a href="my-orders"
               class="nav-item nav-hide-first"
               title="Siparişlerim">

                <span class="nav-icon">▤</span>
                <span class="nav-text">Siparişlerim</span>

            </a>

            <a href="profile"
               class="nav-item nav-hide-first"
               title="Profilim">

                <span class="nav-icon">◎</span>
                <span class="nav-text">Profilim</span>

            </a>
        </c:if>

        <c:if test="${not empty sessionScope.user
                     && sessionScope.user.role == 'admin'}">

            <a href="admin-dashboard"
               class="nav-item nav-hide-first"
               title="Admin Panel">

                <span class="nav-icon">⚙</span>
                <span class="nav-text">Admin Panel</span>

            </a>

        </c:if>

        <c:if test="${empty sessionScope.user}">

            <a href="login.jsp"
               class="nav-item"
               title="Giriş Yap">

                <span class="nav-icon">↪</span>
                <span class="nav-text">Giriş Yap</span>

            </a>

            <a href="register.jsp"
               class="nav-item"
               title="Kayıt Ol">

                <span class="nav-icon">＋</span>
                <span class="nav-text">Kayıt Ol</span>

            </a>

        </c:if>

        <c:if test="${not empty sessionScope.user}">

            <a href="logout"
               class="nav-item logout-link nav-hide-first"
               title="Çıkış Yap">

                <span class="nav-icon">↩</span>
                <span class="nav-text">Çıkış Yap</span>

            </a>

        </c:if>

    </div>

</div>

<div class="hero">

    <h1>Arcane Shop</h1>

    <p class="hero-subtitle">
        Özenle seçilmiş özel ürünleri keşfet.
    </p>

    <div class="hero-info-wrapper">

        <c:if test="${not empty sessionScope.user}">

            <div class="hero-info-card user-info-card">

                Hoş geldin,
                <b>${sessionScope.user.fullName}</b>

            </div>

        </c:if>

        <c:if test="${not empty sessionScope.cart}">

            <c:set var="total" value="0" />

            <c:forEach var="item"
                       items="${sessionScope.cart}">

                <c:set var="total"
                       value="${total + item.value}" />

            </c:forEach>

            <div class="hero-info-card cart-info-card">

                Sepetteki ürün sayısı:
                <b id="cart-count">${total}</b>

            </div>

        </c:if>

        <c:if test="${empty sessionScope.cart}">

            <div class="hero-info-card cart-info-card">

                Sepetteki ürün sayısı:
                <b id="cart-count">0</b>

            </div>

        </c:if>

    </div>

</div>

<div class="category-bar">

    <a href="products"
       class="category-chip">

        Tümü

    </a>

    <c:forEach var="c"
               items="${categories}">

        <a href="products?category=${c.id}"
           class="category-chip">

            ${c.name}

        </a>

    </c:forEach>

</div>

<div class="product-grid">

    <c:forEach var="p" items="${products}">

        <c:if test="${p.name != null}">

            <div class="product-card"
                 id="product-${p.id}">

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

                <c:choose>

                    <c:when test="${p.stock > 0}">

                        <p class="stock">
                            Stok: ${p.stock}
                        </p>

                        <a href="product-detail?id=${p.id}"
                           class="detail-button">

                            Detayları Gör

                        </a>

                        <form action="${pageContext.request.contextPath}/cart"
                              method="post"
                              class="cart-form">

                            <input type="hidden"
                                   name="id"
                                   value="${p.id}">

                            <div class="magic-button-wrapper">

                                <button type="submit"
                                        class="card-button magic-add-button">

                                    Sepete Ekle

                                </button>

                                <span class="sparkle s1"></span>
                                <span class="sparkle s2"></span>
                                <span class="sparkle s3"></span>
                                <span class="sparkle s4"></span>
                                <span class="sparkle s5"></span>
                                <span class="sparkle s6"></span>

                            </div>

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

            </div>

        </c:if>

    </c:forEach>

</div>

<footer class="magic-footer">

    <h3>Arcane Shop</h3>

    <p class="footer-crafted">
        Crafted with magic & tears
    </p>

    <p class="footer-quote">
        Some items whisper back.
    </p>

    <span class="footer-signature">
        (probably designed at 3AM)
    </span>

    <span class="footer-copy">
        © 2026 Arcane Shop
    </span>

</footer>

<div class="magic-toast-container"
     id="magic-toast-container">
</div>

<script>

    function showMagicToast(type, title, message) {

        const container =
            document.getElementById(
                "magic-toast-container"
            );

        if (!container) {
            return;
        }

        const toast =
            document.createElement("div");

        toast.className =
            "magic-toast " + type;

        const titleEl =
            document.createElement("span");

        titleEl.className =
            "magic-toast-title";

        titleEl.textContent =
            title;

        const messageEl =
            document.createElement("div");

        messageEl.className =
            "magic-toast-message";

        messageEl.textContent =
            message;

        toast.appendChild(titleEl);
        toast.appendChild(messageEl);

        container.appendChild(toast);

        setTimeout(function() {

            toast.style.opacity = "0";

            toast.style.transform =
                "translateX(40px) scale(0.9)";

            setTimeout(function() {

                toast.remove();

            }, 400);

        }, 3200);
    }

    document.querySelectorAll(".cart-form")
        .forEach(function(form) {

            form.addEventListener(
                "submit",
                function(event) {

                    event.preventDefault();

                    const idInput =
                        form.querySelector(
                            'input[name="id"]'
                        );

                    if (!idInput ||
                        !idInput.value) {

                        showMagicToast(
                            "error",
                            "Büyü Bozuldu",
                            "Ürün sepete eklenemedi."
                        );

                        return;
                    }

                    const wrapper =
                        form.querySelector(
                            ".magic-button-wrapper"
                        );

                    if (wrapper) {

                        wrapper.classList.add(
                            "active"
                        );

                        setTimeout(function() {

                            wrapper.classList.remove(
                                "active"
                            );

                        }, 500);
                    }

                    const data =
                        new URLSearchParams();

                    data.append(
                        "id",
                        idInput.value
                    );

                    fetch(
                        "${pageContext.request.contextPath}/cart",
                        {
                            method: "POST",

                            credentials:
                                "same-origin",

                            headers: {
                                "Content-Type":
                                    "application/x-www-form-urlencoded"
                            },

                            body:
                                data.toString()
                        }

                    ).then(function(response) {

                        if (response.ok) {

                            const cartCount =
                                document.getElementById(
                                    "cart-count"
                                );

                            if (cartCount) {

                                const current =
                                    parseInt(
                                        cartCount.textContent
                                    ) || 0;

                                cartCount.textContent =
                                    current + 1;
                            }

                            showMagicToast(
                                "success",
                                "Sepete Eklendi",
                                "Ürün sepetine başarıyla eklendi."
                            );

                        } else {

                            showMagicToast(
                                "error",
                                "Büyü Başarısız",
                                "Ürün sepete eklenemedi."
                            );
                        }

                    }).catch(function() {

                        showMagicToast(
                            "error",
                            "Bağlantı Hatası",
                            "İşlem tamamlanamadı."
                        );

                    });

                });

        });

</script>

<div class="magic-fairy" id="magicFairy"></div>

<script>
    const fairy = document.getElementById("magicFairy");

    let fairyX = 200;
    let fairyY = 200;

    function createFairyTrail(x, y) {
        const trail = document.createElement("span");

        trail.className = "fairy-trail";
        trail.style.left = x + "px";
        trail.style.top = y + "px";

        document.body.appendChild(trail);

        setTimeout(function() {
            trail.remove();
        }, 900);
    }

    function moveFairyRandom() {
        createFairyTrail(fairyX, fairyY);

        fairyX = Math.random() * (window.innerWidth - 100);
        fairyY = Math.random() * (window.innerHeight - 100);

        fairy.style.left = fairyX + "px";
        fairy.style.top = fairyY + "px";
    }

    moveFairyRandom();

    setInterval(moveFairyRandom, 7000);

    document.addEventListener("mousemove", function(e) {
        const dx = e.clientX - fairyX;
        const dy = e.clientY - fairyY;

        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance < 90) {
            createFairyTrail(fairyX, fairyY);

            fairyX += (dx > 0 ? -70 : 70);
            fairyY += (dy > 0 ? -70 : 70);

            fairyX = Math.max(
                20,
                Math.min(window.innerWidth - 60, fairyX)
            );

            fairyY = Math.max(
                20,
                Math.min(window.innerHeight - 60, fairyY)
            );

            fairy.style.left = fairyX + "px";
            fairy.style.top = fairyY + "px";
        }
    });

    fairy.addEventListener("click", function() {
        createFairyTrail(fairyX, fairyY);

        fairy.style.transform = "scale(1.8)";

        setTimeout(function() {
            fairy.style.transform = "scale(1)";
        }, 250);

        moveFairyRandom();
    });
</script>

</body>
</html>