<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<%
   Statement st = null;
   ResultSet rs = null;
   String nome = (String) session.getAttribute("nomeCad");
   String email = (String) session.getAttribute("emailCad");
   String senha = (String) session.getAttribute("senhaCad");
   String nivel = (String) session.getAttribute("nivelCad");
            
            try{
                
                st = new Conexao().conectar().createStatement();
                String alert = "";
                rs = st.executeQuery("SELECT * FROM login WHERE email = '"+email+"'");
                while(rs.next()){
                    rs.getRow();
                    if (rs.getRow() > 0) {
                            
                            alert = "<script>alert('ERRO: Email ja cadastrado');</script>";
                            session.setAttribute("alert", alert);
                            response.sendRedirect("restrita.jsp");
                            return;
                            
                    }
                }
                session.setAttribute("alert", alert);
                st.executeUpdate("INSERT INTO login (nome, email, senha, nivel) VALUES ('"+nome+"','"+email+"','"+senha+"','"+nivel+"')");
                response.sendRedirect("restrita.jsp");
            
            }catch(Exception e){
                out.println(e);
            }
            
        

%>