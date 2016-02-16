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

            $("#registro").on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var recipient = button.data('whatever'); // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this);

                modal.find('.modal-body input').val(recipient);

            });
             $("#modalEspecialidade").on('show.bs.modal', function (event) {
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

        <!--inicio modal centro atendimento-->
        <div class="modal fade" id="registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Registro</h4>
                    </div>
                    <div class="modal-body">
                        <form method="post" id="form">
                            <div class="form-group">
                                <label for="novo_centro" class="control-label">Tipo:</label>
                                <input type="text" class="form-control" id="novo_centro" placeholder="CRM, CRO,...">
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
        <!--Inicio do modal adicionar especialidade-->
        <div class="modal fade" id="modalEspecialidade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Especialidade</h4>
                    </div>
                    <div class="modal-body">
                        <form method="post" id="form">
                            <div class="form-group">
                                <label for="novo_centro" class="control-label">Tipo:</label>
                                <input type="text" class="form-control" id="novo_centro" placeholder="Otorrino, Pediatra...">
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
        <!--Fim modal especialidade-->
        
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
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <h4>Novo Profissional de saúde</h4>
                            </div>
                            <div class="panel-body">

                                <form name="formulario" method="post" action=""  >
                                    <!-- inicio row cadastro profissional-->
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 ">
                                            <input class="form-control" placeholder="Nome" name="nome" id="nome">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-8 col-sm-4 col-md-4 col-lg-2">
                                            <select class="form-control" name="tipo_registro_oficial">
                                                <option>CRM,CRO...</option>
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
                                      <div class="col-xs-4 col-sm-2 col-md-3 col-lg-1 ">
 <button type="button" class="btn btn-default glyphicon glyphicon-plus" name="add_registro" data-toggle="modal" data-target="#registro" data-whatever="@mdo"></button>
 
                                            </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-5 ">
                                            <input class="form-control" placeholder="Número Registro oficial" name="Registro_oficial">
                                        </div>
                                    </div>
                                    <!--fim row centro atendimento-->
                                    <br>
                                    <!--inicio horas atendimento-->
                                    <div class="row"> 
                                        <div class=" col-xs-6 ">
                                            <h5>Horas de atendimento</h5>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3" name="horas_inicial">
                                           
                                              
                                                    <div class="form-group">
                                                        <div class='input-group date' id='datetimepicker2'>
                                                            <input type='text' class="form-control" />
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-time"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                               
                                                
                                          

                                        </div>
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3" name="horas_final">
                                            
                                                
                                                    <div class="form-group">
                                                        <div class='input-group date' id='datetimepicker3'>
                                                            <input type='text' class="form-control" />
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-time"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                
                                       
                                        </div> 
                                    </div>
                                    <div class="row"> 

                                        <div class=" col-xs-6">
                                            <h5>Data limite</h5>
                                        </div>
                                    </div>
                                    <div class="row"> 
                                        <div class='col-xs-6 col-sm-12 col-md-12 col-lg-3'>
                                            <div class="form-group">
                                                <div class='input-group date ' id='inicial' >
                                                    <input type='text' class="form-control" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>

                                        </div>
                                        <div class='col-xs-6 col-sm-12 col-md-12 col-lg-3'>
                                            <div class="form-group">
                                                <div class='input-group date ' id='final' >
                                                    <input type='text' class="form-control" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <br>

                                    <fieldset>
                                        <legend></legend>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3" name="especialidades">
                                                <select class="form-control" id="select-especialidade">
                                                     <option>Especialidade</option>
                                                    <option id="add_especialidade" name="add_especialidade" data-toggle="modal" data-target="#modalEspecialidades" data-whatever="@mdo">Novo</option>

                                                </select>
                                                <div class="table-responsive">
                                                    <table id="especialidade" class="table">
                                                       
                                                        <tbody>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-xs-3 col-sm-2 col-md-3 col-lg-1 ">
                                                <button type="button" class="btn btn-default glyphicon glyphicon-plus" id="add_especialidades" name="add_especialidades"></button>
                                            </div>
                                            <div class="col-xs-3 col-sm-2 col-md-3 col-lg-1 ">
                                                <button type="button" class="btn btn-default " id="add_especialidade" name="add_especialidade" data-toggle="modal" data-target="#modalEspecialidade" data-whatever="@mdo">Novo</button>
                                            </div>
                                        </div>

                                        <br>

                                        <div class='row'>
                                            <div class="col-xs-6 col-sm-2 col-md-2 col-lg-3">
                                                <select class="form-control" name="centro_atendimento">
                                                    <option>Centro de atendimento</option>
                                                    <%                                                        try {
                                                            Connection conn = conexao.getconexao();
                                                            // conn.setAutoCommit(true);
                                                            String sql = "select * from tb_tipo_logradouro order by tipo_logradouro";
                                                        PreparedStatement st = conn.prepareStatement(sql);
                                                            ResultSet rs = st.executeQuery();
                                                            String tipoLogradouros = "";
                                                            while (rs.next()) {
                                                                tipoLogradouros += "<option value=" + rs.getInt("id_tipo_logradouro") + ">" + rs.getString("tipo_logradouro") + "</option>";
                                                            }
                                                        } catch (SQLException e) {
                                                            out.println("<option> erro!</option>");
                                                        }

                                                    %>
                                                </select>
                                                 <div class="table-responsive">
                                                    <table id="centro_atendimento" class="table">
                                                       
                                                        <tbody>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td id="remover_linha"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                               
                                            </div>
                                            <div class="col-xs-2 col-sm-2 col-md-3 col-lg-3 ">
                                                <button type="button" class="btn btn-default glyphicon glyphicon-plus" id="add_centro_atendimento" name="add_centro_atendimento"></button>

                                            </div>
                                          
                                        </div> 
                                    </fieldset>


                                    <br>


                                    <div class="row">
                                        <div class="col-xs-12 col-sm-5 col-md-3 col-lg-3 ">
                                            <button type="submit" class="btn btn-success" name="salvar">Salvar</button>                                      
                                            <button type="reset" class="btn btn-link" name="cancelar">Cancelar</button>
                                        </div>

                                    </div>


                                </form>

                                <!-- /.col-lg-6 (nested) -->

                                <!-- /.col-lg-6 (nested) -->

                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

</div>
                <!-- /#page-wrapper -->

</div>
                <!-- /#wrapper -->

                <%@ include file='includes/script_fim.jsp' %>
                <script>
                    $(document).ready(function () {
                        $("#add_especialidades").click(function () {
                            //alert($("#tipo_telefone").val()+" "+$("#numero_telefone").val());
                            //$("#lista").html($("#telefone_tipo").val());
                            var novaLinha = $("<tr>");
                            var colunas = "";

                            colunas += "<td>" + $("#select-especialidade option:selected").text() + "</td>";
                           
                            colunas += '<td><button class="btn btn-xs glyphicon glyphicon-remove alert-danger"  onclick="RemoveLinha(this)" type="button"></button></td>';
                            novaLinha.append(colunas);
                            $("#especialidade").append(novaLinha);

                        });
                        RemoveLinha = function (handler) {
                            var tr = $(handler).closest('tr');

                            tr.fadeOut(400, function () {
                                tr.remove();
                            });

                            return false;
                        };
                    });
                         $(document).ready(function () {
                        $("#add_centro_atendimento").click(function () {
                            //alert($("#tipo_telefone").val()+" "+$("#numero_telefone").val());
                            //$("#lista").html($("#telefone_tipo").val());
                            var novaLinha = $("<tr>");
                            var colunas = "";

                            colunas += "<td>" + $("#select-especialidade option:selected").text() + "</td>";
                           
                            colunas += '<td><button class="btn btn-xs glyphicon glyphicon-remove alert-danger"  onclick="RemoveLinha(this)" type="button"></button></td>';
                            novaLinha.append(colunas);
                            $("#centro_atendimento").append(novaLinha);

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
