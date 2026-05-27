<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Kullanıcı Yönetimi</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="admin-page">

    <div class="admin-header">

        <h1>Kullanıcı Yönetimi</h1>

        <p>
            Sisteme kayıtlı kullanıcıları buradan görüntüleyebilirsiniz.
        </p>

    </div>

    <div class="admin-grid">

        <c:forEach var="u"
                   items="${users}">

            <div class="admin-card">

                <h3>
                    ${u.fullName}
                </h3>

                <p>
                    <strong>ID:</strong>
                    ${u.id}
                </p>

                <p>
                    <strong>E-posta:</strong>
                    ${u.email}
                </p>

                <p>
                    <strong>Telefon:</strong>
                    ${u.phone}
                </p>

                <p>
                    <strong>Rol:</strong>
                    ${u.role}
                </p>

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