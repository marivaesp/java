<%-- 
    Document   : ajax-inserir
    Created on : 17/11/2015, 12:09:11
    Author     : Marivaldo
--%>

<%@page import="Correios.*"%>

<%
    String cep;
    cep = request.getParameter("cep");
    String _tipoLogradouro = "";
    String _logradouro = "";
    String _bairro = "";
    String _cidade = "";
    String _uf = "";
    String _cep = "";

    if (cep != null) {
        CEPService buscarCep = CEPServiceFactory.getCEPService();
        CEP ceps = buscarCep.obtemPorNumeroCEP(cep);

        Integer pos = ceps.getLogradouro().indexOf(" ");
        _tipoLogradouro = ceps.getLogradouro().substring(0, pos);
        _logradouro = ceps.getLogradouro().substring(pos);
        _bairro = ceps.getBairro();
        _cidade = ceps.getLocalidade();
        _uf = ceps.getUf();
        _cep = cep;
         out.println(_tipoLogradouro+"&"+_logradouro+"&"+_bairro+"&"+_cidade+"&"+_uf);
        
    }
%>