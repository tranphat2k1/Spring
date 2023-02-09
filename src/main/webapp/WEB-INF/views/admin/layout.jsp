<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Website Bán giày</title>
  <tiles:insertAttribute name="head"/>
</head>
<body>

<div class="container" style="margin-top:50px">
  <nav class="row">
  	<tiles:insertAttribute name="menu"/>
  </nav>
  <div class="row">
  	<tiles:insertAttribute name="body"/>
  </div>
  <footer class="row">
  	<p class="text-center">&copy; 2022. All rights reserved</p>
  </footer>
</div>

</body>
</html>