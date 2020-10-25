<%-- 
    Document   : index
    Created on : 21/09/2020, 09:46:59
    Author     : lucas
--%>

<%@page import="config.Conexao"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <%
        Statement st = null;
        ResultSet rs = null;             
    %>
    <body>
        
            <%
                String nome = (String) session.getAttribute("nomeUsuario");
                String disabled = "";                
                if(nome == null){
                    disabled = "disabled";
                }
            %>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="https://www.linkedin.com/in/lucas-menezes-teixeira-79b7a51a2/" target="_blank">Lucas M. Teixeira</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#textoNavbar" aria-controls="textoNavbar" aria-expanded="false" aria-label="Alterna navegação">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="textoNavbar">
              <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Login</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link <% out.print(disabled); %>" href="restrita.jsp">Lista de cadastrados</a>
                </li>
              </ul>
            </div>
        </nav>
        
        <div class="container">
            <h1 class="text-center">Fazer Login</h1>
            <form method="POST" action="index.jsp">
                <div class="row justify-content-md-center">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="email" class="form-control" required name="email" placeholder="Email">
                        </div>
                    </div>
                </div>
                <div class="row justify-content-md-center">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="password" class="form-control" required name="senha" placeholder="Senha">
                        </div>   
                    </div>
                </div>
                             
                <div class="row justify-content-md-center">
                    <div class="col-md-4">
                      <input type="submit" value="Logar" class="btn btn-block btn-dark">  
                    </div>
                    
                </div>
                
            </form>
            <br>
            <center>
                <%
                    String email = request.getParameter("email");
                    String senha = request.getParameter("senha");
                    String nomeUsuario = "";
                    String BdEmail = "";
                    String BdSenha = "";
                    int i = 0;

                    try{
                        /*Conexão com BD*/
                        st = new Conexao().conectar().createStatement();
                        rs = st.executeQuery("SELECT * FROM login WHERE email = '"+email+"' and senha = '"+senha+"'");
                        while(rs.next()){
                            nomeUsuario = rs.getString(2);
                            BdEmail = rs.getString(3);
                            BdSenha = rs.getString(4);                        
                            rs.last();
                            i = rs.getRow();
                        }

                    }catch(Exception e){
                        out.println(e);
                    }

                    if(nome == null){
                        if(email == null || senha == null){
                        out.println("Dados não preenchidos");
                        } else{
                            if(i>0){
                                session.setAttribute("nomeUsuario", nomeUsuario);
                                response.sendRedirect("restrita.jsp");
                            }
                        }
                    }else{
                        out.print("Você ja está logado!!");
                    }

                %>
            </center>   
        </div>
    </body>
</html>
