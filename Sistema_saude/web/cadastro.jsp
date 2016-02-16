
<!DOCTYPE html>
<html lang="pt">

    <head>

        <%@include file="includes/head.jsp" %> 
    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <?php include 'includes/topo.php'; ?>
                <!-- /.navbar-header -->


                <!-- /.navbar-top-links -->

                <?php include 'includes/menu.php'; ?>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Início</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <?php include"includes/painel.php"?>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                 <h4>Novo centro atendimento</h4>
                            </div>
                            <div class="panel-body">

                                <form>
                                    <!-- inicio row centro atendimento-->
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                            <select class="form-control">
                                                <option>Tipo centro atendimento</option>
                                                <?php 
                                                
                                                ?>
                                            </select>
                                        </div>
                                        <div class="col-xs-2 col-sm-2 col-md-3 col-lg-1 ">
                                        <button type="submit" class="btn btn-default glyphicon glyphicon-plus"></button>
                                         </div>
                                        <div class="col-xs-10 col-sm-8 col-md-8 col-lg-8 ">
                                            <input class="form-control" placeholder="Nome centro atendimento">
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
                                            <select id="inicio" class="form-control">
                                                <option>Ínicio</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                            <select class="form-control">
                                                <option>Final</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div> 
                                    </div>
                                    <br>
                                  
                                    <fieldset>
                                        <legend>Endereço</legend>
                                          <div class="row">
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 ">
                                            <input class="form-control" placeholder="Cep">
                                        </div>
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 ">
                                        <button type="submit" class="btn btn-default glyphicon glyphicon-search"></button>
                                          </div>
                                    </div>
                                    <br>
                                  
                                    <div class='row'>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <select class="form-control">
                                                <option>Rua, Av...</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div> 
                                        <div class="col-xs-12 col-sm-5 col-md-6 col-lg-6 ">
                                            <input class="form-control" placeholder="Logradouro">
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-1 col-lg-1 ">
                                            <input class="form-control" placeholder="Nº ">
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 ">
                                            <input class="form-control" placeholder="Complemento">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 ">
                                            <input class="form-control" placeholder="Bairro">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 ">
                                            <input class="form-control" placeholder="Cidade" readonly="true">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 ">
                                            <input class="form-control" placeholder="Estado" readonly="true">
                                        </div>
                                    </div>
                                    </fieldset>
                                    <br>

                                    <div class="row">
                                        <div class="col-xs-8 col-sm-4 col-md-2 col-lg-2">
                                            <select multiple="true" class="form-control">
                                                <option>Tipo telefone</option>
                                                <option>Fax</option>
                                                <option>Fixo</option>
                                                <option>Celular</option>
                                                <option>whatsApp</option>
                                            </select>
                                        </div> 

                                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 ">
                                            <input class="form-control" placeholder="Numero tel">
                                        </div>
                                         <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3 ">
                                        <button type="submit" class="btn btn-default glyphicon glyphicon-plus"></button>
                                         </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                         <div class="col-xs-12 col-sm-5 col-md-3 col-lg-3 ">
                                        <button type="submit" class="btn btn-primary">Salvar</button>                                      
                                         <button type="reset" class="btn btn-link">Cancelar</button>
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

<?php include 'includes/script_fim.php'; ?>

</body>

</html>
