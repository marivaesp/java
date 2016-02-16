/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws;
import Classes.CentroAtendimento;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;

/**
 * REST Web Service
 *
 * @author Marivaldo
 */
@Path("SistemaSaude")
public class SistemaSaude {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of SistemaSaude
     */
   
    public SistemaSaude() {
    }

    /**
     * Retrieves representation of an instance of ws.SistemaSaude
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("aplication/json")
    @Path("Profissional")
    public String getProfissional(){
        return "Urologista";
    }
    
    @PUT
    @Produces("aplication/json")
    @Path("Centro atendimento")
    public String getCentral(String nome){
          CentroAtendimento centro = new CentroAtendimento();
           centro.setNome(nome);      
           centro.inserir();
           return centro.getNome();

    }
    
    
    
    @GET
    @Produces("application/json")
    public String getJson() {
       return "testando ws";
    }

    /**
     * PUT method for updating or creating an instance of SistemaSaude
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("application/json")
    public void putJson(String content) {
    }
}
