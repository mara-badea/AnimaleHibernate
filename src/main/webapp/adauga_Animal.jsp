<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filme</title>
        <link href="css/adaugah.css" rel="stylesheet" type="text/css">
    </head>
    <body>
	<div>
		<hr>
		<hr>
        <div align="center" id="add">
            <h1> Adauga animal:</h1>
            <br/>
            <form action="AnimaleController" method="GET">
                <table>
                    <tr>
                        <td> Tip: </td>
                        <td><input type="text" name="tip" required="required"></td>
                    </tr>
                    <tr>
                    	<td> Familie: </td>
                    	<td><input type="text" name="familie" required="required"></td>
                    </tr>
                    <tr>
                        <td> Specie: </td>
                        <td><input type="text" name="specie" required="required"></td>
                    </tr>
               		<td align="right">Modifica Sex:</td>
               		<td><select id="sex" type="text" name="sex" required="required">
               		<option value="Feminin">Feminin</option>
               		<option value="Masculin">Masculin</option>
               		</td>
                    <tr>
                        <td> Nume: </td>
                        <td><input type="text" name="nume" required="required"></td>
                    </tr>
                </table>
                <br/>
                <input type="submit" name="adaugaAnimal" value="Adauga">
            </form>
        </div>
        <div align="center">
	        <table>
				<tr>
					<td><form action="AnimaleController" method="POST">
	            		<p align="center"><input type="submit" name="afiseazaAnimal" value="Animale"> &nbsp;<br>
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
