# CSVx

Do you want the simplicity of storing your data in CSV files but worry that
your technical decision won't be enterprise enough for your company? CSVx is
the answer! Now you can store your CSV data in Enterprise Ready XML!

```xml
<csvx:document xmlns:csvx='https://github.com/rodjek/csvx/'>
  <csvx:header>
    <csvx:value>
      Title 1
    </csvx:value>
    <csvx:value>
      Title 2
    </csvx:value>
  </csvx:header>
  <csvx:row>
    <csvx:value>
      foo
    </csvx:value>
    <csvx:value>
      bar
    </csvx:value>
  </csvx:row>
  <csvx:row>
    <csvx:value>
      baz
    </csvx:value>
    <csvx:value>
      gronk
    </csvx:value>
  </csvx:row>
</csvx:document>
```

We've even provided a shiny `csv2csvx` tool to convert your crufty old CSV
files to this shiny new future-proof format.

```
csv2csvx <file>
```
