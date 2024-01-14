<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caracteristica</title>
        <link href="css/adaugah.css" rel="stylesheet" type="text/css">
    </head>
    <body>
	<div>
		<hr>
		<hr>
        <div align="center" id="add">
            <h1> Adauga caracteristica:</h1>
            <br/>
            <form action="CaracteristiciController" method="GET">
                <table>
                    <tr>
                        <td> Nume Caracteristica: </td>
                        <td><input type="text" name="numeCaracteristica" required="required"></td>
                    </tr>
                    <tr>
                        <td> Detalii Caracteristica: </td>
                        <td><input type="text" name="detalii" required="required"></td>
                    </tr>
                     <tr>
                        <td> Frecventa aparitie caracteristica in animale: </td>
                        <td><input type="number" min="0" max="100" step="0.01" name="frecventaAparitie" required="required"></td>
                    </tr>
                    
                </table>
                <br/>
                <input type="submit" name="adaugaCaracteristica" value="Adauga">
            </form>
        </div>

        <div align="center">
	        <table>
				<tr>
					<td><form action="CaracteristiciController" method="POST">
	            		<p align="center"><input type="submit" name="afiseazaCaracteristica" value="Caracteristici"> &nbsp;<br>
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
