<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.PoolShop.Product" %>
<%@ page import="com.PoolShop.dao.ProductDao" %>
<%@ page import="org.jdbi.v3.core.Jdbi" %>
<%@ page import="com.PoolShop.dao.BaseDatos" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>PoolShop - Welcome</title>
</head>

<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
  <div class="col-md-3 mb-2 mb-md-0">
    <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
      <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"></svg>
    </a>
  </div>

  <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
    <li class="p-3 mb-2 bg-danger text-white"><h1>POOLSHOP</h1></li>
  </ul>

 <div class="col-md-3 text-end">
     <% if (session.getAttribute("logged")!= null && (boolean) session.getAttribute("logged")) { %>
         <a href="profile.jsp" class="btn btn-outline-primary me-2" style="font-weight: bold; color: red; margin-left: 0;">Perfil</a>
         <p class="text-end">¡Hola, <span class="text-primary fw-bold"><%= session.getAttribute("Nombre") %></span>!</p>
          <button type="button" class="btn btn-outline-primary me-2">
                 <a href="logout.jsp" class="text-decoration-none">Cerrar sesión</a>
               </button>
     <% } else { %>
         <button type="button" class="btn btn-outline-primary me-2">
             <a href="login.jsp" class="text-decoration-none">Iniciar Sesión</a>
         </button>
         <button type="button" class="btn btn-primary">
             <a href="register.jsp" class="text-decoration-none text-white">Registrarse</a>
         </button>
     <% } %>
 </div>
</header>

<body>
<form class="col-md-3 text-end w-50">
  <input type="text" class="form-control text-black" id="search-input" placeholder="Busca productos...">
</form>
                <script>
                  const searchInput = document.getElementById('search-input');
                  const products = document.getElementsByClassName('card');

                  searchInput.addEventListener('input', () => {
                    const searchQuery = searchInput.value.toLowerCase();
                    for (let i = 0; i < products.length; i++) {
                      const productName = products[i].getElementsByClassName('card-body')[0].getElementsByClassName('bg-info')[0].textContent.toLowerCase();
                      if (productName.includes(searchQuery)) {
                        products[i].style.display = '';
                      } else {
                        products[i].style.display = 'none';
                      }
                    }
                  });
                </script>
                  <div class="col-md-3 text-start">
                    <% if (session.getAttribute("logged")!= null && (boolean) session.getAttribute("logged")) { %>
                      <button type="button" class="btn btn-outline-primary me-2">
                        <a href="addProduct.jsp" class="text-decoration-none">Agregar producto</a>
                      </button>
                    <% } %>
                  </div>
      <div class="album py-5 bg-body-tertiary">
        <div class="container">
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <%
              BaseDatos.connect();
              List<Product> products= BaseDatos.jdbi.withExtension(ProductDao.class, dao -> dao.getAllProducts());
              for (Product product: products) {
            %>

            <div class="col">
              <div class="card shadow-sm">
                <div class="card-body">
                  <img src="../BillarImagenes/<%= product.getImagen() %>"width="100%" height="225"/>
                  <div class="p-3 mb-2 bg-info text-white"><%= product.getNombre() %></div>
                  <div class="p-3 mb-2 bg-secondary text-white"><%= product.getPrecio() %>€ (PRECIO SIN IVA)</p></div>
                  <a href="detail.jsp?ProductoID=<%= product.getProductoID() %>" type="button" class="btn btn-sm btn-outline-primary">Ver</a>
                  </div>
                </div>
              </div>

            <%
              }
            %>
          </div>
        </div>
      </div>


      <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
          <div class="col-md-4 d-flex align-items-center">
            <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
              <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <span class="mb-3 mb-md-0 text-body-secondary">© 2024 POOLSHOP, Copyright</span>
          </div>

          <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
            <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"></use></svg></a></li>
            <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"></use></svg></a></li>
            <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"></use></svg></a></li>
          </ul>
        </footer>
    </body>
</html>