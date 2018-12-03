<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ÍøÉÏÊéµêºóÌ¨¹ÜÀíÏµÍ³</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<script type="text/javascript">
	function select(){
		document.search.submit();
	}
	function ckbSelect(sta,flag){
		for(var i=0;i<document.getElementsByName(flag).length;i++){
			document.getElementsByName(flag)[i].checked = sta;
		}
	}
	function addIt(){
		window.location.href = "addBook.html";
	}
	function editIt(){
		var allCheck = document.getElementsByName("userId");
		var num = 0;
		var isbn="";
		for(var i=0;i<allCheck.length;i++){
			if(allCheck[i].checked){
				num++;
				isbn=allCheck[i].value;
			}
		}
		if(num==1){
			window.location.href="editBook.jsp?isbn="+isbn;
		}else if(num==0){
			alert("Ã»ÓÐÑ¡ÖÐÐÅÏ¢£¡");
			return;
		}else{
			alert("ÇëÖ»Ñ¡ÔñÒ»ÌõÐÅÏ¢");
			return;
		}
		
	}
	
	var xmlHttp;	//ÓÃÓÚ´æ·ÅXMLHttpRequest¶ÔÏó
	//´´½¨
	function createXMLHttpRequest(){
		if(window.ActiceXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}else if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}
	}
	
	//Í¨¹ýajaxÒì²½É¾³ý
	function deleteIt(){
		var allCheck = document.getElementsByName("userId");
		var num = 0;
		var delstr="";
		for(var i=0;i<allCheck.length;i++){
			if(allCheck[i].checked){
				num++;
				delstr+=allCheck[i].value+"|";
			}
		}
		if(num > 0){
			if(window.confirm("ÄúÈ·¶¨ÒªÉ¾³ýËùÑ¡µÄÂð£¿")){
				//µ÷ÓÃcreatexml·½·¨
				createXMLHttpRequest();
				//°ó¶¨×´Ì¬´¥·¢Æ÷
				xmlHttp.onreadystatechange = processor;
				//Í¨¹ýget·½·¨Ìá½»
				xmlHttp.open("GET","DelBookServlet?del="+delstr);
				xmlHttp.send(null);
			}
		}else{
			alert("Ã»ÓÐÑ¡ÖÐÐÅÏ¢£¡");
			return;
		}
	}
	
	//´¦Àí´Ó·þÎñÆ÷·µ»ØµÄÐÅÏ¢
	function processor(){
		if(xmlHttp.readyState == 4){//ÏìÓ¦Íê³É
			if(xmlHttp.status == 200){//·µ»Ø³É¹¦
				//È¡³ö·þÎñÆ÷·µ»ØµÄÏàÓ¦ÎÄ±¾ÐÅÏ¢
				var flag = xmlHttp.responseText;
				if(flag.indexOf("true")!=-1){
					//É¾³ýÒ³ÃæÐÅÏ¢²»Ë¢ÐÂ
					var allCheck = document.getElementsByName("userId");
					for(var i=0;i<allCheck.length;i++){
						if(allCheck[i].checked){
							var chTr = allCheck[i].parentNode.parentNode;
							chTr.removeNode(true);
							i--;
						}
					}
				}else{
					alert("É¾³ýÊ§°Ü£¡");
				}
			}
			
		}
	}
	
	var x,y;
	//ÏÔÊ¾Í¼Êé¹¤¾ß
	function showBook(isbn){
		//¶¨Î»Êó±êÎ»ÖÃ
		x = event.clientX;
		y = event.clientY;
		createXMLHttpRequest();
		xmlHttp.onreadystatechange = bookTip;
		xmlHttp.open("GET","ShowBookServlet?isbn="+isbn);
		xmlHttp.send(null);
	}
	
	function bookTip(){
		var book;
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				//È¥³ý·þÎñÆ÷·µ»ØµÄjson×Ö·û×ª»»Îªjson¶ÔÏó
				//alert(xmlHttp.responseText);
				book = eval("("+xmlHttp.responseText+")");
				//ÏÔÊ¾ÃûÎªtipµÄdiv²ã£¬¸Ã²ãÏÔÊ¾¹¤¾ßÌáÊ¾ÐÅÏ¢
				document.all.bookTip.style.display = "block";
				document.all.bookTip.style.top = y;
				document.all.bookTip.style.left = x+10;
				//document.all.showPic.src = "../images/bookcovers/"+book.pic;
				document.all.tipTable.rows[0].cells[1].innerHTML = book.bookName;
				document.all.tipTable.rows[1].cells[1].innerHTML = book.isbn;
				if(book.publisherID == 1){
					document.all.tipTable.rows[2].cells[1].innerHTML = "ÈËÃñÓÊµç³ö°æÉç";
				}else if(book.publisherID == 2){
					document.all.tipTable.rows[2].cells[1].innerHTML = "Çå»ª´óÑ§³ö°æÉç";
				}else if(book.publisherID == 3){
					document.all.tipTable.rows[2].cells[1].innerHTML = "µç×Ó¹¤Òµ³ö°æÉç";
				}
				document.all.tipTable.rows[3].cells[1].innerHTML = "£¤" + book.price;
				document.all.tipTable.rows[4].cells[1].innerHTML = book.count + "(±¾/Ì×)";
				document.all.tipTable.rows[5].cells[1].innerHTML = book.description;
			}
		}
	}
	function hiddenBook(){
		document.all.bookTip.style.display = "none";
	}
</script>
</head>
<body>
<c:if test="${bookList==null}">
	<jsp:forward page="SearchBookAdminServlet"></jsp:forward>
</c:if>
<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>Í¼ÊéÒ»ÀÀ</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		
		<form method="post" name="search" action="SearchBookAdminServlet">
			<table>
				<tr>
					<td>&nbsp;Í¼ÊéÃû³Æ</td>
					<td>
						<input type="text" name="bookName">
					</td>
					<td>&nbsp;³ö°æÉç</td>
					<td>
						<select name="publisher" id="publisher">
							<option value=""></option>
							<option value="1">ÈËÃñÓÊµç³ö°æÉç</option>
							<option value="2">Çå»ª´óÑ§³ö°æÉç</option>
							<option value="3">µç×Ó¹¤Òµ³ö°æÉç</option>
						</select>
					</td>
					<td>
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">²éÑ¯</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>Í¼ÊéÁÐ±í</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
			<table>
				<tr>
					<td>
					<button onClick="addIt()">ÐÂÔöÍ¼Êé</button>
					<button onClick="deleteIt()">É¾³ý</button>
					<button onClick="editIt()">ÐÞ¸ÄÍ¼ÊéÐÅÏ¢</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="checkAll" onClick="onClick=ckbSelect(this.checked,'userId')"></th>
							<th><span>ÐòºÅ</span></th>
							<th><span>ÊéÃû</span></th>
							<th><span>³ö°æÉç</span></th>
							<th><span>ISBN</span></th>
							<th><span>¼Û¸ñ(£¤)</span></th>
							<th><span>¿â´æÁ¿(±¾/Ì×)</span></th>
						</tr>
					</thead>
					<tbody><!-- Ò»¿ªÊ¼²»ÏÔÊ¾Êý¾ÝÊÇÒòÎªjavabeanÖÐµÄÒ»¸öÔªËØÃû×ÖÆ´´íÁË -->
						<!-- Ê¹ÓÃJSP½Å±¾Ñ­»·ÏÔÊ¾ -->
						<c:forEach var="book" items="${bookList}" varStatus="status">
						<tr>
							<td>
							<input type="checkbox" name="userId" value="${book.isbn }" calss="input_radio">
							</td>
							<td>${status.count}</td>
							<td onmousemove=showBook(${book.isbn }) onmouseout=hiddenBook() >${book.bookName }</td>
							<td>
								<c:choose>
									<c:when test="${book.publisherID==1 }">
									ÈËÃñÓÊµç³ö°æÉç</c:when>
									<c:when test="${book.publisherID==2 }">
									Çå»ª´óÑ§³ö°æÉç</c:when>
									<c:when test="${book.publisherID==3 }">
									µç×Ó¹¤Òµ³ö°æÉç</c:when>
								</c:choose>
							</td>
							<td>${book.isbn}</td>
							<td>${book.price}</td>
							<td>${book.count}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</td>
	</tr>
</table>

<div id="bookTip" style="position:absolute;border:1px;border-style:solid;display:none;">
	<table bgcolor="#ffffee" >
		<tr>
			<td>
				<img height=260 alt="" src="" width=202 style="cursor:pointer" id="showPic">
			</td>
			
			<td>
			<table id="tipTable">
				<tr>
					<td>Í¼ÊéÃû³Æ:</td>
					<td></td>
				</tr>
				<tr>
					<td>ISBN:</td>
					<td></td>
				</tr>
				<tr>
					<td>³ö°æÉç:</td>
					<td></td>
				</tr>
				<tr>
					<td>¼Û¸ñ:</td>
					<td></td>
				</tr>
				<tr>
					<td>¿â´æÁ¿:</td>
					<td></td>
				</tr>
				<tr>
					<td>Í¼Êé¼ò½é:</td>
					<td></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>

</body>
</html>