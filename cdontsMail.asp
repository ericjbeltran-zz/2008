<%@ LANGUAGE="VBSCRIPT" %>
<html>

<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<meta HTTP-EQUIV="Content-Type" content="text/html;charset=iso-8859-1">
<title>CDONTSMail</title>
<%
      Sub Write(strWriteThis)
         'This subroutine just writes out whatever is
         'passed to it.
         response.write(strWriteThis & "<br>")
      end sub

      %>
</head>

<body>
<%
         Dim myCDONTSMail
         Dim strFrom
         Dim strTo
         Dim strSubject
         Dim strMessage
         Dim lngImportance

         'The following variable assignments are not required
         'they are just here to make interpretation of the
         'myCDONTSMail.Send line easier.  You could put the
         'Request.Form statements in the .Send line to cut down
         'on the amount of code in the file.
         strFrom=request.form("txtEmail")
         strTo="ericjbeltran@gmail.com"
         strSubject = "Website Email"
         strBody="Name: " & request.form("txtName") & CHR(13) & "Email: " & request.form("txtEmail") & CHR(13) & "Message: " & request.form("txtMessage")
         'lngImportance = request.form("optImportance")

         'The following four lines of code are just here for test
         'purposes to see what variables have been pulled in from the
         'HTM form.
         Write("strFrom = " & strFrom)
         Write("strTo = " & strTo)
         Write("strSubject = " & strSubject)
         Write("strMessage = " & strBody)
         Write("Importance = " & lngImportance)

         Set myCDONTSMail = CreateObject("CDONTS.NewMail")

         myCDONTSMail.Send strFrom,strTo,strSubject,strBody

         Set myCDONTSMail  = Nothing
         Write "Mail has been sent."
         %>
</body>
</html>
