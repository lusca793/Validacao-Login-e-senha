<%-- 
    Document   : restrita
    Created on : 21/09/2020, 09:47:12
    Author     : lucas
--%>

<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página restrita</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <%
                String alert = (String) session.getAttribute("alert");
                String nome = (String) session.getAttribute("nomeUsuario");
                String disabled = "";                
                if(nome == null){
                    disabled = "disabled";
                }
                if(alert != null){
                out.print(alert);
                alert = "";
                }
                
            %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="https://www.linkedin.com/in/lucas-menezes-teixeira-79b7a51a2/" target="_blank">Lucas M. Teixeira</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#textoNavbar" aria-controls="textoNavbar" aria-expanded="false" aria-label="Alterna navegação">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="textoNavbar">
              <ul class="navbar-nav mr-auto">

                <li class="nav-item">
                  <a class="nav-link" href="index.jsp">Login</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link <% out.print(disabled); %>" href="restrita.jsp">Lista de cadastrados</a>
                </li>
              </ul>

              <div class="nav-item dropdown" style="margin-right: 70px;">
                <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <b> <% out.println(nome); %> </b>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item disabled" href="#"><i class="fa fa-user" aria-hidden="true"></i>&nbsp; Perfil</a>
                  <a class="dropdown-item disabled" href="#"><i class="fa fa-cog" aria-hidden="true"></i> Configurações</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item text-danger" href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                </div>
              </div>
              
            </div>
        </nav>
        <div class="container">
            <div class="row mt-4 mb-4">
                &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-plus" aria-hidden="true"></i></button>&nbsp;&nbsp;
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" name="txtbuscar" placeholder="Digite um nome" aria-label="Search">
                    <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
            <table class="table">
                <thead class="thead-dark">
                  <tr class="text-center">
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Email</th>
                    <th scope="col">Senha</th>
                    <th scope="col">Nível</th>
                    <th scope="col">Operações</th>
                  </tr>
                </thead>
                <tbody class="text-center">
                  <%
                        Statement st = null;
                        ResultSet rs = null;
                        String id = "";
                        String nomeUser = "";
                        String email = "";
                        String senha = "";
                        String nivel = "";
                        
                        try{
                            st = new Conexao().conectar().createStatement();
                            rs = st.executeQuery("SELECT * FROM login");
                            while(rs.next()){
                    %>
                                <tr>
                                    <th scope="row"><%= rs.getString(1) %></th>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= rs.getString(5) %></td>
                                    <td>
                                        <button type="button" class="btn btn-info">Informações</button>
                                        <button type="button" class="btn btn-danger">Apagar</button>
                                    </td>
                                </tr>
                    
                    <%
                                
                            }
                        }catch(Exception e){
                            out.println(e);
                        }
                        
                    %>
                </tbody>
            </table>
            
            <script src="https://use.fontawesome.com/ba9c748399.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
            
        </body>
</html>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cadastrar usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="restrita.jsp" method="post">
            <div class="modal-body">
                <div class="row">
                      <div class="form-group col-md-4">
                        <label>Nome</label>
                        <input type="text" class="form-control" name="nome" id="nome" placeholder="Nome" required>
                      </div>
                      <div class="form-group col-md-8">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                      </div>
                </div>
                
                <div class="row">
                      <div class="form-group col-md-8">
                        <label>Senha</label>
                        <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha" required>
                      </div>
                      <div class="form-group col-md-4">
                            <label>Nível</label>
                            <select class="form-control" name="nivel" id="nivel">
                              <option value="Comum">Comum</option>
                              <option value="Adm">Adm</option>
                            </select>
                      </div> 
                </div>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="submit" id="btn-salvar" name="btn-salvar" class="btn btn-info">Cadastrar</button>
            </div>
        </form>
    </div>
  </div>
</div>

<%
    
    if (request.getParameter("btn-salvar") != null) {
            String nomeCad = request.getParameter("nome");
            String emailCad = request.getParameter("email");
            String senhaCad = request.getParameter("senha");
            String nivelCad = request.getParameter("nivel");
            
            try{
                session.setAttribute("nomeCad", nomeCad);
                session.setAttribute("emailCad", emailCad);
                session.setAttribute("senhaCad", senhaCad);
                session.setAttribute("nivelCad", nivelCad);

            }catch(Exception e){
                out.println(e);
            }
            response.sendRedirect("cadastrar.jsp");
            
        }

%>