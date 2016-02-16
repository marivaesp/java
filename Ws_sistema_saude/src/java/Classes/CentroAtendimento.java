/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import br.com.ConexaoBanco.conexao;
import java.sql.*;

/**
 *
 * @author Marivaldo
 */
public class CentroAtendimento {

    private String nome;
    private String tipoCentroAtendimento;
    private String ddd;
    private String numeroTelefone;
    private String tipoTelefone;
    private String horarioInicial;
    private String horarioFinal;

    public CentroAtendimento() {

    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    public void setTipoCentroAtendimento(String tipoCentro) {
        this.tipoCentroAtendimento = tipoCentro;
    }

    public void setddd(String DDD) {
        this.ddd = DDD;
    }

    public void setNumeroTelefone(String numeroTelefone) {
        this.numeroTelefone = numeroTelefone;
    }

    public void setTipoTelefone(String TipoTelefone) {
        this.tipoTelefone = TipoTelefone;
    }

    public void setHorarioInicial(String horarioInicial) {
        this.horarioInicial = horarioInicial;
    }

    public void setHorarioFinal(String horarioFinal) {
        this.horarioFinal = horarioFinal;
    }

    public void inserir() {
        try {
            Connection conn = conexao.getconexao();
            // conn.setAutoCommit(true);
            String sql = "insert into tb_centro_atendimento(nome,id_tipo_centro_atendimento,id_endereco) values (?,?,?)";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, this.nome);
            st.setInt(2, 1);
            st.setInt(3, 2);
            st.executeUpdate();

            ///conn.
        } catch (SQLException e) {
            System.out.println("Não foi possível conectar ao banco de dados");
        }
    }

    public void listar(String tipo) {
        String sql = "";
        switch (tipo) {
            case "tipo_centro":
                sql = "SELECT * FROM tb_tipo_centro_atendimento order by tipo_centro_atendimento";
                break;

            case "tipo_logradouro":
                sql = "SELECT * FROM tb_tipo_logradouro order by tipo_logradouro";
                break;

            case "tipo_telefone":
                sql= "SELECT * FROM tb_tipo_telefone";
        }

    }
}
