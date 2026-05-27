<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Giriş Yap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="auth-page">

    <div class="auth-card">

        <h1>Giriş Yap</h1>

        <p class="auth-subtitle">
            Mağazaya geri dönmek için hesabınıza giriş yapın.
        </p>

        <c:if test="${param.registered == 'true'}">

            <div class="form-success-message">
                Kayıt işlemi başarılı. Giriş yapabilirsiniz.
            </div>

        </c:if>

        <c:if test="${not empty error}">

            <div class="form-error-message">
                ${error}
            </div>

        </c:if>

        <form action="login"
              method="post">

            <label>E-posta</label>

            <input type="email"
                   name="email"
                   required>

            <label>Şifre</label>

            <input type="password"
                   name="password"
                   required>

            <button type="submit"
                    class="auth-button">

                Giriş Yap

            </button>

        </form>

        <div class="auth-links">

            <p>
                Hesabın yok mu?

                <a href="register.jsp"
                   class="magic-auth-link">

                    Kayıt ol

                </a>

            </p>

            <a href="products"
               class="soft-link">

                Ana sayfaya dön

            </a>

        </div>

    </div>

</div>

</body>
</html>