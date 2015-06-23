HTMLWidgets.widget({

  name: 'chartjs',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {

    console.log(x.y[0]);
    console.log(x);

    var datasets = [];

    for (i = 0, len = x.y.length; i < len; i ++){
      datasets.push({
          label: x.labels[i],
          strokeColor: x.colors[i],
          fillColor: "rgba(0,0,0,0)",
          pointColor: x.colors[i],
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: x.colors[i],
          data: x.y[i]
      });
    }

    console.log(datasets);

    var data  = {
      labels: x.x,
      datasets: datasets
    };

    var ctx = document.getElementById(el.id).getContext("2d");

    if (x.type === "Bar"){
      instance.chart = new Chart(ctx).Bar(data);
    } else if (x.type === "Line"){
      instance.chart = new Chart(ctx).Line(data, {
        responsive : true,
        animation: true,
        multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"
      });
    }




  },

  resize: function(el, width, height, instance) {
    if (instance.chart)
      instance.chart.resize();
  }

});
