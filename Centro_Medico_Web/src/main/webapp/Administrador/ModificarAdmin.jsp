<%-- 
    Document   : ModificarAdmin
    Created on : 4/10/2020, 06:51:19
    Author     : lex
--%>

<%@page import="Entidades.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <<!-- Encabezado -->
    <%@include file="Encabezado.html" %>
    <%  String codigo_admin = request.getParameter("codigo");

        Administrador admin = new Administrador(codigo_admin);
        admin.consultarDatos();
    %>

    <section class="contenidoLex">
        <div class="container">
            <h2 class="titleLex" >Modificar Administrador</h2>
            <hr>
            <div class="centrar">
                <form action="../ModificarAdmin" method="post" class="form-control" style="width: 500px; height: 500px; background: #ccccff;">
                    <div class="form-group">
                        <h1>Codigo</h1>
                        <input type="text" readonly="" name="codigo_admin" class="form-control" value="<%=admin.getCodigo()%>" required=""/>
                    </div>
                    <div class="form-group">
                        <h1>Nombre</h1>
                        <input type="text"  name="nombre" class="form-control" value="<%=admin.getNombre()%>" required=""/>
                    </div>
                    <div class="form-group">
                        <h1>DPI</h1>
                        <input type="number" name="dpi"  id="dpi" step="1" min="0" class="form-control" value="<%=admin.getDpi()%>" required=""/>
                    </div>
                    <div class="form-group">
                        <h1>Password</h1>
                        <input type="password"  name="password" class="form-control" value="<%=admin.getPassword()%>" required=""/>
                    </div>

                    <input type="submit" name="boton" value="Guardar" class="guardar" />
                </form>
            </div>
        </div>
    </section>
</body>
</html>
