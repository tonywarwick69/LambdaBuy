<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

  <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
          var data = google.visualization.arrayToDataTable([
        	  ['Khách hàng', 'Doanh thu'],
              <c:forEach var="e" items="${data}">       
              ['${e[0]}',    ${e[2]}],
              </c:forEach>
          ]);

          var view = new google.visualization.DataView(data);
         

          var options = {
            title: "Doanh số bán hàng theo khách hàng",
            bar: {groupWidth: "95%"},
            legend: { position: "bottom" },
          };
          var chart = new google.visualization.ColumnChart(document.getElementById("curve_chart"));
          chart.draw(view, options);
      }


    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>
