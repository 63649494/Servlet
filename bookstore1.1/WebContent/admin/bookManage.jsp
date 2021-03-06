<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>网上书店后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
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
			alert("没有选中信息！");
			return;
		}else{
			alert("请只选择一条信息");
			return;
		}
		
	}
	
	var xmlHttp;	//用于存放XMLHttpRequest对象
	//创建
	function createXMLHttpRequest(){
		if(window.ActiceXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}else if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}
	}
	
	//通过ajax异步删除
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
			if(window.confirm("您确定要删除所选的吗？")){
				//调用createxml方法
				createXMLHttpRequest();
				//绑定状态触发器
				xmlHttp.onreadystatechange = processor;
				//通过get方法提交
				xmlHttp.open("GET","DelBookServlet?del="+delstr);
				xmlHttp.send(null);
			}
		}else{
			alert("没有选中信息！");
			return;
		}
	}
	
	//处理从服务器返回的信息
	function processor(){
		if(xmlHttp.readyState == 4){//响应完成
			if(xmlHttp.status == 200){//返回成功
				//取出服务器返回的相应文本信息
				var flag = xmlHttp.responseText;
				if(flag.indexOf("true")!=-1){
					//删除页面信息不刷新
					var allCheck = document.getElementsByName("userId");
					for(var i=0;i<allCheck.length;i++){
						if(allCheck[i].checked){
							var chTr = allCheck[i].parentNode.parentNode;
							chTr.removeNode(true);
							i--;
						}
					}
				}else{
					alert("删除失败！");
				}
			}
			
		}
	}
	
	var x,y;
	//显示图书工具
	function showBook(isbn){
		//定位鼠标位置
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
				//去除服务器返回的json字符转换为json对象
				//alert(xmlHttp.responseText);
				book = eval(+xmlHttp.responseText);
				//显示名为tip的div层，该层显示工具提示信息
				document.all.bookTip.style.display = "block";
				document.all.bookTip.style.top = y;
				document.all.bookTip.style.left = x+10;
				document.all.showPic.src = "../images/bookcovers/"+book.pic;
				document.all.tipTable.rows[0].cells[1].innerHTML = book.bookName;
				document.all.tipTable.rows[1].cells[1].innerHTML = book.bookisbn;
				if(book.publisherID == 1){
					document.all.tipTable.rows[2].cells[1].innerHTML = "人民邮电出版社";
				}else if(book.publisherID == 2){
					document.all.tipTable.rows[2].cells[1].innerHTML = "清华大学出版社";
				}else if(book.publisherID == 3){
					document.all.tipTable.rows[2].cells[1].innerHTML = "电子工业出版社";
				}
				document.all.tipTable.rows[3].cells[1].innerHTML = "￥" + book.price;
				document.all.tipTable.rows[4].cells[1].innerHTML = book.count + "(本/套)";
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
					<td>图书一览</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		
		<form method="post" name="search" action="SearchBookAdminServlet">
			<table>
				<tr>
					<td>&nbsp;图书名称</td>
					<td>
						<input type="text" name="bookName">
					</td>
					<td>&nbsp;出版社</td>
					<td>
						<select name="publisher" id="publisher">
							<option value=""></option>
							<option value="1">人民邮电出版社</option>
							<option value="2">清华大学出版社</option>
							<option value="3">电子工业出版社</option>
						</select>
					</td>
					<td>
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">查询</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>图书列表</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
			<table>
				<tr>
					<td>
					<button onClick="addIt()">新增图书</button>
					<button onClick="deleteIt()">删除</button>
					<button onClick="editIt()">修改图书信息</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="checkAll" onClick="onClick=ckbSelect(this.checked,'userId')"></th>
							<th><span>序号</span></th>
							<th><span>书名</span></th>
							<th><span>出版社</span></th>
							<th><span>ISBN</span></th>
							<th><span>价格(￥)</span></th>
							<th><span>库存量(本/套)</span></th>
						</tr>
					</thead>
					<tbody><!-- 一开始不显示数据是因为javabean中的一个元素名字拼错了 -->
						<!-- 使用JSP脚本循环显示 -->
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
									人民邮电出版社</c:when>
									<c:when test="${book.publisherID==2 }">
									清华大学出版社</c:when>
									<c:when test="${book.publisherID==3 }">
									电子工业出版社</c:when>
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

<div id="bookTip" style="position:absolute;border:1px;border-style:solid;">
	<table bgcolor="#ffffee">
		<tr>
			<td>
				<img height=260 alt="" src="" width=202 style="cursor:pointer" id="showPic">
			</td>
			
			<td>
			<table>
				<tr>
					<td>图书名称:</td>
					<td></td>
				</tr>
				<tr>
					<td>ISBN:</td>
					<td></td>
				</tr>
				<tr>
					<td>出版社:</td>
					<td></td>
				</tr>
				<tr>
					<td>价格:</td>
					<td></td>
				</tr>
				<tr>
					<td>库存量:</td>
					<td></td>
				</tr>
				<tr>
					<td>图书简介:</td>
					<td></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>

</body>
</html>