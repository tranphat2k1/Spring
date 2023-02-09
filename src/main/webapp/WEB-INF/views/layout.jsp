<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Website Bán giày</title>
  <tiles:insertAttribute name="head"/>
</head>
<body>
<div class="container col-md-12" style="margin-top:100px">
  <nav class="row">
  	<tiles:insertAttribute name="menu"/>
  </nav>
  <div class="row">
  	<article class="col-sm-1">
  	</article>
  	<article class="col-sm-8">
  		<tiles:insertAttribute name="body"/>
  	</article>
  	<aside class="col-sm-2">
  		<tiles:insertAttribute name="aside"/>
  	</aside>
  	<article class="col-sm-1">
  	</article>
  </div>
  <footer class="row">
  	<p class="text-center">&copy; 2022. All rights reserved</p>
  </footer>
</div>
</body>
</html>