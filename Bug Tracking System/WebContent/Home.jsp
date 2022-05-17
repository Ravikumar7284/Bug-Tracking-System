<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/homestyle.css">
<title>Home Page</title>
</head>
<body>
<%@include file="Include/Header.jsp"%>
<hr>
<table>
<tr>
<td>
<p style="margin: 10px 150px 0px 40px">
The Project entitled BUG TRACKING SYSTEM is a web based and intranet application aimed for the tracking and resolution of bugs.
All businesses have issues that need to be tracked and managed to resolution.
Resolution of these issues requires the coordination of multiple individuals within and perhaps even outside the company.
This application can be used by all team members to coordinate their work and to make sure that reported bugs can 
use this application and enhancement requests wont be forgotten.
In this way Tester delivers up to the minute project information and status to the team members everywhere to foster better communication and collaboration.
The Online handling of reporting ensure that the project working hours will be prompt.
This also ensures well-disciplined authorization of users according to the project specification. 
Usage of this application increases the productivity and quality of the project.
</p>
</td>
<td style="width:25%">
<%@include file="Include/Login.jsp"%>
</td>
</tr>
</table>
<hr>
<%@include file="Include/Footer.jsp"%>