<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%if (request.getParameter("txtName") != null)
{
session.setAttribute("txtName", request.getParameter("txtName")); session.setAttribute("txtCategory", request.getParameter("txtCategory")); session.setAttribute("txtStoreBox", request.getParameter("txtStoreBox")); session.setAttribute("txtPrice", request.getParameter("txtPrice"));session.setAttribute("txtQuantity", request.getParameter("txtQuantity"));session.setAttribute("txtCompany", request.getParameter("txtCompany"));session.setAttribute("txtExpireDate", request.getParameter("txtExpireDate"));
}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MEDICINE - PHARMACY LANKA (PVT) LIMITED</title>
<style>
h1 {
	color:black;
	font-family:"Courier New", monospace;
	font-size:80px;
	font:bold;
	font-bold:12px;
	text-align:center;  	
}
body {
	background-color:white;
	background-attachment:local;
	background-repeat:no-repeat;
	color: black;
	font-weight:bold;
	background-image:url("image.jpg");
	background-size:cover;
	font-size:1.3rem;
}
.button {
  display: inline-block;
  padding: 13px 29px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: black;
  background-color:olive;
  border: none;
  border-radius: 13px;
  box-shadow: 0 3px #666;
}
.button:hover {background-color: chartreuse}
.delete:hover {background-color:crimson}
.edit:hover {background-color:blue}
.button.edit.delete:active {
  background-color: olive;
  box-shadow: 0 5px #999;
  transform: translateY(4px);
}
table {
    text-align:center;
}
th {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 16px 16px;
}
table.list {
    background-color:mediumseagreen;
    width:100%;
    text-align:center;
	font: bolder;
}
</style>
</head>
<body>
<h1>MEDICINE LIST</h1>
<input type="hidden" id="hfRowIndex" value="" />
<table class="table" width="690" height="483" border="0" align="center">
<tr>
      <td width="167">Name</td>
      <td width="197"><input type="text" name="txtName" id="txtName" value=""/></td>
      <td width="312"><label for="txtName"></label></td>
      </tr>
    <tr>
      <td>Category</td>
	  <td><label for="txtCategory"></label>
      <input type="text" name="txtCategory" id="txtCategory"  value=""/></td>
      <td><label for="txtCategory"></label></td>
    </tr>
    <tr>
      <td>Store Box</td>
      <td><label for="txtStoreBox"></label>
      <input type="text" name="txtStoreBox" id="txtStoreBox" value="" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Price</td>
      <td><label for="txtPrice"></label>
      <input type="text" name="txtPrice" id="txtPrice" value=""/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Quantity</td>
      <td><label for="txtQuantity"></label>
      <input type="text" name="txtQuantity" id="txtQuantity" value=""/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Company</td>
      <td><label for="txtCompany"></label>
      <input type="text" name="txtCompany" id="txtCompany" value=""/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Expire Date</td>
      <td>
      <input type="date" id="txtExpireDate" name="txtExpireDate" value=""/>
      </td>
      <td>&nbsp;</td>
    </tr>     
  <tr>
      <td><button class="button" id="btnAdd">Add</button>
      <button class="button"  id="btnUpdate" style="display: none;">Update</button></td>
      <td><button class="button" id="btnclear">Clear</button></td>
 </tr>
</table>
<br>
<table class="list" id="medicineList">
<thead>
<tr>
  <th>Name</th>
  <th>Category</th>
  <th>Store Box</th>
  <th>Price</th>
  <th>Quantity</th>
  <th>Company</th>
  <th>Expire Date</th>
  <th>Action</th>
  <th>Action</th>
</tr>
</thead> 
<tbody>
</tbody> 
</table>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
  $(function () {
            $('#btnAdd').on('click', function () {
                var Name, Category, StoreBox,Price,Quantity,Company,ExpireDate;
                Name = $("#txtName").val();
                Category = $("#txtCategory").val();
                StoreBox = $("#txtStoreBox").val();
				Price = $("#txtPrice").val();
                Quantity = $("#txtQuantity").val();
                Company = $("#txtCompany").val();
                ExpireDate = $("#txtExpireDate").val();
				
                var edit = "<a class='button edit' href='JavaScript:void(0);'>Edit</a>";
                var del = "<a class='button delete' href='JavaScript:void(0);'>Delete</a>";
								
                if (Name == "") {
                    alert("Name fields required!");
                } else {
                    var table = "<tr><td>" + Name + "</td><td>" + Category + "</td><td>" + StoreBox + "</td><td>" + Price + "</td><td>" +Quantity + "</td><td>"+Company + "</td><td>" +ExpireDate+ "</td><td>" + edit  +"</td><td>"+ del + "</td></tr>";
                    $("#medicineList").append(table);
                }
                Name = $("#txtName").val("");
                Category = $("#txtCategory").val("");
                StoreBox = $("#txtStoreBox").val("");
				Price = $("#txtPrice").val("");
                Quantityy = $("#txtQuantity").val("");
                Company = $("#txtCompany").val("");
                ExpireDate = $("#txtExpireDate").val("");
                Clear();
            });      
            $('#btnUpdate').on('click', function () {
                var Name, Category, StoreBox,Price,Quantity,Company,ExpireDate;
                Name = $("#txtName").val();
                Category = $("#txtCategory").val();
                StoreBox = $("#txtStoreBox").val();
				Price = $("#txtPrice").val();
                Quantity = $("#txtQuantity").val();
                Company = $("#txtCompany").val();
                ExpireDate = $("#txtExpireDate").val();
 
                $('#medicineList tbody tr').eq($('#hfRowIndex').val()).find('td').eq(0).html(Name);
                $('#medicineList tbody tr').eq($('#hfRowIndex').val()).find('td').eq(1).html(Category);
				$('#medicineList tbody tr').eq($('#hfRowIndex').val()).find('td').eq(2).html(StoreBox);
                $('#medicineList tbody tr').eq($('#hfRowIndex').val()).find('td').eq(3).html(Price);
				$('#medicineList tbody tr').eq($('#hfRowIndex').val()).find('td').eq(4).html(Quantity);
                $('#medicineList tbody tr').eq($('#hfRowIndex').val()).find('td').eq(5).html(Company);
				$('#medicineList tbody tr').eq($('#hfRowIndex').val()).find('td').eq(6).html(ExpireDate);
                $('#btnAdd').show();
                $('#btnUpdate').hide();
                Clear();
            });         
            $("#medicineList").on("click",".delete", function (e) {
                if (confirm("Are you sure want to delete this record!")) {
                    $(this).closest('tr').remove();
                } else {
                    e.preventDefault();
                }
            });
            $('#btnclear').on('click', function () {
                Clear();
            });
            $("#medicineList").on("click", ".edit", function (e) {
                var row = $(this).closest('tr');
                $('#hfRowIndex').val($(row).index());
                var td = $(row).find("td");
                $('#txtName').val($(td).eq(0).html());
                $('#txtCategory').val($(td).eq(1).html());
                $('#txtStoreBox').val($(td).eq(2).html());
				$('#txtPrice').val($(td).eq(3).html());
                $('#txtQuantity').val($(td).eq(4).html());
                $('#txtCompany').val($(td).eq(5).html());
				$('#txtExpireDate').val($(td).eq(6).html());
                $('#btnAdd').hide();
                $('#btnUpdate').show();
            });
        });
        function Clear() {
            $("#txtName").val("");
            $("#txtCategory").val("");
            $("#txtStoreBox").val("");
			$("#txtPrice").val("");
            $("#txtQuantity").val("");
            $("#txtCompany").val("");
			$("#txtExpireDate").val("");
            $("#hfRowIndex").val("");
        }
</script>		
</body>
</html>	
	