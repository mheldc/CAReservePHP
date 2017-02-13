class Timer extends React.Component {
  constructor(props) {
    super(props);
    this.state = { secondsElapsed: 0 };
  }

  tick() {
    this.setState(prevState => ({
      secondsElapsed: prevState.secondsElapsed + 1
    }));
  }

  componentDidMount() {
    this.interval = setInterval(() => this.tick(), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    return React.createElement(
      "div",
      null,
      "Seconds Elapsed: ",
      this.state.secondsElapsed
    );
  }
}

/*
var ActiveBookings = React.createClass({
	getInitialState: function() {
		return {bData:[]}
	},
	componentDidMount: function() {
		
	},
	componentWillUnmount: function() {
		
	},
	getActiveBookings: function() {
		
	}
	render: function() {
		
	}
});
*/

function tick() {
	const bookingRow =
	(
		React.createElement("tr", {style:{width:100+"%", fontFamily:"Calibri"}},
			React.createElement("td", {"className":"col-sm-1"}, 1),
			React.createElement("td", {"className":"col-sm-3"}, 'Dela Cruz, Juan D.'),
			React.createElement("td", {"className":"col-sm-6"}, 'UM01 - Umbrella 1'),
			React.createElement("td", {"className":"col-sm-2"}, 10),
			React.createElement("td", {"className":"col-sm-1"},
				React.createElement("a", {"href":"#"},
					React.createElement("span", {"className":"fa-stack faa-flash animated",style:{color:"red"}},
						React.createElement("i", {"className":"fa fa-square-o fa-stack-2x"}),
						React.createElement("i", {"className":"fa fa-clock-o fa-stack-1x"})
					)					
				)
			),
			React.createElement("td", {"className":"col-sm-1"},
				React.createElement("a", {"href":"#", "data-toggle":"modal", "data-target":"#paymentmodal", style:{visibility  :"visible"}},
					React.createElement("span", {"className":"fa-stack"},
						React.createElement("i", {"className":"fa fa-square-o fa-stack-2x"}),
						React.createElement("i", {"className":"fa fa-dollar fa-stack-1x"})
					)					
				)
			),
			React.createElement("td", {"className":"col-sm-1"},
				React.createElement("a", {"href":"#", "data-toggle":"modal", "data-target":"#addguestmodal"},
					React.createElement("span", {"className":"fa-stack"},
						React.createElement("i", {"className":"fa fa-square-o fa-stack-2x"}),
						React.createElement("i", {"className":"fa fa-group fa-stack-1x"})
					)					
				)
			),
			React.createElement("td", {"className":"col-sm-1"},
				React.createElement("a", {"href":"#", "data-toggle":"modal", "data-target":"#changeaccmodal"},
					React.createElement("span", {"className":"fa-stack"},
						React.createElement("i", {"className":"fa fa-square-o fa-stack-2x"}),
						React.createElement("i", {"className":"fa fa-home fa-stack-1x"})
					)					
				)
			),
			React.createElement("td", {"className":"col-sm-1"},
				React.createElement("a", {"href":"#", "data-toggle":"modal", "data-target":"#guestreqmodal"},
					React.createElement("span", {"className":"fa-stack"},
						React.createElement("i", {"className":"fa fa-square-o fa-stack-2x"}),
						React.createElement("i", {"className":"fa fa-paste fa-stack-1x"})
					)					
				)
			)
		)
	);

	const element2 =
		(React.createElement("div", null, 
			React.createElement("h1", null, "Hello, world!"),
			React.createElement("h2", null, "It is " + new Date().toLocaleString() + "."))
		);
  
  ReactDOM.render(bookingRow, document.getElementById('bookingcontents'));
}

setInterval(tick, 1000);

ReactDOM.render(React.createElement(Timer, null), this.document.getElementById('ctrlrb'));