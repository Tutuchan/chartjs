HTMLWidgets.widget({

  name: 'chartjs',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {
    var data  = {
      labels: x.x,
      datasets:[
        {
          label: "toto",
          fillColor: "rgba(220,220,220,0.2)",
          strokeColor: "rgba(220,220,220,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: x.y
        }
      ]
    };
    var ctx = document.getElementById(el.id).getContext("2d");
    instance.chart = new Chart(ctx).Line(data);



  },

  resize: function(el, width, height, instance) {
    if (instance.chart)
      instance.chart.resize();
  }

});
