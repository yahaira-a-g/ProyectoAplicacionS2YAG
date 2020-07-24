<%-- 
    Document   : datoestudiante
    Created on : 15/06/2020, 10:24:05 AM
    Author     : Usuario
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Estudiante</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;

        %>
    </head>
    <body>
        <table border="1" cellspacing="0" cellpadding="" align = "center">
            <thead>
                <tr>
                    <th colspan ="8">     
                        Datos Estudiante
                    </th>
                </tr>
                <tr>
                <th>#</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>DNI</th>
                <th>Código</th>
                <th>Estado</th>
                <th>Eliminar</th>
                <th>Modificar</th>
                <tr>
            </thead>

        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                consulta= " Select idestudiante, nombre, apellidos, dni, codigo, estado "
                        + " from estudiante ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                 while (rs.next()) {   
                    ide = rs.getString(1);
                    num++;
                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><%out.print(rs.getString(6));%></td>
                        <td><a href="datoestudiante.jsp?f accion=E&f idestudiante=<%out.print(ide);%>">Eliminar</a></td>
                        <td>Modificar</td>
                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
        </table>
    </body>
</html>
