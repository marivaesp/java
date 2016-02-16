/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//nome do pacote
package br.com.ConexaoBanco;

//classe necessarias para uso do banco
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 *
 * @author Marivaldo
 */
//inicio da classe conexao
public class conexao {

    public static String status = "Não conectou ao bd.";

    public conexao() {
    }

    //metodo de conexao
    public static java.sql.Connection getconexao() {

        Connection connection = null;

        try {
            String driveName = "com.mysql.jdbc.Driver";

            Class.forName(driveName);

            String serverName = "localhost";
            String bancoDados = "bd_sistema_saude";
            String url = "jdbc:mysql://" + serverName + "/" + bancoDados;
            String userName = "root";
            String password = "";
            connection = DriverManager.getConnection(url, userName, password);

            //testar conexao
            if (connection != null) {
                status = "Status-->conectado com sucesso";
            } else {
                status = "Status-->Não foi possível realizar conexao";
            }
            return connection;
        } catch (ClassNotFoundException e) {
            System.out.println("Nao foi possível encontrar o drive de conexão");
            return null;
        } catch (SQLException e) {
            System.out.println("Não foi possível conectar ao banco de dados");
            return null;
        }
    }

    public static String statusConexao() {
        return status;
    }

    public static boolean fechaConexao() {

        try {
            conexao.getconexao().close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
    
    public static java.sql.Connection reiniciarConexao(){
    fechaConexao();
    return conexao.getconexao();
    }
}
