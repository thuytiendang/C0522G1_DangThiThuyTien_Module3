<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/8/2022
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
 <form action="/Calculator" method="get">
   <h1>Simple Calculation</h1>
   <table>
     <tr>
       <td>First operand</td>
       <td><input name="first" type="text"></td>
     </tr>
     <tr>
       <td>Operator</td>
       <td>
         <select name="operation">
           <option value="Addition">Addition</option>
           <option value="Subtraction">Subtraction</option>
           <option value="Multiplication">Multiplication</option>
           <option value="Division">Division</option>
         </select>
       </td>
     </tr>
     <tr>
       <td>Second operand</td>
       <td><input name="second" type="text"></td>
     </tr>
     <tr>
       <td></td>
       <td>
         <input type="submit" name="calculate" value="Calculate">
       </td>
     </tr>
   </table>
 </form>
  </body>
</html>
