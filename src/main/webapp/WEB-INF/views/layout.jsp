<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Wind Motors - Trang web mua bán xe trực tuyến uy tín, nhanh chóng và đa dạng mẫu mã hàng đầu Việt Nam </title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<tiles:insertAttribute name="head" />
<!-- DataTables CSS -->
<link href="/static/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="/static/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">


</head>

<script>
        $(document).ready(function() {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });
</script>

<body>


	
	<tiles:insertAttribute name="header" />


	<tiles:insertAttribute name="menu" />

<div class="container-fluid" style="margin-top: -15px; padding: 0px 80px 0px 80px">
		<tiles:insertAttribute name="body" />
</div>
	<div class="row">
		<tiles:insertAttribute name="aside" />
	</div>


	<tiles:insertAttribute name="footer" />


</body>
</html>