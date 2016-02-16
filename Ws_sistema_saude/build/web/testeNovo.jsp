<%-- 
    Document   : testeNovo
    Created on : 27/10/2015, 11:45:54
    Author     : Marivaldo
--%>
<%@page import="br.com.ConexaoBanco.conexao"%>
<%@page import="java.sql.*"%>

<!--%@page import="Classes.CentroAtendimento"%-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        
          <%
         try {
            Connection conn = conexao.getconexao();
           // conn.setAutoCommit(true);
            String sql = "select * from tb_tipo_centro_atendimento";
            PreparedStatement st = conn.prepareStatement(sql);
           ResultSet rs = st.executeQuery();
          
            out.println(rs);
            ///conn.
        } catch (SQLException e) {
            out.println("Não foi possível conectar ao banco de dados");
        }
        
        %>
    </body>
</html>
