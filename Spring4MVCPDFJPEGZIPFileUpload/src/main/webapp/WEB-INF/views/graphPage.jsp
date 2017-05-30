<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration Form</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/graph.css' />" rel="stylesheet"></link>
<script
	src="https://www.google.com/jsapi?autoload={modules:[{name:visualization,version:1.1,packages:[corechart]}]}.js"
	type="text/javascript">
	
</script>
<script
	src="http://www.cloudformatter.com/Resources/Pages/CSS2Pdf/Script/xepOnline.jqPlugin.js"
	type="text/javascript"></script>
<script type="text/javascript">
	google.setOnLoadCallback(drawChart);
	function AddNamespaceHandler() {
		var svg = jQuery('#chart_div svg');
		//svg.attr("xmlns", "http://www.w3.org/2000/svg");
		//svg.css('overflow', 'visible');
	}
	
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Total Document', 'Total User'],[ 7, 4]]);
		var options = {
			title : 'User & Documents Details',
			hAxis : {
				title : 'Year',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('chart_div'));
		google.visualization.events.addListener(chart, 'ready',
				AddNamespaceHandler);
		chart.draw(data, options);
	}

	//$(document).ready(function() {
	//<!-- Convert the SVG to PDF and download it -->
	var click = "return xepOnline.Formatter.Format('JSFiddle', {render:'download', srctype:'svg'})";
	jQuery('#buttons').append('<button onclick="'+ click +'">PDF</button>');
	//<!-- Convert the SVG to PNG @ 120dpi and open it -->
	click = "return xepOnline.Formatter.Format('JSFiddle', {render:'newwin', mimeType:'image/png', resolution:'120', srctype:'svg'})";
	jQuery('#buttons').append(
			'<button onclick="'+ click +'">PNG @120dpi</button>');
	//<!-- Convert the SVG to JPG @ 300dpi and open it -->
	click = "return xepOnline.Formatter.Format('JSFiddle', {render:'newwin', mimeType:'image/jpg', resolution:'300', srctype:'svg'})";
	jQuery('#buttons').append(
			'<button onclick="'+ click +'">JPG @300dpi</button>');
	//	});
</script>


</head>
<body>
	<div class="generic-container"
		style="margin-left: 145px; padding: 100px">
		<div class="well lead">
			GRAPH DETAILS<i> i.e save as </i>PNG,JPG,PDF
		</div>
		<form:form method="POST" modelAttribute="user" class="form-horizontal">
			<iframe width="900px" height="400px"
				src="//jsfiddle.net/gj10tm69/1/embedded/"
				allowfullscreen="allowfullscreen" frameborder="0">
				<div class="row">
					<div id="buttons">
						<button
							onclick="return xepOnline.Formatter.Format('JSFiddle', {render:'download', srctype:'svg'})">PDF</button>
						<button
							onclick="return xepOnline.Formatter.Format('JSFiddle', {render:'newwin', mimeType:'image/png', resolution:'120', srctype:'svg'})">PNG
							@120dpi</button>
						<button
							onclick="return xepOnline.Formatter.Format('JSFiddle', {render:'newwin', mimeType:'image/jpg', resolution:'300', srctype:'svg'})">JPG
							@300dpi</button>
					</div>

					<div id="buttons"></div>
					<hr />
					<div id="JSFiddle">
						<div id="chart_div" style="width: 900px; height: 500px;"></div>
					</div>
				</div>
			</iframe>
			<div class="row">
				<div class="form-actions floatRight">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update"
								class="btn btn-primary btn-sm" /> or <a
								href="<c:url value='/list' />">Cancel</a>
						</c:when>
						<c:otherwise>
							<a href="<c:url value='/list' />">USER LIST</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>