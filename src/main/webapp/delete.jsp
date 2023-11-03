<%--
    Document   : AddNew
    Created on : Oct 2, 2023, 11:03:13 AM
    Author     : NGMINHAT
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update New Product</title>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <style>
        img{
            width: 50%;
        }
    </style>
    <body>
        <div class="container">
            <h1>Delete Product</h1>
            <%
                Product p = (Product) request.getAttribute("product");
                if (p != null) {
            %>
            <form action="delete" method="post">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="productID">Product ID</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=p.getProID()%>" name="proID" type="text" class="form-control" id="productID" readonly>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="productName">Product Name</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=p.getProName()%>" name="pName" type="text" class="form-control" id="productName" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="price">Price</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=p.getProPrice()%>" name="pprice" type="text" class="form-control" id="price"readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="quantity">Quantity</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=p.getProQuan()%>" name="pQuantity" type="number" class="form-control" id="quantity" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="image">Image</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            
                            <img class="img"src="<%=p.getProPic()%>" alt="alt"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="description">Description</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=p.getProDes()%>" name="pDescrip" type="text" class="form-control" id="productID">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" onclick="return validateForm();">Delete</button>
                <button  class="btn btn-danger"><a href="list" class="btn btn-danger">Back to Home</a></button>


            </form>
            <%
                }
            %>
        </div>

    </body>

</html>
