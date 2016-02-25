---
title       : Interactive Document
subtitle    : slidify + shiny
author      : issa
job         : Data science
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax,bootstrap,quiz,shiny,interactive,leaflet,crosslet,datamaps]   
mode        : selfcontained # {standalone, draft}
ext_widgets : {rCharts: [libraries/nvd3]}
knit        : slidify::knit2slides
--- &radio

## interactive quiz

what is 1 + 1?

1. 1
2. _2_
3. 3
4. 4

*** .hint

This is a hint

*** .explanation

This is an explanation

---

## interactive charts


<div id = 'chart1' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart1()
    });
    function drawchart1(){  
      var opts = {
 "dom": "chart1",
"width":    800,
"height":    400,
"x": "Hair",
"y": "Freq",
"group": "Eye",
"type": "multiBarChart",
"id": "chart1" 
},
        data = [
 {
 "Hair": "Black",
"Eye": "Brown",
"Sex": "Male",
"Freq":             32 
},
{
 "Hair": "Brown",
"Eye": "Brown",
"Sex": "Male",
"Freq":             53 
},
{
 "Hair": "Red",
"Eye": "Brown",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Brown",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Black",
"Eye": "Blue",
"Sex": "Male",
"Freq":             11 
},
{
 "Hair": "Brown",
"Eye": "Blue",
"Sex": "Male",
"Freq":             50 
},
{
 "Hair": "Red",
"Eye": "Blue",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Blue",
"Sex": "Male",
"Freq":             30 
},
{
 "Hair": "Black",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Brown",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             25 
},
{
 "Hair": "Red",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              5 
},
{
 "Hair": "Black",
"Eye": "Green",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Brown",
"Eye": "Green",
"Sex": "Male",
"Freq":             15 
},
{
 "Hair": "Red",
"Eye": "Green",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Green",
"Sex": "Male",
"Freq":              8 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

--- &interactive

## interactive console

<textarea class='interactive' id='interactive{{slide.num}}' data-cell='{{slide.num}}' data-results='asis' style='display:none'>library(rCharts)
require(googleVis)
M1<-gvisMotionChart(Fruits, idvar = 'Fruit', timevar = 'Year')
print(M1, tag ='chart')</textarea>

---

## interactive chart with shiny controls

<div class="row-fluid">
  <div class="col-sm-4">
    <form class="well">
      <div class="form-group shiny-input-container">
        <label class="control-label" for="sex">Choose Sex</label>
        <div>
          <select id="sex"><option value="Male" selected>Male</option>
<option value="Female">Female</option></select>
          <script type="application/json" data-for="sex" data-nonempty="">{}</script>
        </div>
      </div>
      <div class="form-group shiny-input-container">
        <label class="control-label" for="type">Choose Type</label>
        <div>
          <select id="type"><option value="multiBarChart" selected>multiBarChart</option>
<option value="multiBarHorizontalChart">multiBarHorizontalChart</option></select>
          <script type="application/json" data-for="type" data-nonempty="">{}</script>
        </div>
      </div>
    </form>
  </div>
  <div class="col-sm-8">
    <div id="nvd3Plot" class="shiny-html-output nvd3 rChart"></div>
  </div>
</div>

--- &interactive

## rMaps


```
## Error in mapply(FUN = f, ..., SIMPLIFY = FALSE): zero-length inputs cannot be mixed with those of non-zero length
```

--- 

## rChart

<iframe src=' assets/fig/unnamed-chunk-5-1.html ' scrolling='no' frameBorder='0' seamless class='rChart polycharts ' id=iframe- chart1b0c32d29c8 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

--- 

## economic rChart

<iframe src=' assets/fig/unnamed-chunk-6-1.html ' scrolling='no' frameBorder='0' seamless class='rChart morris ' id=iframe- charte0c41355f8 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

--- 

## Us personal expenduture

<iframe src=' assets/fig/unnamed-chunk-7-1.html ' scrolling='no' frameBorder='0' seamless class='rChart xcharts ' id=iframe- chart1b0c3046596 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

---

## leaflet

<iframe src=' assets/fig/unnamed-chunk-8-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- chart1d4c1d315e66 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style><iframe src=' assets/fig/unnamed-chunk-8-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- chart1d4c3e764a8c ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

---

## Map 2


```
## Error in C(45.5236, -122.675): object not interpretable as a factor
```

<iframe src=' assets/fig/unnamed-chunk-9-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- charte0c7b6c7421 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style><iframe src=' assets/fig/unnamed-chunk-9-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- charte0c77e66f64 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

---

## Map 3

<iframe src=' assets/fig/unnamed-chunk-10-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- charte0c5b9e5c9a ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style><iframe src=' assets/fig/unnamed-chunk-10-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- charte0c7c706a37 ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>

---



