HTMLWidgets.widget({

  name: 'chartjs',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {
    helpers = Chart.helpers;

    var datasets = [];
    var data = [];
    console.log(x);

    switch(x.type){
      case "Bar":
        for (i = 0, len = x.data.length; i < len; i ++){
          datasets.push({
              label: x.dataLabels[i],
              borderColor: x.colors.borderColor[i],
              backgroundColor: x.colors.backgroundColor[i],
              hoverBorderColor: x.colors.hoverBorderColor[i],
              hoverBackgroundColor: x.colors.hoverBackgroundColor[i],
              data: x.data[i]
          });
        }
        break;
      case "Line":
      case "Radar":
        for (i = 0, len = x.data.length; i < len; i ++){
          datasets.push({
              label: x.dataLabels[i],
              borderColor: x.colors.borderColor[i],
              backgroundColor: x.colors.backgroundColor[i],
              pointBorderColor: x.colors.pointBorderColor[i],
              pointBackgroundColor: x.colors.pointBackgroundColor[i],
              pointHoverBorderColor: x.colors.pointHoverBorderColor[i],
              pointHoverBackgroundColor: x.colors.pointHoverBackgroundColor[i],
              data: x.data[i]
          });
        }
        break;
      case "Pie":
      case "Doughnut":
      case "PolarArea":
        if(x.data[0].length > 1){
          for (i = 0, len = x.data[0].length; i < len; i ++){
            var tempData = [];
            for (j = 0, lenj = x.data.length; j < lenj; j ++){
              tempData.push(x.data[j][i]);
            }
            console.log(tempData);
            datasets.push({
                borderColor: x.colors.borderColor,
                backgroundColor: x.colors.backgroundColor,
                hoverBorderColor: x.colors.hoverBorderColor,
                hoverBackgroundColor: x.colors.hoverBackgroundColor,
                data: tempData
            });
          }
        } else {
          datasets.push({
                borderColor: x.colors.borderColor,
                backgroundColor: x.colors.backgroundColor,
                hoverBorderColor: x.colors.hoverBorderColor,
                hoverBackgroundColor: x.colors.hoverBackgroundColor,
                data: x.data});
        }
        break;
        case "Scatter":
        for (i = 0, len = x.data.length; i < len; i ++){
          datasets.push({
              label: x.dataLabels[i],
              borderColor: x.colors.borderColor[i],
              backgroundColor: x.colors.backgroundColor[i],
              pointBorderColor: x.colors.pointBorderColor[i],
              pointBackgroundColor: x.colors.pointBackgroundColor[i],
              data: x.data[i]
          });
        }
        break;
    }

    data  = {
      labels: x.labels,
      datasets: datasets
    };

    console.log(data);
    var canvas = document.getElementById(el.id);
    var ctx = canvas.getContext("2d");
    var chartOptions = x.options;

    switch(x.type){
      case "Bar":
        if (x.stacked){
          chartOptions.scales = {
             xAxes: [{
               stacked: true,
               }],
               yAxes: [{
                 stacked: true
                 }]
          };
        }
        outChart = new Chart(ctx, {
          type: 'bar',
          data: data,
          options: chartOptions
          });
      break;
      case "Line":
        outChart = new Chart(ctx, {
          type: 'line',
          data: data,
          options: chartOptions
        });
      break;
      case "Radar":
        outChart = new Chart(ctx, {
          type: 'radar',
          data: data,
          options: chartOptions
        });
      break;
      case "Pie":
        outChart = new Chart(ctx, {
          type: 'pie',
          data: data,
          options: chartOptions
        });
      break;
      case "PolarArea":
        outChart = new Chart(ctx, {
          type: 'polararea',
          data: data,
          options: chartOptions
        });
      break;
      case "Scatter":
        outChart = Chart.Scatter(ctx, {
          data: data,
          options: chartOptions
        });
    }
    console.log(outChart);

    // Generate legend and add mouseover event
    /*var legendHolder = document.createElement('div');
    legendHolder.innerHTML = outChart.generateLegend();

    // When the series is mouseovered in the legend, highlight the corresponding elements
    helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
    	helpers.addEvent(legendNode, 'mouseover', function(){
    	  switch(x.type){
          case "Bar":
    		    var activeBars = outChart.datasets[index].bars;
      			  for (var barsIndex = 0; barsIndex < activeBars.length; barsIndex++) {
        			  var activeBar = activeBars[barsIndex];
        				activeBar.save();
        				activeBar.fillColor = activeBar.highlightFill;
        				activeBar.strokeColor = activeBar.highlightStroke;
      				}
      				outChart.draw();

    			  break;
    			case "Pie":
    			case "PolarArea":
    			  var activeSegment = outChart.segments[index];
      		    activeSegment.save();
      			  activeSegment.fillColor = activeSegment.highlightColor;
      			  outChart.showTooltip([activeSegment]);
      			  activeSegment.restore();
      		break;
        }
    	});
    });
    		// Remove highlight after mouseout
    helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
        helpers.addEvent(legendNode, 'mouseout', function(){
    	  switch(x.type){
          case "Bar":
      			var activeBars = outChart.datasets[index].bars;
      			for (var barsIndex = 0; barsIndex < activeBars.length; barsIndex++) {
        			var activeBar = activeBars[barsIndex];
        			activeBar.restore();
      			}
      			outChart.draw();
      			break;
    	  }
      });
    });

    canvas.parentNode.appendChild(legendHolder.firstChild);*/




  },

  resize: function(el, width, height, instance) {
    if (outChart)
      outChart.resize();
  }

});
