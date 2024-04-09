sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/fe/demo/travellist/test/integration/FirstJourney',
		'sap/fe/demo/travellist/test/integration/pages/TravelList',
		'sap/fe/demo/travellist/test/integration/pages/TravelObjectPage',
		'sap/fe/demo/travellist/test/integration/pages/BookingObjectPage'
    ],
    function(JourneyRunner, opaJourney, TravelList, TravelObjectPage, BookingObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/fe/demo/travellist') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelList: TravelList,
					onTheTravelObjectPage: TravelObjectPage,
					onTheBookingObjectPage: BookingObjectPage
                }
            },
            opaJourney.run
        );
    }
);