<html>
<body>
<h1>ASP4 Test Page</h1>
<p>
  The date and time is <%= scalar(localtime()) %>.
</p>
<p>
  You have visited this page <%= $Session->{count}++ %> time(s) recently.
</p>
</body>
</html>
