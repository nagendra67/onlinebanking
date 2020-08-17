<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank Main</title>
</head>
<body>
<script type="text/javascript"> 
//function to open transactions page
function doSubmit()
{
	window.open("DisplayTran.jsp","_self");
}
//function to open debit amount page where 1000 rs is debited and updated
function doSubmit1()
{
	window,open("DebitAmount.jsp","_self");
}
</script>
<!-- button directly opens page in same tab-->
<button name="button" type="button" onclick="doSubmit();">Transactions</button>
<button name="button" type="button" onclick="doSubmit1();">FundTransfer</button>
</body>
</html>
