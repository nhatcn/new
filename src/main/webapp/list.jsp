<%-- 
    Document   : list
    Created on : Oct 16, 2023, 10:38:18 AM
    Author     : NGMINHAT
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of Products</title>
    <link rel="stylesheet" href="css/bootstrap.css">  
</head>
<style>
    table, tr th, tr td {
        border: solid 1px black;
    }
</style>
<body>

<div class="container mt-5">
    <h1 class="text-center">List of Products</h1>
    <button class="btn btn-primary"><a href="AddNew.jsp" style="text-decoration: none; color: white;">Create Product</a></button>
    <button class="btn btn-warning"><a href="logout" style="text-decoration: none; color: white;">Logout</a></button>
    <button class="btn btn-warning"><a href="listOrder" style="text-decoration: none; color: white;">List Order</a></button>
    <h1>Hello ${sessionScope.acc.fullName}</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Image</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Product> productList = (List<Product>) request.getAttribute("list");

            for (Product product : productList) {
        %>
        <tr>
            <td><%= product.getProID()%></td>
            <td><%= product.getProName()%></td>
            <td><%= product.getProQuan()%></td>
            <td><%= product.getProPrice()%></td>
            <td><img src="<%= product.getProPic()%>" alt="<%= product.getProName()%>" width="50"></td>
            <td><%= product.getProDes()%></td>
            <td>
                <button class="btn btn-warning"><a href="edit?proID=<%= product.getProID()%>" style="text-decoration: none; color: white;">Edit</a></button>
                <button class="btn btn-danger"><a href="delete?proID=<%= product.getProID()%>" style="text-decoration: none; color: white;">Delete</a></button>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
