@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forBooking'
@ObjectModel.semanticKey: [ 'BookingID' ]
@Search.searchable: true
define view entity ZC_FE_Booking_001543
  as projection on ZI_FE_Booking_001543
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Booking Number'
      BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Customer',
          element: 'CustomerID'
        }
      } ]
      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: [ 'LastName' ]
      CustomerID,
      _Customer.LastName as LastName,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'zi_fe_carr_001543',
          element: 'AirlineID'
        }
      } ]
      @EndUserText.label: 'Airline'
      @ObjectModel.text.element: [ 'AirlineName' ]
      CarrierID,
      _Carrier.Name      as AirlineName,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'zi_fe_flig_001543',
          element: 'ConnectionID'
        },
        additionalBinding: [ {
          localElement: 'FlightDate',
          element: 'FlightDate'
        }, {
          localElement: 'CarrierID',
          element: 'AirlineID'
        }, {
          localElement: 'FlightPrice',
          element: 'Price'
        }, {
          localElement: 'CurrencyCode',
          element: 'CurrencyCode'
        } ]
      } ]
      ConnectionID,
      @EndUserText.label: 'Flight Date'
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Flight Price'
      FlightPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      _Travel : redirected to parent ZC_FE_Travel_001543,
      _Connection,
      _Flight,
      _Carrier,
      _Currency,
      _Customer

}
