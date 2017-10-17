<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name=viewport content="width=device-width, initial-scale=1">

  <title>{{title or 'vmailadm'}}</title>
  <style type="text/css">
body {
    margin: 40px auto;
    max-width: 650px;
    line-height: 1.6;
    font-size: 18px;
    color: #444;
    padding: 0 10px
}

h1,h2,h3 {
    line-height: 1.2
}

hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
}

header ul {
    list-style-type: none;
    float: right;
}

header ul li {
    display: inline;
}

header h1 {
    display: inline;
}

table, th, td {
    border: 1px solid black;
}

  </style>
</head>

<body>
<header>
<h1>{{title or 'vmailadm'}}</h1>
<ul>
    <li><a href=/>Home</a>
    <li><a href=/users>Users</a>
    <li><a href=/aliases>Aliases</a>
</ul>
<header>

{{!base}}
</body>
</html>
