
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
        <title>Observatie</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>Animale</title>
        <link href="css/adaugah.css" rel="stylesheet" type="text/css">
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
        <div align="center" id="add">
            <h1> Adauga observatie:</h1>
            <br/>
            <form action="ObservatiiController" method="GET">
                <table>
                    <tr>
                        <td> Animal: </td>
                        <td>
                            <select name="idanimal">
                                <c:forEach items="${listaAnimale}" var="animale">
                                    <option value="${animale.idanimal}">${animale.idanimal}, ${animale.tip}, ${animale.familie}, ${animale.specie}, ${animale.sex}, ${animale.nume}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Caracteristici: </td>
                        <td>
                            <select name="idcaracteristica">
                                <c:forEach items="${listaCaracteristici}" var="caracteristici">
                                    <option value="${caracteristici.idcaracteristica}">${caracteristici.idcaracteristica}, ${caracteristici.numeCaracteristica}, ${caracteristici.frecventaAparitie} </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Observator: </td>
                        <td><input type="text" name="observator" required="required"></td>
                    </tr>
                </table>
                <br/>
                <input type="submit" name="adaugaObservatie" value="Adauga">
            </form>
        </div>
        <div align="center">
	        <table>
				<tr>
					<td><form action="ObservatiiController" method="POST">
	            		<p align="center"><input type="submit" name="afiseazaObservatie" value="Observatii"> &nbsp;<br>
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
