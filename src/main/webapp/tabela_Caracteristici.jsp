
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caracteristici</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeCaracteristica").hide();
                $("#modificaCaracteristica").hide();

                $("#update").click(function () {
                    $("#modificaCaracteristica").show();
                    $("#stergeCaracteristica").hide();
                    document.getElementById('numeCaracteristica').disabled = false;
                    document.getElementById('detalii').disabled = false;
                    document.getElementById('frecventaAparitie').disabled = false;
                });
                $("#delete").click(function () {
                    $("#stergeCaracteristica").show();
                    $("#modificaCaracteristica").hide();
                    document.getElementById('numeCaracteristica').disabled = true;
                    document.getElementById('detalii').disabled = true;
                    document.getElementById('frecventaAparitie').disabled = true;
                });
            });
        </script>
		<link href="css/tabelaCaracteristicih.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <div>
    	<hr>
    	<hr>
        <h1 align="center"> Tabela Caracteristici:</h1> 
        <br/>
        <table border="1" align="center">
            <tr>
                <td><b>IdCaracteristica:</b></td>
                <td><b>Nume Caracteristica:</b></td>
                <td><b>Detalii:</b></td>
                <td><b>Frecventa Aparitie Caracteristica in Animale[%]:</b></td>
            </tr>
            <c:forEach var="caracteristica" items="${listaCaracteristici}">
                <tr>
                    <td>${caracteristica.idcaracteristica}</td>
                    <td>${caracteristica.numeCaracteristica}</td>    
                    <td>${caracteristica.detalii}</td>
                    <td>${caracteristica.frecventaAparitie}</td>            
                </tr>
            </c:forEach>
        </table>
        <br/>
        <form action="CaracteristiciController" method="POST">
            <div align="center">
                Modifica: <input type="radio" id="update" name="modifica_sterge" onclick="document.getElementById('numeCaracteristica').disabled = false;"> Sterge: <input type="radio" id="delete" name="modifica_sterge" onclick="document.getElementById('numeCaracteristica').disabled = true;"><br><br>
                <select name="idcaracteristica">
                    <c:forEach items="${listaCaracteristici}" var="caracteristica">
                        <option value="${caracteristica.idcaracteristica}">${caracteristica.idcaracteristica}</option>
                    </c:forEach>
                </select>
                <br><br>
                <table>
                <tr>
                <td align="center"> Modifica Nume Caracteristica:</td>
                <td><input id="numeCaracteristica" type="text" name="numeCaracteristica" required="required"></td>
                </tr>
                <tr>
                <td align="center">Modifica detalii:</td> 
                <td><input id="detalii" type="text" name="detalii" required="required"></td>
                </tr>
                <tr>
                <td align="center">Modifica Frecventa Aparitie in Animale[%]:</td> 
                <td><input id="frecventaAparitie" type="number" min="0" max="100" step="0.01" name="frecventaAparitie" required="required"></td>
                </tr>
                
                </table>
                </br>
                </br>
                <button type="submit" id="modificaCaracteristica" name="modificaCaracteristica"> Modifica</button>
                <button type="submit" id="stergeCaracteristica" name="stergeCaracteristica"> Sterge </button>
            </div>
        </form>
        <div align="center">
	        <table>
				<tr>
					<td><form action="adauga_Caracteristica.jsp" method="POST">
	            		<p align="center"><input type="submit" value="Adauga caracteristica"> &nbsp;<br>
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
