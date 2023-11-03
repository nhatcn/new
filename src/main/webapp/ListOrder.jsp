<%-- 
    Document   : ListOrder
    Created on : Oct 18, 2023, 12:29:54 AM
    Author     : NGMINHAT
--%>

<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1 class="text-center">List of Order</h1>
        <button class="btn btn-warning"><a href="order" style="text-decoration: none; color: white;">New Order</a></button>
        <button class="btn btn-warning"><a href="logout" style="text-decoration: none; color: white;">Logout</a></button>
        <button class="btn btn-warning"><a href="list" style="text-decoration: none; color: white;">Back To List Product</a></button>
        <h1>Hello ${sessionScope.acc.fullName}</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User Name</th>
                    <th>Total</th>
                    <th>Date</th>           
                    <th>Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Order> OrderList = (List<Order>) request.getAttribute("listOrder");

                    for (Order order : OrderList) {
                %>
                <tr>
                    <td><%= order.getOrderID()%></td>
                    <td><%= order.getUserName()%></td>
                    <td><%= order.getOrderTotal()%></td>
                    <td><%= order.getOrderDate()%></td>
                    <td><%= order.getOrderDes()%></td>
                    <td>
                        <button class="btn btn-warning"><a href="editOrder?oID=<%= order.getOrderID()%>" style="text-decoration: none; color: white;">Edit</a></button>
                        <button class="btn btn-danger"><a href="deleteOrder?oID=<%= order.getOrderID()%>" style="text-decoration: none; color: white;">Delete</a></button>
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
