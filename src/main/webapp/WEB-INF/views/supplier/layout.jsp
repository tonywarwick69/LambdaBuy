<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Trang quản lý</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/static/images/icon/favicon.ico">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/static/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="/static/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="/static/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/static/dist/css/sb-supplier-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/static/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


</head>
<body>

	<div id="wrapper">

		<tiles:insertAttribute name="menu"/>

		<div id="page-wrapper">
			<tiles:insertAttribute name="body"/>
		</div>

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/static/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="/static/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	
	<script src="/static/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/static/dist/js/sb-supplier-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	

	
	<script src="/ckeditor/ckeditor.js"></script>

	
	<script>
        $(document).ready(function() {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });
    </script>

	<script>
		$(document).ready(function() {
			var editor = '';
			editor = CKEDITOR.replace('description');

		});
	</script>
	
		 <!-- Flot Charts JavaScript -->
    <script src="/static/bower_components/flot/excanvas.min.js"></script>
    <script src="/static/bower_components/flot/jquery.flot.js"></script>
    <script src="/static/bower_components/flot/jquery.flot.pie.js"></script>
    <script src="/static/bower_components/flot/jquery.flot.resize.js"></script>
    <script src="/static/bower_components/flot/jquery.flot.time.js"></script>
    <script src="/static/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="/static/js/flot-data.js"></script>


</body>
</html>