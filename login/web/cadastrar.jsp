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
                st.executeUpdate("INSERT INTO login (nome, email, senha, nivel) VALUES ('"+nome+"','"+email+"','"+senha+"','"+nivel+"')");
                response.sendRedirect("restrita.jsp");
            }catch(Exception e){
                out.println(e);
            }
            
        

%>