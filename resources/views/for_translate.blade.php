<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
@foreach($json as $key => $value)
    <div class="row">
        <a translate="no">"{{$key}}":</a>
        <a translate="yes">"{{$value}}",</a>
    </div>
@endforeach
</body>
</html>
