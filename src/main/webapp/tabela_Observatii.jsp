
<%@page import="DAOImpl.AnimaleDaoImpl"%>
<%@page import="DAOImpl.CaracteristiciDaoImpl"%>
<%@page import="pojo.Animale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Caracteristici"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Observatii</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeObservatie").hide();
                $("#modificaObservatie").hide();

                $("#update").click(function () {
                    $("#modificaObservatie").show();
                    $("#stergeObservatie").hide();
                });
                $("#delete").click(function () {
                    $("#stergeObservatie").show();
                    $("#modificaObservatie").hide();
                });
            });
        </script>
        <link href="css/tabelaObservatiih.css" rel="stylesheet" type="text/css">

    </head>
    <body>
    <div>
    	<hr>
    	<hr>
        <%
			AnimaleDaoImpl animaleDaoImpl = new AnimaleDaoImpl();
        	CaracteristiciDaoImpl caracteristiciDaoImpl = new CaracteristiciDaoImpl();
        	List<Caracteristici> listaCaracteristici = new ArrayList();
        	listaCaracteristici = caracteristiciDaoImpl.afiseazaCaracteristica();
        	List<Animale> listaAnimale = new ArrayList();
        	listaAnimale = animaleDaoImpl.afiseazaAnimal();
        	request.setAttribute("listaCaracteristici", listaCaracteristici);
        	request.setAttribute("listaAnimale", listaAnimale);
		%>
        <h1 align="center"> Tabela Observatii:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IdObservatie:</b></td>
                <td><b>IdAnimal:</b></td>
                <td><b>Tip:</b></td>
                <td><b>Familie:</b></td>
                <td><b>Specie:</b></td>
                <td><b>Sex:</b></td>
                <td><b>Nume:</b></td>
                <td><b>IdCaracteristica:</b></td>
                <td><b>Nume Caracteristica:</b></td>
                <td><b>Frecventa aparitie caracteristica in animale:</b></td>
                <td><b>Observator:</b></td>
            </tr>
            <c:forEach var="observatie" items="${listaObservatii}">
                <tr>
                    <td>${observatie.idobservatie}</td>
                    <td>${observatie.animale.idanimal}</td>
                    <td>${observatie.animale.tip}</td>
                    <td>${observatie.animale.familie}</td>
                    <td>${observatie.animale.specie}</td>
                    <td>${observatie.animale.sex}</td>
                    <td>${observatie.animale.nume}</td>
                    <td>${observatie.caracteristici.idcaracteristica}</td>
                    <td>${observatie.caracteristici.numeCaracteristica}</td>
                    <td>${observatie.caracteristici.frecventaAparitie}</td>
                    <td>${observatie.observator}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <form action="ObservatiiController" method="POST">
            <div align="center">
            
                Modifica: <input type="radio" id="update" name="modifica_sterge" onclick="document.getElementById('observator').disabled = false;
                        document.getElementById('idcaracteristica').disabled = false;
                        document.getElementById('idanimal').disabled = false;"> Sterge: <input type="radio" id="delete" name="modifica_sterge" onclick="document.getElementById('observator').disabled = true;
                        document.getElementById('idcaracteristica').disabled = true;
                        document.getElementById('idanimal').disabled = true;"><br><br>
                idobservatie:
                <select name="idobservatie">
                    <c:forEach items="${listaObservatii}" var="observatie">
                        <option value="${observatie.idobservatie}">${observatie.idobservatie}</option>
                    </c:forEach>
                </select>
                <br><br>
                <table>
            		<tr>
            			<td align="right"> Idanimal:</td>
            			<td> <select name="idanimal" id="idanimal">
                    			<c:forEach items="${listaAnimale}" var="animal">
                        			<option value="${animal.idanimal}">${animal.idanimal}, ${animal.tip}, ${animal.familie} ${animal.specie}, ${animal.sex}, ${animal.nume}</option>
                    			</c:forEach>
                			</select>
                		</td>
            		</tr>
            		<tr>
            			<td align="right"> Idcaracteristica:</td>
            			<td> <select name="idcaracteristica" id="idcaracteristica">
                    			<c:forEach items="${listaCaracteristici}" var="caracteristica">
                        			<option value="${caracteristica.idcaracteristica}">${caracteristica.idcaracteristica}, ${caracteristica.numeCaracteristica}, ${caracteristica.frecventaAparitie}</option>
                    			</c:forEach>
                			</select>
                		</td>
            		</tr>
            		<tr>
            			<td align="right">Modifica Observator:</td>
            			<td> <input id="observator" type="text" name="observator" required="required"></td>
            		</tr>
            	</table>
            	<br/>
                <button type="submit" id="modificaObservatie" name="modificaObservatie"> Modifica</button>
                <button type="submit" id="stergeObservatie" name="stergeObservatie"> Sterge </button>
                <br/>
            </div>
        </form>
        <div align="center">
	        <table>
				<tr>
					<td><form action="adauga_Observatie.jsp" method="POST">
	            		<p align="center"><input type="submit" value="Adauga observatie"> &nbsp;<br>
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
