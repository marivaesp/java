<%-- 
    Document   : ajax-inserir
    Created on : 17/11/2015, 12:09:11
    Author     : Marivaldo
--%>
<%@page import="br.com.ConexaoBanco.conexao"%>
<%@page import="java.sql.*"%>

<%
    String novoCentro = "";
    novoCentro = request.getParameter("novo_centro");
    out.println(novoCentro);
    PreparedStatement st = null;

    try {
        Connection conn = conexao.getconexao();
        conn.setAutoCommit(true);
        String sql = "insert into tb_tipo_centro_atendimento(tipo_centro_atendimento) values (?)";
        st = conn.prepareStatement(sql);
        st.setString(1, novoCentro);
        st.executeUpdate();

        conn.close();
    } catch (SQLException e) {
        out.println("Não foi possível conectar ao banco de dados");
    }
%>