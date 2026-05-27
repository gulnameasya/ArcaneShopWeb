<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Kayıt Ol</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="auth-page">

    <div class="auth-card register-card">

        <h1>Kayıt Ol</h1>

        <p class="auth-subtitle">
            Arcane Shop hesabınızı oluşturarak mağazaya katılın.
        </p>

        <form action="register" method="post">

            <label>Ad Soyad</label>
            <input type="text" name="fullName" required>

            <label>E-posta</label>
            <input type="email" name="email" required>

            <label>Şifre</label>
            <input type="password" name="password" required>

            <label>Telefon</label>
            <input type="text" name="phone">

            <label>Adres</label>
            <textarea name="address"></textarea>

            <button type="submit" class="auth-button">
                Kayıt Ol
            </button>
        <c:if test="${not empty error}">

            <div class="form-error-message">
                ${error}
            </div>

        </c:if>
        </form>

        <div class="auth-links">

            <p>
                Zaten hesabın var mı?
                <a href="login.jsp" class="magic-auth-link">
                    Giriş yap
                </a>
            </p>

            <a href="products" class="soft-link">
                Ana sayfaya dön
            </a>

        </div>

    </div>

</div>

</body>
</html>