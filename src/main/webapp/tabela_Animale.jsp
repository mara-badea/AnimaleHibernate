
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Animale</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeAnimal").hide();
                $("#modificaAnimal").hide();

                $("#update").click(function () {
                    $("#modificaAnimal").show();
                    $("#stergeAnimal").hide();
                });
                $("#delete").click(function () {
                    $("#stergeAnimal").show();
                    $("#modificaAnimal").hide();
                });
            });
        </script>
		<link href="css/tabelaAnimaleh.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <div>
    	<hr>
    	<hr>
        <h1 align="center"> Tabela Animale:</h1> 
        <form action="AnimaleController" method="POST" name="afiseazaAnimal">
        <table border="1" align="center">
            <tr>
                <td><b>IdAnimal:</b></td>
                <td><b>Tip:</b></td>
                <td><b>Familie:</b></td>
                <td><b>Specie:</b></td>
                <td><b>Sex:</b></td>
                <td><b>Nume:</b></td>
            </tr>
            <c:forEach var="animal" items="${listaAnimale}">
                <tr>
                    <td>${animal.idanimal}</td>
                    <td>${animal.tip}</td>
                    <td>${animal.familie}</td>
                    <td>${animal.specie}</td>
                    <td>${animal.sex}</td>
                    <td>${animal.nume}</td>

                </tr>
            </c:forEach>
        </table>
        <br/>
        
        <div align="center">
                Modifica: <input type="radio" id="update" name="modifica_sterge"onclick="document.getElementById('tip').disabled = false;
                        document.getElementById('specie').disabled = false;
                        document.getElementById('familie').disabled = false;
                        document.getElementById('sex').disabled = false;
                        document.getElementById('nume').disabled = false;"> Sterge: <input type="radio" id="delete" 
                        name="modifica_sterge" onclick="document.getElementById('tip').disabled = true;
                        document.getElementById('specie').disabled = true;
                        document.getElementById('familie').disabled = true;
                        document.getElementById('sex').disabled = true;	
                        document.getElementById('nume').disabled = true;"><br><br>
                <select name="idanimal">
                    <c:forEach items="${listaAnimale}" var="animal">
                        <option value="${animal.idanimal}">${animal.idanimal}</option>
                    </c:forEach>
                </select>
                <br><br>
                <table>
                	<tr>
                		<td align="right"> Modifica Tip:</td>
                		<td><input id="tip" type="text" name="tip" required="required"></td>
                	</tr>
                	<tr>
                		<td align="right">Modifica Familie:</td>
						<td><input id="familie" type="text" name="familie" required="required"></td>
                	</tr>
                	<tr>
                		<td align="right">Modifica Specie:</td>
                		<td><input id="specie" type="text" name="specie" required="required"> </td>
                	</tr>
                	<tr>
                		<td align="right">Modifica Sex:</td>
                		<td><select id="sex" type="text" name="sex" required="required">
                		<option value="Feminin">Feminin</option>
                		<option value="Masculin">Masculin</option>
                		</td>
                	</tr>
                	<tr>
                		<td align="right">Modifica Nume:</td>
                		<td><input id="nume" type="text" name="nume" required="required"></td>
                	</tr>
                </table>
                <br/>
                <button type="submit" id="modificaAnimal" name="modificaAnimal"> Modifica</button> 
                <button type="submit" id="stergeAnimal" name="stergeAnimal"> Sterge </button>
                <br/>
            </div>
        </form>
        <div align="center">
	        <table>
				<tr>
					<td><form action="adauga_Animal.jsp" method="POST">
	            		<p align="center"><input type="submit" value="Adauga animal"> &nbsp;<br>
	        			</p></form>
	        		</td>
	        		<td><form action="index.html" method="POST">
	            		<p align="center"><input type="submit" value="Home"> &nbsp; <br>
	        			</p></form>
	        		</td>
				</tr>
			</table>
        </div>
        <hr>
        <hr>
    </div>
    </body>
</html>
