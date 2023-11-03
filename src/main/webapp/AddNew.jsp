<%--
    Document   : AddNew
    Created on : Oct 2, 2023, 11:03:13 AM
    Author     : NGMINHAT
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Product</title>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body>
        <div class="container">
            <h1>Create New Product</h1>

            <form action="new" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="productID">Product ID</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input name="proID" type="text" class="form-control" id="productID">
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
                            <input name="pName" type="text" class="form-control" id="productName">
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
                            <input name="pprice" type="text" class="form-control" id="price">
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
                            <input  name="pQuantity" type="number" class="form-control input-number" id="quantity">
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
                            <input name="pImg" type="file" class="form-control" id="image">
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
                            <input name="pDescrip" type="text" class="form-control" id="productID">
                        </div>
                    </div>
                </div>


                <button type="submit" class="btn btn-primary" onclick="return validateForm();">Submit</button>
                <button  class="btn btn-danger"><a href="list" class="btn btn-danger">Back to Home</a></button>
            </form>
        </div>
    </body>
    <script>
        function validateForm() {
            var productID = document.getElementById("productID").value;
            var price = document.getElementById("price").value;
            var quantity = document.getElementById("quantity").value;
            var image = document.getElementById("image").value; // Lấy giá trị trường file

            if (productID.trim() === "") {
                alert("Product ID cannot be empty.");
                return false;
            }

            if (isNaN(price) || price <= 0) {
                alert("Please enter a valid positive price.");
                return false;
            }

            if (isNaN(quantity) || quantity <= 0) {
                alert("Please enter a valid positive quantity.");
                return false;
            }

            if (image.trim() === "") {
                alert("Please select an image file.");
                return false;
            }

            return true;
        }
    </script>

</html>
