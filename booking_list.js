Example Request
{
"userID" : "UserAPI",
"accessToken":"afa175e29411c825035bcf511368896c",
"filterByStatus":"Booking",
"startDate":"2015-10-01",
"endDate":"2015-11-13"
}
Example Response
{
"bookingInfos":
[{
	"flightDetails":[{
		"flightNumber":"Q1-201",
		"fdDepartTime":"2015-12-19T09:00:00",
		"fdArrivalTime":"2015-12-19T09:30:00",
		"fdOrigin":"UPG",
		"fdDestination":"SUB",
		"fdFlightClass":"D"
	},
	{
		"flightNumber":"Q1-101",
		"fdDepartTime":"2015-12-19T13:00:00",
		"fdArrivalTime":"2015-12-19T13:30:00",
		"fdOrigin":"SUB",
		"fdDestination":"CGK",
		"fdFlightClass":"D"
	}],
	"airline":"Trigana Air",
	"airlineID":"TN",
	"bookingCode":"9DW4SR",
	"bookingDate":"2015-11-12T00:00:00",
	"timeLimit":"14-NOV-2015 13:29 (UTC+9)",
	"route":"UPG - CGK",
	"agenFare":365000.00,
	"currency":"IDR",
	"bookingStatus":"Ticketed",
	"pax":1
},
{
	"flightDetails":
	[{
		"flightNumber":"Q1-201",
		"fdDepartTime":"2015-11-21T09:00:00",
		"fdArrivalTime":"2015-11-21T09:30:00",
		"fdOrigin":"UPG",
		"fdDestination":"SUB",
		"fdFlightClass":"D"
	},
	{
		"flightNumber":"Q1-101",
		"fdDepartTime":"2015-11-21T13:00:00",
		"fdArrivalTime":"2015-11-21T13:30:00",
		"fdOrigin":"SUB",
		"fdDestination":"CGK",
		"fdFlightClass":"D"
	}],
	"airline":"Trigana Air",
	"airlineID":"TN",
	"bookingCode":"4QBNY8",
	"bookingDate":"2015-11-03T00:00:00",
	"timeLimit":"05-NOV-2015 15:36 (UTC+9)",
	"route":"UPG - CGK",
	"agenFare":365000.00,
	"currency":"IDR",
	"bookingStatus":"HOLD",
	"pax":1
}],
"filterByStatus":0
"startDate":"2015-10-01T00:00:00",
"endDate":"2015-11-13T00:00:00",
"respTime":"2015-11-13T16:31:00",
"userID":"UserAPI",
"accessToken":"afa175e29411c825035bcf511368896c",
"status":"SUCCESS",
"respMessage":"SUCCESS"
}
