<%-- 
    Document   : testeNovo
    Created on : 27/10/2015, 11:45:54
    Author     : Marivaldo
--%>

<%@page import="br.com.ConexaoBanco.conexao"%>
<%@page import= "java.io.*"%>
<%@page import= "java.net.*"%> 
<%@page import= "java.sql.*"%> 
<%@page import= "Correios.*"%>

<%
    /* URL url = new URL("http://localhost:8080/Ws_sistema_saude/webresources/application.wadl");
     HttpURLConnection connection = (HttpURLConnection) url.openConnection();
     InputStream content = connection.getInputStream();
     out.println("testando " + content.toString());
     */
//pegando dados do form
    String tipoCentro = "";
    tipoCentro = request.getParameter("tipo_centro");

    /*submit para adicionar centro obs: 
     String bt_adicionar = "";
     select_centro = request.getParameter("bt_adicionar");
     */
    String centroAtendimento = "";
    centroAtendimento = request.getParameter("centro_atendimento");

    String horasInicial = "";
    horasInicial = request.getParameter("horas_inicial");

    String horasFinal = "";
    horasFinal = request.getParameter("horas_final");

    String cep = "";
    cep = request.getParameter("cep");

    String tipoLogradouro = "";
    tipoLogradouro = request.getParameter("tipo_logradouro");

    String logradouro = "";
    logradouro = request.getParameter("logradouro");

    String numero = "";
    numero = request.getParameter("numero");

    String complemento = "";
    complemento = request.getParameter("complemento");

    String bairro = "";
    bairro = request.getParameter("bairro");

    String cidade = "";
    cidade = request.getParameter("cidade");

    String estado = "";
    estado = request.getParameter("estado");

    String tipoTelefone = "";
    tipoTelefone = request.getParameter("tipo_telefone");

    String numeroTelefone = "";
    numeroTelefone = request.getParameter("numero_telefone");
%>
<!DOCTYPE html>
<html lang="pt">

    <head>

        <%@include file="includes/head.jsp" %> 
        <script type="text/javascript">

            $("#exampleModal").on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var recipient = button.data('whatever'); // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this);

                modal.find('.modal-body input').val(recipient);

            });


        </script>
    </head>

    <body>

        <!--inicio modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Novo centro atendimento</h4>
                    </div>
                    <div class="modal-body">
                        <form method="post" id="form">
                            <div class="form-group">
                                <label for="novo_centro" class="control-label">Tipo:</label>
                                <input type="text" class="form-control" id="novo_centro" placeholder="Hospital, AMA, UBS">
                            </div>
                            <div >
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                <button type="button" id="adicionar" class="btn btn-primary">Adicionar</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--Fim do modal-->
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <%@ include file='includes/topo.jsp' %>
                <!-- /.navbar-header -->


                <!-- /.navbar-top-links -->

                <%@ include file='includes/menu.jsp' %>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Ínicio</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <%@ include file='includes/painel.jsp' %>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4>Novo centro atendimento</h4>
                            </div>
                            <div class="panel-body">

                                <form name="formulario" method="post" action="" >
                                    <!-- inicio row centro atendimento-->
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                            <select class="form-control" name="tipo_centro">
                                                <option>Tipo centro atendimento</option>
                                                <%
                                                    try {
                                                        Connection conn = conexao.getconexao();
                                                        // conn.setAutoCommit(true);
                                                        String sql = "select * from tb_tipo_centro_atendimento";
                                                        PreparedStatement st = conn.prepareStatement(sql);
                                                        ResultSet rs = st.executeQuery();

                                                        out.println(rs);
                                                        String listaCentro = "";
                                                        while (rs.next()) {
                                                            listaCentro += "<option value=" + rs.getInt("id_tipo_centro_atendimento") + ">" + rs.getString("tipo_centro_atendimento") + "</option>";
                                                        }
                                                        out.println(listaCentro);
                                                    } catch (SQLException e) {
                                                        out.println("<option> erro!</option>");
                                                    }

                                                %>

                                            </select>

                                        </div>
                                        <div class="col-xs-2 col-sm-2 col-md-3 col-lg-1 ">
                                            <button type="button" class="btn btn-default glyphicon glyphicon-plus" name="bt_adicionar" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"></button>
                                        </div>
                                        <div class="col-xs-10 col-sm-8 col-md-8 col-lg-8 ">
                                            <input class="form-control" placeholder="Nome centro atendimento" name="centro_atendimento">
                                        </div>
                                    </div>
                                    <!--fim row centro atendimento-->
                                    <br>
                                    <!--inicio horas atendimento-->
                                    <div class="row"> 
                                        <div class=" col-xs-12">
                                            <h5>Horas de atendimento</h5>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                            <select id="inicio" class="form-control" name="horas_inicial">
                                                <option>Início</option>
                                                <%                                                    for (int i = 0; i <= 23; i++) {
                                                        out.println("<option value=\"" + i + ":00\">" + i + ":00</option>");
                                                        out.println("<option value=\"" + i + ":30\">" + i + ":30</option>");
                                                    }
                                                %>
                                            </select>

                                        </div>
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3" name="horas_final">
                                            <select class="form-control">
                                                <option>Final</option>
                                                <%
                                                    for (int i = 0; i <= 23; i++) {
                                                        out.println("<option value=\"" + i + ":00\">" + i + ":00</option>");
                                                        out.println("<option value=\"" + i + ":30\">" + i + ":30</option>");
                                                    }
                                                %>
                                            </select>
                                        </div> 
                                    </div>
                                    <br>

                                    <fieldset>
                                        <legend>Endereço</legend>
                                        <div class="row">

                                            <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 ">
                                                <input class="form-control" placeholder="Cep" name="cep" id="cep">
                                            </div>
                                            <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 ">
                                                <button type="button" id="bt_cep" class="btn btn-default glyphicon glyphicon-search" name="bt_cep"></button>
                                            </div>
                                        </div>
                                        <br>

                                        <div class='row'>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <select class="form-control" name="tipo_logradouro" id="tipo_logradouro">
                                                    <option>Rua, Av...</option>
                                                    <%
                                                        String tipoLogradouros = "";
                                                        try {
                                                            Connection conn = conexao.getconexao();
                                                            // conn.setAutoCommit(true);
                                                            String sql = "select * from tb_tipo_logradouro order by tipo_logradouro";
                                                            PreparedStatement st = conn.prepareStatement(sql);
                                                            ResultSet rs = st.executeQuery();

                                                            while (rs.next()) {
                                                                tipoLogradouros += "<option value=" + rs.getInt("id_tipo_logradouro") + ">" + rs.getString("tipo_logradouro") + "</option>";
                                                            }
                                                        } catch (SQLException e) {
                                                            out.println("<option> erro!</option>");
                                                        }
                                                        out.println(tipoLogradouros);

                                                    %>
                                                </select>
                                            </div> 

                                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 ">
                                                <input class="form-control" placeholder="Logradouro" name="logradouro" id="logradouro" >
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 ">
                                                <input class="form-control" placeholder="Nº" name="numero" >
                                            </div>
                                            <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2 ">
                                                <input class="form-control" placeholder="Complemento" name="complemento">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 ">
                                                <input class="form-control" placeholder="Bairro" name="bairro" id="bairro">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 ">
                                                <input class="form-control" placeholder="Cidade" readonly="true" name="cidade" id="cidade">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 ">
                                                <input class="form-control" placeholder="Estado" readonly="true" name="estado" id="estado">
                                            </div>
                                        </div>
                                    </fieldset>
                                    <br>

                                    <div class="row">
                                        <div class="col-xs-8 col-sm-4 col-md-2 col-lg-2">
                                            <select multiple="true" class="form-control" id="tipo_telefone" name="tipo_telefone">
                                                <%                                                    try {
                                                        Connection conn = conexao.getconexao();
                                                        // conn.setAutoCommit(true);
                                                        String sql = "select * from tb_tipo_telefone order by telefone_tipo";
                                                        PreparedStatement st = conn.prepareStatement(sql);
                                                        ResultSet rs = st.executeQuery();
                                                        String listaTelefones = "";
                                                        while (rs.next()) {

                                                            listaTelefones += "<option value=" + rs.getInt("id_tipo_telefone") + ">" + rs.getString("telefone_tipo") + "</option>";

                                                        }
                                                        out.println(listaTelefones);
                                                    } catch (SQLException e) {
                                                        out.println("<option> erro!</option>");
                                                    }
                                                %>

                                            </select>
                                        </div> 

                                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 ">
                                            <input class="form-control" placeholder="Numero tel" id="numero_telefone" name="numero_telefone">
                                            
                                            <div class="table-responsive">
                                            <table id="lista_telefone" class="table">
                                                
                                                <tbody>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3 ">
                                            <button type="button" class="btn btn-default glyphicon glyphicon-plus alert-info" id="add_telefone" name="add_telefone"></button>
                                        </div>
                                        
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-5 col-md-3 col-lg-3 ">
                                            <button type="submit" class="btn btn-primary" name="salvar">Salvar</button>                                      
                                            <button type="reset" class="btn btn-link" name="cancelar">Cancelar</button>
                                        </div>

                                    </div>


                                </form>
                            </div>
                            <!-- /.col-lg-6 (nested) -->

                            <!-- /.col-lg-6 (nested) -->
                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->


        <!-- /#page-wrapper -->


        <!-- /#wrapper -->

        <%@ include file='includes/script_fim.jsp' %>
        <script>
            $(document).ready(function () {
                $("#add_telefone").click(function () {
                    //alert($("#tipo_telefone").val()+" "+$("#numero_telefone").val());
                    //$("#lista").html($("#telefone_tipo").val());
                    var novaLinha = $("<tr>");
                    var colunas = "";

                    colunas += "<td>" + $("#tipo_telefone option:selected").text() + "</td>";
                    colunas += "<td>" + $("#numero_telefone").val() + "</td>";
                    colunas += '<td><button class="btn btn-xs glyphicon glyphicon-remove alert-danger" onclick="RemoveLinha(this)" type="button"></button></td>';
                    novaLinha.append(colunas);
                    $("#lista_telefone").append(novaLinha);

                });
                RemoveLinha = function (handler) {
                    var tr = $(handler).closest('tr');

                    tr.fadeOut(400, function () {
                        tr.remove();
                    });

                    return false;
                };


                $("#bt_cep").click(function () {
                    $.ajax({
                        type: "POST",
                        dataType: "html",
                        url: "http://localhost:8080/Sistema_saude/admin/includes/ajax-buscarCep.jsp",
                        async: true,
                        data: {cep: $("#cep").val()},
                        success: function (response) {
                            var arrEndereco = response.split("&");
                            $("#tipo_logradouro").each(function () {
                                $("option", this).each(function () {
                                    if ($.trim($(this).text().toLowerCase()) == $.trim(arrEndereco[0].toLowerCase())) {
                                        $(this).attr("selected", "selected");
                                    }

                                });
                            });

                            /*$("#tipo_logradouro option").each(function() {
                             alert("Avenida" == arrEndereco[0]);
                             return $(this).text() == arrEndereco[0];
                             }).attr("selected", true);
                             alert(arrEndereco[0]);
                             */


                            $("#logradouro").val(arrEndereco[1]);
                             $("#bairro").val(arrEndereco[2]);
                              $("#cidade").val(arrEndereco[3]);
                               $("#estado").val(arrEndereco[4]);

                        }

                    });


                });

                $('#adicionar').click(function () {

                    // var dados = $('#form').serialize();
                    $.ajax({
                        type: 'POST',
                        dataType: "html",
                        url: "http://localhost:8080/Sistema_saude/admin/includes/ajax-inserir.jsp",
                        async: true,
                        data: {novo_centro: $("#novo_centro").val()},
                        success: function (response) {
                            alert(response.responseText());
                            location.reload();
                        }
                    });

                });
            });

        </script>
    </body>

</html>
