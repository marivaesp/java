<%-- 
    Document   : testeNovo
    Created on : 27/10/2015, 11:45:54
    Author     : Marivaldo
--%>

<%@page import="br.com.ConexaoBanco.conexao" %>
<%@page import= "java.io.*" %>
<%@page import= "java.net.*" %> 
<%@page import= "java.sql.*" %> 

<%   
if(request.getParameter("logar")!= null){
    
    String usuario="";
    usuario = request.getParameter("email");
    String senha="";
    senha = request.getParameter("senha");
    
    Connection conn = conexao.getconexao(); 
    String sql="select * from tb_administrador where usuario = '"+usuario+"' and senha = '"+senha+"'";
    PreparedStatement st = conn.prepareStatement(sql);
     ResultSet rs = st.executeQuery();
     
     if(rs.next()){
    HttpSession sessao = request.getSession();
    sessao.setAttribute("logado",true);
      response.sendRedirect( "cadastro_centro.jsp");

    //out.println("logado");
     }else{
         out.println("Não logado");
                 }

}


%>
<!DOCTYPE html>
<html lang="pt">
    <head>

        <title>Painel sistema de saúde</title>

        <%@include file="includes/head.jsp" %> 
    </head>

    <body>

        <div class="container ">

            <div class="row espaco-superior">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">

                    <form class="form-signin">
                        <h2 class="form-signin-heading">Acesse sua conta</h2>
                        <label for="inputEmail" class="sr-only">Email</label>
                        <input type="email" id="inputEmail" class="form-control" placeholder="Email " name="email" required autofocus>
                        <label for="inputPassword" class="sr-only">Semha</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="Senha" name="senha" required>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me">Manter conectado
                            </label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit" name="logar">Logar</button>
                    </form>
                </div>
            </div>
        </div> <!-- /container -->


        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
