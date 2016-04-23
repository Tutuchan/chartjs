HTMLWidgets.widget({

  name: 'chartjs',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {
    //console.log(instance.cjs.generateLegend());
    helpers = Chart.helpers;

    var datasets = [];
    var data = [];
    console.log(x);

    // Final chart data
    data  = {
      labels: x.data.labels,
      datasets: x.data.datasets,
      legendTitle: x.legendTitle
    };

    console.log(data);

    // Get element in page
    var canvas = document.getElementById(el.id);
    var ctx = canvas.getContext("2d");

    // If a previous chart exists, destroy it
    if (instance.cjs) {
      instance.cjs.destroy();
      instance.cjs = null;
    }

    // Handle options
    var chartOptions = x.options;
    console.log(chartOptions);

    // Handle scales

    var scales = x.scales;
    chartOptions.scales = {
      xAxes: jQuery.makeArray(scales.x),
      yAxes: jQuery.makeArray(scales.y)
    };

    // Create actual chart
    instance.cjs = new Chart(ctx, {
          type: x.type,
          data: data,
          options: chartOptions
          });

    console.log(instance.cjs);


  },

  resize: function(el, width, height, instance) {
    if (instance.cjs)
      instance.cjs.resize();
  }

});
